part of 'destination_bloc.dart';

abstract class DestinationEvent extends Equatable {
  const DestinationEvent();

  @override
  List<Object> get props => [];
}

class LoadDestinationEvent extends DestinationEvent{}
