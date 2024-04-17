part of 'topic_details_cubit.dart';

abstract class TopicDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ZeroState extends TopicDetailsState {}

class LoadingState extends TopicDetailsState {}

class LoadedState extends TopicDetailsState {
  final Topic topic;

  LoadedState(this.topic);

  @override
  List<Object> get props => [topic];
}

class ErrorState extends TopicDetailsState {}
