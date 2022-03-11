abstract class PaymentEvent {}


class OnPressEvent extends PaymentEvent {


  OnPressEvent();
}

class OnPressSuccessEvent extends PaymentEvent {

  OnPressSuccessEvent();
}
