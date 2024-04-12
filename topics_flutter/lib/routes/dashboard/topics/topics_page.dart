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
            switch (state) {
              case ZeroState():
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
                  itemBuilder: (context, index) {
                    final topic = state.topics[index];
                    return Text(topic.title);
                  },
                );
              default:
                return const Text("Error");
            }
          },
        ),
      ),
    );
  }
}
