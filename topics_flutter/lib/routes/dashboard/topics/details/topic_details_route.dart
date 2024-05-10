import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cubit/topic_details_cubit.dart';
import 'topic_details_page.dart';

// This route is used in the flutter app implementation
@immutable
class TopicDetailsRoute extends GoRouteData {
  final int id;

  const TopicDetailsRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => TopicDetailsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Topic Details"),
        ),
        body: TopicDetailsPage(id: id),
      ),
    );
  }
}

// This route should be used in native context to disable
// the app bar and swipe back gesture
@immutable
class TopicDetailsOnlyRoute extends GoRouteData {
  final int id;

  const TopicDetailsOnlyRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TopicDetailsCubit(),
        child: PopScope(
          canPop: false,
          child: TopicDetailsPage(id: id),
        ),
      ),
    );
  }
}
