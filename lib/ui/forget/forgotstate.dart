import 'package:mob_vender/ui/login/loginmodal.dart';

class ForgotState {
  final bool isSuccess;
  final bool isEmailValid;
  final bool isValidSuccess;
  final LoginModal? response1;


  ForgotState._(this.isSuccess, this.isEmailValid,
      this.isValidSuccess, this.response1);

  ForgotState.onLogin(ForgotState state, bool isValidSuccess)
      : this._(state.isSuccess, state.isEmailValid,
      isValidSuccess,state.response1);

  ForgotState.onEmail(ForgotState state, bool isEmailValid)
      : this._(
      false, isEmailValid, state.isValidSuccess,state.response1);


  ForgotState.onLoginSuccess(ForgotState state, bool isSuccess,LoginModal response)
      : this._(isSuccess, state.isEmailValid,
      state.isValidSuccess, response);


  ForgotState.onInit() : this._(false, false, false,LoginModal());


}
