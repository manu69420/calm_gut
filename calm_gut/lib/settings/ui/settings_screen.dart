import 'package:authentication_repository/authentication_repository.dart';
import 'package:calm_gut/app/localization/cubit/localization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Locale locale;
  @override
  void initState() {
    locale = context.read<LocalizationCubit>().state.locale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context)!.chooseLanguage),
              trailing: DropdownButton(
                items: [
                  DropdownMenuItem(value: Locale('en'), child: Text("English")),
                  DropdownMenuItem(value: Locale('ru'), child: Text("Русский")),
                  DropdownMenuItem(value: Locale('kk'), child: Text("Қазақша")),
                ],
                value: locale,
                onChanged: (newLocale) {
                  setState(() {
                    locale = newLocale ?? locale;
                  });
                },
                icon: Icon(Icons.language),
              ),
            ),
            const SizedBox(height: 50),
            _LogOutAndSaveButtons(locale: locale),
          ],
        ),
      ),
    );
  }
}

class _LogOutAndSaveButtons extends StatelessWidget {
  const _LogOutAndSaveButtons({required this.locale});

  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: TextButton.icon(
        label: Text(
          AppLocalizations.of(context)!.logOut,
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        icon: Icon(Icons.logout, color: Theme.of(context).colorScheme.error),
        onPressed:
            () async => await context.read<AuthenticationRepository>().logOut(),
      ),
      trailing: ElevatedButton.icon(
        onPressed: () {
          context.read<LocalizationCubit>().onToggleLocale(locale);
        },
        style: ElevatedButton.styleFrom(),
        label: Text(AppLocalizations.of(context)!.save),
        icon: Icon(Icons.save),
      ),
    );
  }
}
