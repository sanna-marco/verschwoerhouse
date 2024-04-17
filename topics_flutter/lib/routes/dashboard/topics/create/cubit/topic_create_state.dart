part of 'topic_create_cubit.dart';

abstract class TopicCreateState extends Equatable {
  @override
  List<Object> get props => [];
}

class InvalidState extends TopicCreateState {}

class ValidState extends TopicCreateState {}

class SavedState extends TopicCreateState {}

class LoadingState extends TopicCreateState {}
