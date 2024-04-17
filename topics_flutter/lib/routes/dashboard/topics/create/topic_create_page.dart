import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:topics_flutter/routes/dashboard/topics/create/cubit/topic_create_cubit.dart';
import 'package:intl/intl.dart';

// Helps creating a new topic and storing it to the local
// database
class TopicCreatePage extends StatelessWidget {
  TopicCreatePage({super.key});

  final TextEditingController datePickerController = TextEditingController();
  final TextEditingController timePickerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isReady = false;
    return SingleChildScrollView(
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
        datePickerController.text = DateFormat("yyyy-MM-dd").format(cubit.date);
        timePickerController.text = cubit.time.format(context);
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
              controller: datePickerController,
              decoration: const InputDecoration(labelText: "Date"),
              onTap: () async {
                DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: cubit.date,
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2025),
                );
                if (dateTime != null) {
                  cubit.updateDate(dateTime);
                  datePickerController.text =
                      DateFormat("yyyy-MM-dd").format(cubit.date);
                }
              },
            ),
            TextField(
              controller: timePickerController,
              decoration: const InputDecoration(labelText: "Time"),
              onTap: () async {
                TimeOfDay? timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: cubit.time,
                );
                if (timeOfDay != null && context.mounted) {
                  cubit.updateTime(timeOfDay);
                  timePickerController.text = cubit.time.format(context);
                }
              },
            ),
            ElevatedButton(
                onPressed: isReady ? cubit.saveTopic : null,
                child: isLoading ? const Text("...") : const Text("Save"))
          ],
        );
      }),
    );
  }
}
