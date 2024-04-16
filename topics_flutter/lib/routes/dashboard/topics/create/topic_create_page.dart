import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:topics_flutter/routes/dashboard/topics/create/cubit/topic_create_cubit.dart';

// Helps creating a new topic and storing it to the local
// database
class TopicCreatePage extends StatelessWidget {
  const TopicCreatePage({super.key});
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isReady = false;
    return BlocProvider(
      create: (context) => TopicCreateCubit(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<TopicCreateCubit, TopicCreateState>(
            listener: (context, state) {
          switch (state) {
            case LoadingState():
              isLoading = true;
            case ValidState():
              isLoading = false;
              isReady = true;
            case SavedState():
              context.pop();
            default:
              isLoading = false;
              isReady = false;
          }
        }, builder: (context, state) {
          final cubit = context.read<TopicCreateCubit>();
          return Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Title"),
                onChanged: cubit.updateTitle,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Description"),
                onChanged: cubit.updateDescription,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Date"),
                onTap: () async {
                  DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2025),
                  );
                  if (dateTime != null) {
                    cubit.updateDate(dateTime);
                  }
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Time"),
                onTap: () async {
                  TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (timeOfDay != null) {
                    cubit.updateTime(timeOfDay);
                  }
                },
              ),
              ElevatedButton(
                  onPressed: isReady ? cubit.saveTopic : null,
                  child: isLoading ? const Text("...") : const Text("Save"))
            ],
          );
        }),
      ),
    );
  }
}
