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
          path: 'topics',
          factory: $TopicsRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':id',
              factory: $TopicsDetailsRouteExtension._fromState,
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

extension $TopicsRouteExtension on TopicsRoute {
  static TopicsRoute _fromState(GoRouterState state) => TopicsRoute();

  String get location => GoRouteData.$location(
        '/topics',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TopicsDetailsRouteExtension on TopicsDetailsRoute {
  static TopicsDetailsRoute _fromState(GoRouterState state) =>
      TopicsDetailsRoute(
        id: int.parse(state.pathParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/topics/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
