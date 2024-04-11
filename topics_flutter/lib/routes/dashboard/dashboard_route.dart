import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:topics_flutter/routes/dashboard/topics/details/details_route.dart';
import 'package:topics_flutter/routes/dashboard/topics/topics_route.dart';

import 'dashboard_page.dart';

part 'dashboard_route.g.dart';

// Main route of the app, defaulting to the dashboard
@TypedGoRoute<DashboardRoute>(
  path: '/',
  routes: [
    TypedGoRoute<TopicsRoute>(
      path: 'topics',
      routes: [
        TypedGoRoute<TopicsDetailsRoute>(
          path: ':id',
        ),
      ],
    ),
  ],
)
@immutable
class DashboardRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardPage();
  }
}
