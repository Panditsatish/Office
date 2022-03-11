abstract class ForgotEvent {}

class EmailEvent extends ForgotEvent {
  late String email;

  EmailEvent(this.email);
}

class OnLoginEvent extends ForgotEvent {
  late String email;

  OnLoginEvent(this.email);
}

class OnLoginSuccessEvent extends ForgotEvent {
  late String email;

  OnLoginSuccessEvent(this.email);
}

