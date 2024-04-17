import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:topics_flutter/routes/dashboard/topics/details/cubit/topic_details_cubit.dart';

class TopicDetailsPage extends StatelessWidget {
  final int id;

  const TopicDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<TopicDetailsCubit, TopicDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state) {
            case ZeroState():
              context.read<TopicDetailsCubit>().loadTopic(id);
              return const Text("Loading...");
            case ErrorState():
              return const Text("Error");
            case LoadingState():
              return const Text("Loading...");
            case final LoadedState state:
              return Column(
                children: [
                  Text(state.topic.title),
                  Text(state.topic.description),
                  Text(DateFormat().format(state.topic.dateTime)),
                ],
              );
            default:
              return const Text("Error");
          }
        },
      ),
    );
  }
}
