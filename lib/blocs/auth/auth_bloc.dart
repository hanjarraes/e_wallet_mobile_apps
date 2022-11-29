import 'package:bloc/bloc.dart';
import 'package:e_wallet_mobile_apps/models/sign_up_form_model.dart';
import 'package:e_wallet_mobile_apps/models/sign_in_form_model.dart';
import 'package:e_wallet_mobile_apps/models/user_model.dart';
import 'package:e_wallet_mobile_apps/services/auth_service.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()){
    on<AuthEvent>((event, emit) async {

      if(event is AuthCheckEmail){
        try{
          emit(AuthLoading());
          
          final res = await AuthService().checkEmail(event.email);

          if(res == false){
            emit(AuthCheckEmailSuccess());
          }else{
            emit(const AuthFailed('Email sudah terpakai'));
          }
        } catch (e){
          emit(AuthFailed(e.toString()));
        }
      }

      if(event is AuthRegister){
        try{
          emit(AuthLoading());
          final user = await AuthService().register(event.data);
          emit(AuthSuccess(user));
        }catch(e){
          emit(AuthFailed(e.toString()));
        }
      }

      if(event is AuthLogin){
        try{
          emit(AuthLoading());
          final user = await AuthService().login(event.data);
          emit(AuthSuccess(user));
        }catch(e){
          emit(AuthFailed(e.toString()));
        }
      }

      if(event is AuthGetCurrentUser){
        try{
          emit(AuthLoading());
          final SignInFormModel data = await AuthService().getCredentialFromLocal();
          final UserModel user = await AuthService().login(data);
          emit(AuthSuccess(user));
        }catch(e){
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}