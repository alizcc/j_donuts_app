import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:j_donuts_app/core/l10n/l10n.dart';
import 'package:j_donuts_app/core/theme/app_colors.dart';
import 'package:j_donuts_app/core/theme/app_spacing.dart';
import 'package:j_donuts_app/core/theme/app_typography.dart';
import 'package:j_donuts_app/features/auth/domain/validators/date_of_birth_validator.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_controller.dart';
import 'package:j_donuts_app/features/auth/presentation/controllers/auth_flow_state.dart';
import 'package:j_donuts_app/features/auth/presentation/widgets/auth_step_scaffold.dart';

class DateOfBirthScreen extends ConsumerStatefulWidget {
  const DateOfBirthScreen({super.key});

  @override
  ConsumerState<DateOfBirthScreen> createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends ConsumerState<DateOfBirthScreen> {
  static const int _monthsInYear = 12;
  static const int _dayDigits = 2;
  static const int _yearDigits = 4;

  late final TextEditingController _day = TextEditingController(
    text: ref.read(authFlowControllerProvider).birthDay?.toString(),
  );
  late final TextEditingController _year = TextEditingController(
    text: ref.read(authFlowControllerProvider).birthYear?.toString(),
  );

  @override
  void dispose() {
    _day.dispose();
    _year.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    FocusScope.of(context).unfocus();
    final next = await ref
        .read(authFlowControllerProvider.notifier)
        .submitDateOfBirth();
    if (next != null && mounted) context.go(next);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = ref.watch(authFlowControllerProvider);
    final notifier = ref.read(authFlowControllerProvider.notifier);
    final error = validateDateOfBirth(
      year: state.birthYear,
      month: state.birthMonth,
      day: state.birthDay,
      today: DateTime.now(),
    );

    return AuthStepScaffold(
      step: 4,
      title: l10n.dobTitle,
      isLoading: state.isLoading,
      onContinue: error == null ? _continue : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMonthField(state),
          const SizedBox(height: AppSpacing.lg),
          _buildNumberField(
            controller: _day,
            hint: l10n.dayHint,
            maxDigits: _dayDigits,
            onChanged: notifier.setBirthDay,
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildNumberField(
            controller: _year,
            hint: l10n.yearHint,
            maxDigits: _yearDigits,
            onChanged: notifier.setBirthYear,
          ),
          if (_message(error) case final message?) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: AppTypography.bodySmall.copyWith(color: AppColors.error),
            ),
          ],
          if (state.hasError) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              l10n.genericError,
              style: AppTypography.bodySmall.copyWith(color: AppColors.error),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMonthField(AuthFlowState state) {
    final locale = Localizations.localeOf(context).toString();
    final monthName = DateFormat.MMMM(locale);
    return DropdownButtonFormField<int>(
      initialValue: state.birthMonth,
      hint: Text(context.l10n.monthHint),
      items: [
        for (var month = 1; month <= _monthsInYear; month++)
          DropdownMenuItem(
            value: month,
            child: Text(monthName.format(DateTime(2000, month))),
          ),
      ],
      onChanged: ref.read(authFlowControllerProvider.notifier).setBirthMonth,
    );
  }

  Widget _buildNumberField({
    required TextEditingController controller,
    required String hint,
    required int maxDigits,
    required ValueChanged<int?> onChanged,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(maxDigits),
      ],
      decoration: InputDecoration(hintText: hint),
      onChanged: (value) => onChanged(int.tryParse(value)),
    );
  }

  String? _message(DateOfBirthError? error) {
    final l10n = context.l10n;
    return switch (error) {
      DateOfBirthError.invalidDate => l10n.dobErrorInvalid,
      DateOfBirthError.inFuture => l10n.dobErrorFuture,
      DateOfBirthError.tooYoung => l10n.dobErrorTooYoung(minimumAge),
      DateOfBirthError.incomplete || null => null,
    };
  }
}
