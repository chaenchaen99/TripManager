import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_manager/config/router/router_names.dart';
import 'package:trip_manager/config/router/scaffold_with_nav_bar.dart';
import 'package:trip_manager/models/ai/response_model.dart';
import 'package:trip_manager/views/ai/ai_course_detail_page.dart';
import 'package:trip_manager/views/ai/ai_course_page.dart';
import 'package:trip_manager/views/auth/signin/signin_page.dart';
import 'package:trip_manager/views/auth/signup/fourth_step_signup_page.dart';
import 'package:trip_manager/views/auth/signup/second_step_signup_page.dart';
import 'package:trip_manager/views/bookmark/bookmark_page.dart';
import 'package:trip_manager/views/feed/feed_page.dart';
import 'package:trip_manager/views/home/home_page.dart';
import 'package:trip_manager/views/my/my_page.dart';
import 'package:trip_manager/views/page_not_found.dart';
import 'package:trip_manager/views/placeDetail/place_detail.dart';
import 'package:trip_manager/views/search/search_page.dart';
import '../../views/auth/signup/third_step_signup_page.dart';
import '../../views/auth/signup/first_step_signup_page.dart';
import '../../views/auth/start/start_page.dart';

part 'router_provider.g.dart';

//Navigator는 플러터앱에서 화면간의 이동을 관리하는 객체인데,
//루트 Navigator외에도 특정 세션이나 탭 내에서 별도의 Navigator를 가질 수 있다.
//따라서 GlobalKey를 통해 특정 네비게이터를 식별하고 접근하기 위해 필요하다.
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter route(RouteRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/start',
    routes: [
      GoRoute(
        path: '/start',
        name: RouteNames.start,
        builder: (context, state) => const StartPage(),
      ),
      GoRoute(
        path: '/signin',
        name: RouteNames.signin,
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) => const FirstStepSignupPage(),
        routes: [
          GoRoute(
              path: 'email',
              name: RouteNames.email,
              builder: (context, state) => const SecondStepSignupPage(),
              routes: [
                GoRoute(
                    path: 'password',
                    name: RouteNames.passsword,
                    builder: (context, state) => const ThirdStepSignupPage(),
                    routes: [
                      GoRoute(
                        path: 'makeProfile',
                        name: RouteNames.makeProfile,
                        builder: (context, state) =>
                            const FourthStepSignupPage(),
                      ),
                    ]),
              ]),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/home',
                name: RouteNames.home,
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                    path: 'search',
                    name: RouteNames.search,
                    builder: (context, state) => const SearchPage(),
                  ),
                  GoRoute(
                      path: 'placeDetail',
                      name: RouteNames.placeDetail,
                      builder: (context, state) {
                        final placeId = state.extra as String;
                        return PlaceDetailPage(placeId: placeId);
                      }),
                ])
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/ai',
              name: RouteNames.ai,
              builder: (context, state) => const AiCoursePage(),
            ),
            GoRoute(
                path: '/aiDetail',
                name: RouteNames.aiDetail,
                builder: (context, state) {
                  // `extra`를 통해 전달된 데이터 가져오기
                  final AiResponse courseItem = state.extra as AiResponse;
                  return AiCourseDetailPage(courseItem: courseItem);
                }),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/feed',
              name: RouteNames.feed,
              builder: (context, state) => const FeedPage(),
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/bookmark',
              name: RouteNames.bookmark,
              builder: (context, state) => const BookmarkPage(),
            )
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/my',
              name: RouteNames.my,
              builder: (context, state) => const MyPage(),
            )
          ]),
        ],
      ),
    ],
    errorBuilder: (context, state) => PageNotFound(
      errMsg: state.error.toString(),
    ),
  );
}
