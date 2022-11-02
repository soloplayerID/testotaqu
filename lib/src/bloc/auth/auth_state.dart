part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
}

class LoginInitState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends AuthState{
  @override
  List<Object?> get props => [];
}

class UserLoginSuccess extends AuthState {
  final UserModel userModel;
  
  const UserLoginSuccess(this.userModel);
  @override
  List<Object?> get props => [userModel];
}

class LoginErrorState extends AuthState {
  final String message;

  const LoginErrorState(this.message); 
  @override
  List<Object> get props => [];
}
