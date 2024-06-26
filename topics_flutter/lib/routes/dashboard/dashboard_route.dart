import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:topics_flutter/routes/dashboard/topics/create/topic_create_route.dart';
import 'package:topics_flutter/routes/dashboard/topics/details/topic_details_route.dart';

import 'dashboard_page.dart';
import 'topics/cubit/topics_cubit.dart';

part 'dashboard_route.g.dart';

// Main route of the app, defaulting to the dashboard
@TypedGoRoute<DashboardRoute>(
  path: '/',
  routes: [
    TypedGoRoute<TopicDetailsRoute>(
      path: 'details/:id',
    ),
    TypedGoRoute<TopicCreateRoute>(
      path: 'create',
    ),
    TypedGoRoute<TopicDetailsOnlyRoute>(
      path: 'detailsOnly/:id',
    )
  ],
)
@immutable
class DashboardRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => TopicsCubit(),
      child: const DashboardPage(),
    );
  }
}
