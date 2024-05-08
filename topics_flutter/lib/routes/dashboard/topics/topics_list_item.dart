import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:topics_flutter/routes/dashboard/dashboard_route.dart';

import 'details/topic_details_route.dart';

class TopicsListItem extends StatelessWidget {
  final Topic topic;

  const TopicsListItem({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(topic.title),
      subtitle: Text(topic.description),
      onTap: () {
        TopicDetailsRoute(id: topic.id).go(context);
      },
    );
  }
}
