part of 'rewards_bloc.dart';

abstract class RewardsEvent extends Equatable {
  const RewardsEvent();
}

class FetchRewards extends RewardsEvent {
  const FetchRewards();

  @override
  List<Object> get props => [];
}
