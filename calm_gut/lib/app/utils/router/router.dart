import 'dart:async';

import 'package:calm_gut/app/bloc/app_bloc.dart';
import 'package:calm_gut/app/utils/router/routes.dart';
import 'package:calm_gut/article/ui/articles_view.dart';
import 'package:calm_gut/article/ui/single_article_view.dart';
import 'package:calm_gut/auth/login/view/login_page.dart';
import 'package:calm_gut/auth/sign_up/view/sign_up_page.dart';
import 'package:calm_gut/chat/view/chat_screen.dart';
import 'package:calm_gut/diary/ui/diary_screen.dart';
import 'package:calm_gut/mood/popup/cubit/mood_test_cubit.dart';
import 'package:calm_gut/mood/popup/ui/mood_popup.dart';
import 'package:calm_gut/profile/ui/profile_screen.dart';
import 'package:calm_gut/settings/ui/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
part 'scaffold_with_navbar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

GoRouter router(AppBloc bloc) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.login,
    routes: <RouteBase>[
      GoRoute(
        builder: (context, state) => const LoginPage(),
        path: Routes.login,
      ),
      GoRoute(
        builder: (context, state) => const SignUpPage(),
        path: Routes.signUp,
      ),
      GoRoute(
        builder:
            (context, state) => BlocProvider.value(
              value: state.extra! as MoodTestCubit,
              child: MoodPopup(),
            ),
        path: Routes.moodPopup,
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return _ScaffoldWithNavbar(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                builder: (context, state) => const ChatScreen(),
                path: Routes.chatRoutes.allChats,
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                builder: (context, state) => const DiaryScreen(),
                path: Routes.diaryRoutes.main,
                routes: <RouteBase>[
                  GoRoute(
                    builder: (context, state) => const ArticlesView(),
                    path: Routes.diaryRoutes.articles,
                    routes: <RouteBase>[
                      GoRoute(
                        path: '/:articleIndex',
                        builder:
                            (context, state) => SingleArticleView(
                              index: int.parse(
                                state.pathParameters['articleIndex']!,
                              ),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                builder: (context, state) => const ProfileScreen(),
                path: Routes.profileRoutes.profile,
                routes: <RouteBase>[
                  GoRoute(
                    builder: (context, state) => const SettingsScreen(),
                    path: Routes.profileRoutes.settings.partialPath,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final authenticated = bloc.state.status.isAuthenticated;
      final onLoginPage = state.matchedLocation == Routes.login;
      final onSignUpPage = state.matchedLocation == Routes.signUp;

      if (!authenticated) {
        return !onSignUpPage ? Routes.login : null;
      }
      if (onLoginPage) {
        return Routes.diary;
      }
      return null;
    },
    refreshListenable: bloc,
  );
}

extension on AppStatus {
  bool get isAuthenticated => this == AppStatus.authenticated;
}

class StreamListenable extends ChangeNotifier {
  StreamListenable(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((dynamic change) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
