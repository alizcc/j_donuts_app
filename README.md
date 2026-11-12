# J'Donuts

A working slice of the J'Donuts customer app: fake login and registration with real validation, Home and Product detail served from a local database that works offline, and an animated Rewards screen.

## Versions

| Tool | Version |
| --- | --- |
| Flutter | 3.47.9 (stable) |
| Dart | 3.13.7 |
| Lints | very_good_analysis 11 |

## How to run

```sh
flutter pub get
flutter run
```

Generated code (`*.g.dart`, `*.freezed.dart`, `lib/l10n/gen`) is committed, so `build_runner` is not needed to run the app. After changing a model, table or provider:

```sh
dart run build_runner build -d
```

Tests:

```sh
flutter analyze
flutter test                                       # unit + widget
flutter test integration_test                      # Register → Home → Product detail (needs a device/simulator)
```

Builds:

```sh
flutter build apk --release                        # build/app/outputs/flutter-apk/app-release.apk
flutter build ios --simulator                      # build/ios/iphonesimulator/Runner.app
```

The release APK is signed with the debug key so it installs without extra setup.

## Fake OTP

The OTP code is **`123456`**. Any other 6-digit code is rejected (`FakeAuthRepository.fakeOtpCode`).

Validation rules (pure functions in `features/auth/domain/validators`):

- **Phone**: Myanmar mobile number. Spaces and dashes are allowed, plus one optional leading `0`, then `9` and 7–9 digits. It is normalised to `+959…`.
- **Name**: 1–50 characters after trimming, letters and spaces only (Burmese script included). Last name is optional.
- **Date of birth**: at least 13 years old.

A new phone number goes OTP → Name → Date of birth → Welcome. A registered number goes from OTP straight to Home. Users are stored in Drift, and the signed-in phone is kept in `flutter_secure_storage`.

## Architecture

Feature-first, with three layers inside each feature:

- **domain**: entities (freezed), repository interfaces, validators. Pure Dart, no Flutter imports.
- **data**: Drift tables, repository implementations, Riverpod providers that wire them up.
- **presentation**: screens, widgets, controllers.

Presentation depends only on domain interfaces, so swapping the fake auth or the fake remote source for a real one only touches `data`.

Errors are returned, never thrown across layers: repositories return a sealed `Result<T>` (`Success` / `Err`) carrying a typed `Failure` (`NetworkFailure`, `StorageFailure`, `NotFoundFailure`, `UnexpectedFailure`). Every screen has loading, error and empty states.

### Folder map

```
lib/
├── main.dart                 reads the saved session, then starts the app
├── app/                      MaterialApp, tab shell, bottom nav bar
├── core/
│   ├── database/             Drift AppDatabase, schema version + migrations
│   ├── l10n/                 context.l10n shortcut
│   ├── motion/               AppMotion durations/curves, Reduce Motion helpers
│   ├── network/              connectivity + reachability providers
│   ├── result/               Result<T> and Failure types
│   ├── router/               go_router config, routes, auth redirect, page transitions
│   ├── theme/                colour, typography and spacing tokens, ThemeData
│   └── widgets/              shared widgets (buttons, skeletons, image, offline banner…)
├── features/
│   ├── auth/                 onboarding, phone, OTP, name, date of birth, welcome
│   ├── home/                 Home screen, catalog seed/refresh, banners, shops, sections
│   ├── product/              /product/:id detail screen
│   ├── member/               member profile and points, shared by Home and Rewards
│   ├── rewards/              Rewards screen, challenges, custom painters
│   └── settings/             log out
└── l10n/
    ├── arb/                  app_en.arb, app_my.arb (Burmese)
    └── gen/                  generated AppLocalizations
```

### Routing

go_router with a `StatefulShellRoute` for the five tabs (Home, Reward, Scan, Wallet, Settings), so each tab keeps its own stack. A redirect guard (`core/router/auth_redirect.dart`) keeps signed-out users on the public auth routes and signed-in users out of them. Product detail lives at `/product/:id`, outside the shell.

### Theme and text

Colours, type and spacing are tokens in `core/theme`, and widgets never use raw colours. All strings come from ARB files through gen-l10n, in English and Burmese.

## State management

**Riverpod 3** with `riverpod_generator`.

- Providers are generated and type-checked, so wiring mistakes show up at compile time.
- Drift `watch()` queries map directly onto stream providers, so the UI updates automatically when the database changes.
- Any provider can be overridden in tests (in-memory database, fake repositories) without touching production code.
- The data layer never needs a `BuildContext`.

The multi-step auth flow lives in `AuthFlowController` and `OtpController` (Notifiers with freezed state). Read-only screens just watch stream or future providers.

## Offline strategy

The local database is the single source of truth: screens only ever read from Drift, never from the network.

1. **Seed**: on first launch, `CatalogSeeder` loads `assets/seed/catalog.json` into Drift (products, banners, shops, home sections, member, challenges). Every data provider waits on `catalogSeedProvider`, so no query runs against an empty database.
2. **Read**: Home, Product detail and Rewards watch Drift streams, so they render fully in airplane mode, including on a cold start. Rewards reads points and challenges from the same member record as Home.
3. **Refresh**: `DriftHomeRepository.refresh()` first checks reachability, then fetches the catalog and saves it in one transaction. The open streams pick up the new data. A refresh runs on pull-to-refresh and automatically when the connection comes back. If it fails, a snackbar appears and the cached data stays on screen.
4. **Connectivity**: `connectivity_plus` reports interface changes, and a real reachability check (a DNS lookup with a timeout) confirms there is actual internet. An offline banner slides in on the tab shell and on Product detail.
5. **Images**: `cached_network_image` keeps a disk cache. If an image can't load (offline and not cached yet), the bundled asset copy is shown instead.
6. **Migrations**: the Drift schema is at version 3, with step-by-step `onUpgrade` migrations covered by `test/core/database/app_database_migration_test.dart`.

There is no real server. `FakeCatalogRemoteSource` returns `assets/seed/catalog_remote.json` after a one-second delay, behind the `CatalogRemoteSource` interface.

## Animations

All durations, curves and scales are named constants in `core/motion/app_motion.dart`. When Reduce Motion is on (`MediaQuery.disableAnimations`), `context.motion()` sets durations to zero and page transitions are skipped.

| Where | What | How |
| --- | --- | --- |
| Page transitions | Shared-axis slide between auth steps; fade-through for onboarding, welcome and product | `animations` package, `core/router/route_transitions.dart` |
| Onboarding, Welcome | Content enters in a stagger (fade + slide up) | `Entrance` widget |
| Buttons, tiles | Scale down on press | `PressableScale` |
| Primary button | Morphs between label and spinner while loading | `AnimatedContainer` + `AnimatedSwitcher` |
| Auth steps | Progress ring fills step by step | `TweenAnimationBuilder` |
| OTP | Shakes on a wrong code | `AnimationController` |
| Home | Skeleton shimmer while loading, cross-fade from loading to content, staggered sections, auto-advancing banner carousel | `shimmer`, `AnimatedSwitcher`, `Entrance`, `PageView` |
| Product | Image flies from tile to detail; quantity number swaps on change; add-to-cart state switch | `Hero`, `AnimatedSwitcher` |
| Rewards: points ring | Ring sweeps to the member's progress while the total counts up | `CustomPainter` + `TweenAnimationBuilder` |
| Rewards: tier ladder | Silver, Gold, Platinum appear in order; current tier highlighted; line to the next tier fills | `Entrance` with stagger, `AnimatedScale`, tween |
| Rewards: tabs | Active tab pill changes; card list fades and slides on switch | `AnimatedContainer`, `AnimatedSwitcher` |
| Rewards: challenges | Cards enter staggered; donut colours in by quarters, coffee arc fills to 9/12 | `CustomPainter` + tween |
| Rewards: Earn | Pulses when a challenge is complete, grey otherwise, press feedback | `TweenAnimationBuilder`, `PressableScale` |
| Rewards: badge | Pops in on entry | `TweenAnimationBuilder` with overshoot |
| Bottom nav | Active item grows into a pill | `AnimatedContainer`, `AnimatedSize` |
| Offline banner | Slides in and out | `AnimatedSize` |

## Tests

```
test/
├── core/            Result, database migrations
└── features/
    ├── auth/        validators (phone, OTP, name, date of birth), auth flow controller,
    │                widget tests for phone, OTP, name and date-of-birth screens
    ├── home/        seeder, fake remote source, home repository (refresh online/offline)
    └── member/      member model
integration_test/
└── register_to_product_test.dart   Register → Home → Product detail
```

Test names describe behaviour, e.g. `returns NetworkFailure when offline and keeps cached data`.

## Known gaps

- **No mock server.** The "remote" catalog is a bundled JSON file behind an interface, so Dio, timeouts, retry and logging interceptors are not implemented.
- **Onboarding donut circles** don't drift in. The onboarding content enters with a staggered fade/slide instead (`AppMotion.drift` is defined but unused).
- **Sliding indicators**: the bottom-nav pill and the Rewards tab indicator animate in place on each item rather than as one indicator sliding between positions.
- **Placeholders**: Scan and Wallet tabs are placeholder screens. Add to cart, Rewards, Earn and Gift give visual feedback only, as the brief allows.
- **Release signing** uses the debug key.
- **No CI** workflow.
- **Reachability** is a DNS lookup of `example.com`, which a captive portal could fool.

## Time spent

about 33 hours.
