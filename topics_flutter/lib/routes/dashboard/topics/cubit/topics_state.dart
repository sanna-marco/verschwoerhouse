part of 'topics_cubit.dart';

abstract class TopicsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends TopicsState {}

class EmptyState extends TopicsState {}

class LoadedState extends TopicsState {
  final List<Topic> topics;

  LoadedState(this.topics);

  @override
  List<Object> get props => [topics];
}

class ChangedState extends TopicsState {}

class ZeroState extends TopicsState {}
