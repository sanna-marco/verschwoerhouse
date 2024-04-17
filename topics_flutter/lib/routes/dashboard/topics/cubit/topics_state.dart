part of 'topics_cubit.dart';

abstract class TopicsState extends Equatable {}

class LoadingState extends TopicsState {
  @override
  List<Object> get props => [];
}

class EmptyState extends TopicsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends TopicsState {
  final List<Topic> topics;

  LoadedState(this.topics);

  @override
  List<Object> get props => [topics];
}

class ChangedState extends TopicsState {
  @override
  List<Object> get props => [];
}

class ZeroState extends TopicsState {
  @override
  List<Object> get props => [];
}
