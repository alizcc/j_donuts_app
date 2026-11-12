import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/features/auth/domain/validators/name_validator.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_controller.dart';
import 'package:j_donuts_app/features/auth/presentation/widgets/auth_step_scaffold.dart';

class NameScreen extends ConsumerStatefulWidget {
  const NameScreen({super.key});

  @override
  ConsumerState<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends ConsumerState<NameScreen> {
  late final TextEditingController _firstName = TextEditingController(
    text: ref.read(authFlowControllerProvider).firstName,
  );
  late final TextEditingController _lastName = TextEditingController(
    text: ref.read(authFlowControllerProvider).lastName,
  );

  bool _firstNameEdited = false;
  bool _lastNameEdited = false;

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    final next = ref.read(authFlowControllerProvider.notifier).submitName();
    await context.push(next);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = ref.watch(authFlowControllerProvider);
    final notifier = ref.read(authFlowControllerProvider.notifier);
    final firstError = validateName(state.firstName, isRequired: true);
    final lastError = validateName(state.lastName, isRequired: false);
    final isValid = firstError == null && lastError == null;

    return AuthStepScaffold(
      step: 3,
      title: l10n.nameTitle,
      onContinue: isValid ? _continue : null,
      body: Column(
        children: [
          TextField(
            controller: _firstName,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: l10n.firstNameHint,
              errorText: _firstNameEdited ? _message(firstError) : null,
            ),
            onChanged: (value) {
              setState(() => _firstNameEdited = true);
              notifier.setFirstName(value);
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          TextField(
            controller: _lastName,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintText: l10n.lastNameHint,
              errorText: _lastNameEdited ? _message(lastError) : null,
            ),
            onChanged: (value) {
              setState(() => _lastNameEdited = true);
              notifier.setLastName(value);
            },
          ),
        ],
      ),
    );
  }

  String? _message(NameError? error) {
    final l10n = context.l10n;
    return switch (error) {
      NameError.empty => l10n.nameErrorEmpty,
      NameError.tooLong => l10n.nameErrorTooLong(maxNameLength),
      NameError.invalidCharacters => l10n.nameErrorInvalid,
      null => null,
    };
  }
}
