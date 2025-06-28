import 'package:cfc_main/domain/model/Response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infrastructure/repository/loginRepo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;

  LoginBloc({required this.loginRepo}) : super(LoginInitial()) {
    on<LoginWithCredentials>((event, emit) async {
      emit(LoginLoading());
      final res = await loginRepo.loginRepo(event.email, event.password);
      res.fold(
            (error) => emit(LoginFailure(message: error.message)),
            (user) => emit(LoginSuccess(user: user)),
      );
    });

    on<LoginWithRefreshToken>((event, emit) async {
      emit(LoginLoading());
      final res = await loginRepo.refreshTokenApi(event.refreshToken);
      res.fold(
            (error) => emit(LoginFailure(message: error.message)),
            (user) => emit(LoginSuccess(user: user)),
      );
    });
  }
}
