import 'package:belajar_bloc_lagi/src/models/models.dart';
import 'package:belajar_bloc_lagi/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserModel _userModel;
  final AuthServices _authServices;

  AuthBloc(this._authServices, this._userModel) : super(LoginInitState()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoadingState());
      _authServices.login('otaqu', 'qwerty').then((value) {
        _userModel.users.add(User(
          username: 'otaqu',
          password: 'qwerty',
          token: value.data!.accessToken.toString()
        ));
        emit(UserLoginSuccess(_userModel));
      }).catchError((err){
        emit(LoginErrorState(err.toString()));
      });
    });
  }
}


