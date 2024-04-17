import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:topics_flutter/routes/dashboard/topics/create/topic_create_page.dart';

@immutable
class TopicCreateRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TopicCreatePage();
  }
}
