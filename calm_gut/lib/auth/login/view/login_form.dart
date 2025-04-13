import 'package:calm_gut/app/utils/router/routes.dart';
import 'package:calm_gut/auth/login/cubit/login_cubit.dart';
import 'package:calm_gut/core/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ??
                      AppLocalizations.of(context)!.authenticationFailure,
                ),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, 1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.welcomeMessage,
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                        fontSize: 32,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _LoginButton(),
              const SizedBox(height: 8),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final email = context.select((LoginCubit cubit) => cubit.state.email);
    late final String? errorText;
    switch (email.displayError) {
      case EmailValidationError.invalid:
        errorText = AppLocalizations.of(context)!.invalidEmail;
      default:
        errorText = null;
    }
    return TextField(
      key: const Key('loginForm_emailInput_textField'),
      onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
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
    final password = context.select((LoginCubit cubit) => cubit.state.password);
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
      key: const Key('loginForm_passwordInput_textField'),
      onChanged:
          (password) => context.read<LoginCubit>().passwordChanged(password),
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: AppLocalizations.of(context)!.password.toLowerCase(),
        helperText: '',
        errorText: errorText,
        errorStyle: TextStyle(overflow: TextOverflow.fade),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginCubit cubit) => cubit.state.status.isInProgress,
    );

    final isValid = context.select((LoginCubit cubit) => cubit.state.isValid);

    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      style: customElevatedButtonStyle(context),
      onPressed:
          isValid
              ? () => context.read<LoginCubit>().logInWithCredentials()
              : null,
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child:
              !isInProgress
                  ? Text(AppLocalizations.of(context)!.login.toUpperCase())
                  : SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
        ),
      ),
    );
  }
}

// ignore: unused_element
class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
      label: const Text('SIGN IN WITH GOOGLE'),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () => GoRouter.of(context).push(Routes.signUp),
      child: Text(
        AppLocalizations.of(context)!.createAccount.toUpperCase(),
        style: TextStyle(color: colorScheme.secondary),
      ),
    );
  }
}
