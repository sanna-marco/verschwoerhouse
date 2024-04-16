import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:topics_flutter/routes/dashboard/topics/create/topic_create_page.dart';

@immutable
class TopicCreateRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: Scaffold(
        body: TopicCreatePage(),
      ),
    );
  }
}
