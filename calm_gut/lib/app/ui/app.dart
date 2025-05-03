import 'package:authentication_repository/authentication_repository.dart';
import 'package:calm_gut/app/bloc/app_bloc.dart';
import 'package:calm_gut/app/localization/cubit/localization_cubit.dart';
import 'package:calm_gut/app/utils/router/router.dart';
import 'package:calm_gut/app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (_) =>
                    AppBloc(authenticationRepository: _authenticationRepository)
                      ..add(const AppUserSubscriptionRequested()),
          ),
          BlocProvider(create: (context) => LocalizationCubit()),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme();
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.select((LocalizationCubit cubit) => cubit.state.locale),
      debugShowCheckedModeBanner: false,
      title: 'Innowatt',
      theme: MaterialTheme(TextTheme().apply(fontFamily: 'Montserrat')).light(),
      // darkTheme:
      //     MaterialTheme(TextTheme().apply(fontFamily: 'Montserrat')).dark(),
      routerConfig: router(context.watch<AppBloc>()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
            onPressed: context.read<AuthenticationRepository>().logOut,
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const Text('...in progress'),
    );
  }
}
