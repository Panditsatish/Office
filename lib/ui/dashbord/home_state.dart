
import 'package:mob_vender/ui/dashbord/dash_modal.dart';

class LoginState {
  final bool isSuccess;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isValidSuccess;
  final HomeModal? response1;

  LoginState._(this.isSuccess, this.isEmailValid, this.isPasswordValid,
      this.isValidSuccess,  this.response1);

  LoginState.onLogin(LoginState state, bool isValidSuccess)
      : this._(state.isSuccess, state.isEmailValid, state.isPasswordValid,
      isValidSuccess, state.response1);

  LoginState.onEmail(LoginState state, bool isEmailValid, bool isValidSuccess)
      : this._(
      false, isEmailValid, state.isPasswordValid, isValidSuccess, state.response1);

  LoginState.onPassword(
      LoginState state, bool isPasswordValid, bool isValidSuccess)
      : this._(state.isSuccess, state.isEmailValid, isPasswordValid,
      isValidSuccess,state.response1);

  LoginState.onLoginSuccess(LoginState state, bool isSuccess,HomeModal response)
      : this._(isSuccess, state.isEmailValid, state.isPasswordValid,
      state.isValidSuccess,response);

  LoginState.onLogSuccess(LoginState state, bool isSuccess)
      : this._(isSuccess, state.isEmailValid, state.isPasswordValid,
      state.isValidSuccess,state.response1);

  LoginState.onInit() : this._(false, false, false, false,HomeModal());


}
