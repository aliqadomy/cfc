import 'package:bloc/bloc.dart';
import '../../../infrastructure/repository/ResetPassRepo.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ResetPassRepo resetPassRepo;
  ChangePasswordBloc({required this.resetPassRepo}) : super(ChangePasswordInitial()) {
    on<ChangePasswordEvent>((event, emit) async{
      if(event is ChangePasswordEvents)
        {
          emit(ChangePasswordLoading());
          var res=await resetPassRepo.changePassword(0, event.oldPass, event.newPass);
          res.fold((err)=>emit(ChangePasswordFailed(errMsg: err.toString())), (s)=>emit(ChangePasswordSuccess(successMsg: s.toString())));
        }
    });
  }
}
