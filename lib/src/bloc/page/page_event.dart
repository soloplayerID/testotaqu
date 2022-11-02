part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class GoToSplashPage extends PageEvent {}

class GoToOnboardingPage extends PageEvent {}

class GoToLogin extends PageEvent {}

class GoToLoginFirst extends PageEvent {}

class GoToMainPage extends PageEvent {}

class GoToGetDestinationData extends PageEvent {
  final String? token;
  const GoToGetDestinationData({this.token});
}

class GoToSearchDestination extends PageEvent {}

class GoToSelectDestination extends PageEvent {
  final String? token;
  final int? destinationId;
  final String? name;
  final String? typeName;
  const GoToSelectDestination({this.token, this.destinationId, this.name, this.typeName, });
}
