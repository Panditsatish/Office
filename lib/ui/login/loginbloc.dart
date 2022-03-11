import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_vender/ui/login/loginevent.dart';
import 'package:mob_vender/ui/login/loginmodal.dart';
import 'package:mob_vender/ui/login/loginstate.dart';
import 'loginrepositary.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.onInit());
  final devTkn = "staff";

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailEvent) {
      bool emailValid =
      RegExp(r"^[a-zA-Z0-9\.]+@[a-z]+\.[a-z]+").hasMatch(event.email);
      if (event.email.isNotEmpty && emailValid) {
        print('Email is valid :' +
            state.isEmailValid.toString() +
            "    password---->" +
            state.isPasswordValid.toString());
        yield LoginState.onEmail(state, true, state.isPasswordValid);
      } else {
        yield LoginState.onEmail(state, false, state.isPasswordValid);
      }
    } else if (event is PasswordEvent) {
      bool passValid = event.password.length >4;
      if (event.password.isNotEmpty &&
          passValid &&
          !event.password.contains(' ')) {
        print('Password is Valid ---> ' +
            state.isPasswordValid.toString() +
            '  email  ====>' +
            state.isEmailValid.toString());
        yield LoginState.onPassword(state, true, state.isEmailValid);
      } else {
        yield LoginState.onPassword(state, false, state.isEmailValid);
        print('Password is Valid ---> ' +
            state.isPasswordValid.toString() +
            '  email  ====> ' +
            state.isEmailValid.toString());
      }
    } else if (event is OnLoginEvent) {
      yield LoginState.onLogin(state, true);
    } else if (event is OnLoginSuccessEvent) {
      var response =
      await enableLoginButton(state, event.email, event.password);
      if (response.statusCode != null) {
        yield LoginState.onLoginSuccess(state, true, response);
      } else {
        yield LoginState.onLoginSuccess(state, false, response);
      }
    }
  }

  Future<LoginModal> enableLoginButton(
      LoginState state, email, password) async {
    LoginModal response = await gotoLoginApi(email, password, devTkn);

    print("2111212221333131====>    ${response.responseData?.employeeProfile?.accessToken.toString()}");
    print("testing name of api response++++++++++>>>>>> "
        "   ${response.responseData?.employeeProfile?.firstName.toString()}");
    if (response.statusCode == 1) {
      print("Status    " + response.statusCode.toString());

      return response;
    } else {
      return response;
    }
  }
}

