import 'package:cfc_main/domain/model/Response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infrastructure/repository/loginRepo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo;
  LoginBloc({required this.loginRepo}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      if (event is LoginEvents) {
          var res = await loginRepo.loginRepo(event.email, event.password);
          res.fold(
                (error) {
              emit(LoginFailed(msgErr: error.message));
            },
                (user) {
                   emit(LoginSuccess(responseUser: user));
            },
          );
      }else if(event is LoginRefreshToken){
        var res = await loginRepo.refreshTokenApi(event.rememberToken);
        res.fold(
              (error) {
            emit(NewTokenFailed(msgErr: error.message));
          },
              (user) {
            emit(NewTokenSuccess(responseUser: user));
          },
        );
      }
    });
  }
}
