// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dashboardRoute,
    ];

RouteBase get $dashboardRoute => GoRouteData.$route(
      path: '/',
      factory: $DashboardRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'talks',
          factory: $TalksRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':id',
              factory: $TalkDetailsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) => DashboardRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TalksRouteExtension on TalksRoute {
  static TalksRoute _fromState(GoRouterState state) => TalksRoute();

  String get location => GoRouteData.$location(
        '/talks',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TalkDetailsRouteExtension on TalkDetailsRoute {
  static TalkDetailsRoute _fromState(GoRouterState state) => TalkDetailsRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/talks/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
