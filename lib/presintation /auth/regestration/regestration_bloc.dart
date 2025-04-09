import 'package:bloc/bloc.dart';
import 'package:cfc_main/domain/model/RegestrationModel.dart';
import 'package:meta/meta.dart';
import '../../../infrastructure/repository/registerRepo.dart';

part 'regestration_event.dart';
part 'regestration_state.dart';

class RegestrationBloc extends Bloc<RegestrationEvent, RegestrationState> {

  RegisterRepo registerRepo;
  RegestrationBloc({required this.registerRepo}) : super(RegestrationInitial()) {
    on<RegestrationEvent>((event, emit) async{
      if(event is ResgestrationBorrowerEvent){
        emit(RegestrationBorrowerLoading());
        var res =await registerRepo.registerRepo(event.email, event.password, event.name, event.username, event.mobile_number, event.country_code, event.role_type, event.registration_type);
        res.fold((e)=>emit(RegestrationBorrowerFailed(errMsg: e.toString())), (s)=>emit(RegestrationInvestorSuccess(responseRegister: s)));
      }else if(event is ResgestrationInvestorEvent)
        {
          emit(RegestrationInvestorLoading());
          var res =await registerRepo.registerRepo(event.email, event.password, event.name, event.username, event.mobile_number, event.country_code, event.role_type, event.registration_type);
          res.fold((e)=>emit(RegestrationInvestorFailed(errMsg: e.toString())), (s)=>emit(RegestrationInvestorSuccess(responseRegister: s)));
        }else  if(event is ResgestrationTermsEvent){
        emit(RegestrationInvestorLoading());
        var res =await registerRepo.termsAndcondition();
        res.fold((e)=>emit(RegestrationInvestorFailed(errMsg: e.toString())), (s)=>emit(RegestrationTermsSuccess( message: s.description!)));
      }
    });
  }


}
