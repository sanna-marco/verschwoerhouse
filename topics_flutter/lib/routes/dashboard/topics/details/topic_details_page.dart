import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:topics_flutter/routes/dashboard/topics/details/cubit/topic_details_cubit.dart';

class TopicDetailsPage extends StatelessWidget {
  final int id;

  const TopicDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/Logo_VSH_${state.color}.svg',
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.topic.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.topic.description,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
