import 'package:flutter/material.dart';
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
    );
  }
}
