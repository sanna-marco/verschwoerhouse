import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topics_flutter/routes/dashboard/topics/cubit/topics_cubit.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopicsCubit(),
      child: Padding(
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
                  prototypeItem: ListTile(
                    title: Text(state.topics.first.title),
                    subtitle: Text(state.topics.first.description),
                  ),
                  itemBuilder: (context, index) {
                    final topic = state.topics[index];
                    return ListTile(
                      title: Text(topic.title),
                      subtitle: Text(topic.description),
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
      ),
    );
  }
}
