import 'package:calm_gut/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:calm_gut/core/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ??
                      AppLocalizations.of(context)!.signUpFailure,
                ),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _EmailInput(),
            _PasswordInput(),
            _ConfirmPasswordInput(),
            const SizedBox(height: 8),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final email = context.select((SignUpCubit cubit) => cubit.state.email);
    late final String? errorText;
    switch (email.displayError) {
      case EmailValidationError.invalid:
        errorText = AppLocalizations.of(context)!.invalidEmail;
      default:
        errorText = null;
    }

    return TextField(
      key: const Key('signUpForm_emailInput_textField'),
      onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: AppLocalizations.of(context)!.email.toLowerCase(),
        helperText: '',
        errorText: errorText,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final password = context.select(
      (SignUpCubit cubit) => cubit.state.password,
    );
    late final String? errorText;
    switch (password.displayError) {
      case PasswordValidatorError.invalid:
        errorText = AppLocalizations.of(context)!.passwordNoLetters;
      case PasswordValidatorError.short:
        errorText = AppLocalizations.of(context)!.shortPassword;
      default:
        errorText = null;
    }
    return TextField(
      key: const Key('signUpForm_passwordInput_textField'),
      onChanged:
          (password) => context.read<SignUpCubit>().passwordChanged(password),
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: AppLocalizations.of(context)!.password.toLowerCase(),
        helperText: '',
        errorText: errorText,
      ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final confirmedPassword = context.select(
      (SignUpCubit cubit) => cubit.state.confirmedPassword,
    );
    late final String? errorText;
    switch (confirmedPassword.displayError) {
      case ConfirmedPasswordValidationError.invalid:
        errorText = AppLocalizations.of(context)!.passwordNoLetters;
        break;
      default:
        errorText = null;
    }
    return TextField(
      key: const Key('signUpForm_confirmedPasswordInput_textField'),
      onChanged:
          (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: AppLocalizations.of(context)!.confirmPassword.toLowerCase(),
        helperText: '',
        errorText: errorText,
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (SignUpCubit cubit) => cubit.state.status.isInProgress,
    );
    final isValid = context.select((SignUpCubit cubit) => cubit.state.isValid);
    return ElevatedButton(
      key: const Key('signUpForm_continue_raisedButton'),
      style: customElevatedButtonStyle(context),
      onPressed:
          isValid
              ? () {
                context.read<SignUpCubit>().signUpFormSubmitted();
                context.pop();
              }
              : null,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              !isInProgress
                  ? Text(AppLocalizations.of(context)!.signUp.toUpperCase())
                  : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
