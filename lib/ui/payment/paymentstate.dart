
class PaymentState {
  final bool isSuccess;
  final bool isValidSuccess;
  //final LoginModal? response1;


  PaymentState._(this.isSuccess,
      this.isValidSuccess);

  PaymentState.onLogin(PaymentState state, bool isValidSuccess)
      : this._(state.isSuccess,
      isValidSuccess);


  PaymentState.onLoginSuccess(PaymentState state, bool isSuccess)
      : this._(isSuccess, state.isValidSuccess);

  PaymentState.onLogSuccess(PaymentState state, bool isSuccess)
      : this._(isSuccess,
      state.isValidSuccess);
  PaymentState.onInit() : this._(false, false);


}