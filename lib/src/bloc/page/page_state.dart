part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
  
  @override
  List<Object> get props => [];
}

class OnInitialPage extends PageState {}

class OnSplashPage extends PageState {}

class OnBoardingPage extends PageState {}

class OnLoginSuccess extends PageState {
  final UserModel userModel;
  
  const OnLoginSuccess(this.userModel);
}

class OnLoginError extends PageState {
  final String message;

  const OnLoginError(this.message);
}

class OnMainPage extends PageState {}

class OnSearchhDestinationPage extends PageState {}

class OnSelectDestinationPage extends PageState {
  final AvailModel availModel;

  const OnSelectDestinationPage(this.availModel);
}
