import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'cubit/topic_details_cubit.dart';
import 'topic_details_page.dart';

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
