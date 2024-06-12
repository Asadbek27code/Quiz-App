import 'package:asadbek_router_lesson/core/router/router_name.dart';
import 'package:asadbek_router_lesson/pages/auth/sing_in.dart';
import 'package:asadbek_router_lesson/pages/auth/sing_in_code.dart';
import 'package:asadbek_router_lesson/pages/auth/sing_up.dart';
import 'package:asadbek_router_lesson/pages/main/home_page.dart';
import 'package:asadbek_router_lesson/pages/main/level_page.dart';
import 'package:asadbek_router_lesson/pages/main/main_page.dart';
import 'package:asadbek_router_lesson/pages/main/profile_page.dart';
import 'package:asadbek_router_lesson/pages/splesh_page.dart';
import 'package:go_router/go_router.dart';

final class GoRouterSystem {
  static GoRouter router = GoRouter(
    initialLocation: AppRouterName.main,
    routes: [
      GoRoute(
        path: AppRouterName.splesh,
        builder: (context, state) => const SpleshPage(),
      ),
      GoRoute(
        path: AppRouterName.singIn,
        builder: (context, state) => const SingInPage(),
      ),
      GoRoute(
        path: AppRouterName.singUp,
        builder: (context, state) => const SingUpPage(),
      ),
      GoRoute(
        path: AppRouterName.singInCode,
        builder: (context, state) => const SingInCodePage(),
      ),
      GoRoute(
        path: AppRouterName.main,
        builder: (context, state) => const MainPage(child: HomePage()),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainPage(child: child);
        },
        routes: [
          GoRoute(
            path: AppRouterName.home,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: AppRouterName.level,
            builder: (context, state) => const LevelPage(),
          ),
          GoRoute(
            path: AppRouterName.profile,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
}
