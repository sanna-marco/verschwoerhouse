import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@immutable
class TalkDetailsRoute extends GoRouteData {
  final int id;

  const TalkDetailsRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: implement build
    return super.build(context, state);
  }
}
