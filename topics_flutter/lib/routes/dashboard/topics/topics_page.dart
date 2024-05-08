import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topics_flutter/routes/dashboard/topics/topics_list_item.dart';

import 'cubit/topics_cubit.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocConsumer<TopicsCubit, TopicsState>(
        listener: (context, state) {
          if (state is ChangedState) {
            context.read<TopicsCubit>().loadTopics();
          }
        },
        builder: (context, state) {
          switch (state) {
            case EmptyState():
              return const Center(
                child: Text("No topics yet"),
              );
            case final LoadedState state:
              return ListView.builder(
                itemCount: state.topics.length,
                prototypeItem: TopicsListItem(topic: state.topics.first),
                itemBuilder: (context, index) {
                  final topic = state.topics[index];
                  return Dismissible(
                    key: Key(topic.id.toString()),
                    onDismissed: (direction) {
                      context.read<TopicsCubit>().deleteTopic(topic.id);
                    },
                    child: TopicsListItem(topic: topic),
                  );
                },
              );
            case ZeroState():
              context.read<TopicsCubit>().loadTopics();
              return const Center(
                child: Text("-"),
              );
            default:
              return const Text("Loading");
          }
        },
      ),
    );
  }
}
