import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'config/injection.dart';
import 'routes/dashboard/dashboard_route.dart';

void main() {
  configureDependencies();
  runApp(TopicsApp());
}

// Main entry class of the app showing topics on mobile dev meetup
class TopicsApp extends StatelessWidget {
  TopicsApp({super.key});

  // Initializing the routing, starting from the dashboard
  final _router = GoRouter(
    routes: $appRoutes,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
