import 'package:flutter/material.dart';
import 'package:topics_flutter/routes/dashboard/dashboard_route.dart';
import 'package:topics_flutter/routes/dashboard/topics/create/topic_create_route.dart';
import 'topics/topics_page.dart';

// Shows a simple list of topics with an appbar
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meetup Topics"),
      ),
      body: const TopicsPage(),
      floatingActionButton: IconButton(
          onPressed: () {
            TopicCreateRoute().go(context);
          },
          icon: const Icon(Icons.add)),
    );
  }
}
