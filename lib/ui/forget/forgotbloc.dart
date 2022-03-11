


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_vender/ui/login/loginmodal.dart';
import 'forgotevent.dart';
import 'forgotrepositary.dart';
import 'forgotstate.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  ForgotBloc() : super(ForgotState.onInit());
  final devTkn = "staff";

  @override
  Stream<ForgotState> mapEventToState(ForgotEvent event) async* {
    if (event is EmailEvent) {
      bool emailValid =
      RegExp(r"^[a-zA-Z0-9]+@[a-z]+\.[a-z]+").hasMatch(event.email);
      if (event.email.isNotEmpty && emailValid) {
        print('Email is valid :' +
            state.isEmailValid.toString());
        yield ForgotState.onEmail(state, true,);
      } else {
        yield ForgotState.onEmail(state, false,);
      }
    } else if (event is OnLoginEvent) {
      yield ForgotState.onLogin(state, true);
    } else if (event is OnLoginSuccessEvent) {
      var response =
      await enableLoginButton(state, event.email);
      if (response.statusCode != null) {
        yield ForgotState.onLoginSuccess(state, true, response);
      } else {
        yield ForgotState.onLoginSuccess(state, false,response);
      }
    }
  }

  Future<LoginModal> enableLoginButton(
      ForgotState state, email) async {
    LoginModal response = await gotoLoginApi(email, devTkn);
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

