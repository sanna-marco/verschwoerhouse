import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:topics_flutter/routes/dashboard/topics/create/topic_create_page.dart';

import 'cubit/topic_create_cubit.dart';

@immutable
class TopicCreateRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
      fullscreenDialog: true,
      child: BlocProvider(
        create: (context) => TopicCreateCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("New topic"),
          ),
          body: TopicCreatePage(),
        ),
      ),
    );
  }
}
