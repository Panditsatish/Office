import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_vender/ui/forget/forgotevent.dart';
import 'package:mob_vender/ui/payment/payment_modal.dart';
import 'package:mob_vender/ui/payment/payment_repository.dart';
import 'package:mob_vender/ui/payment/paymentevent.dart';
import 'package:mob_vender/ui/payment/paymentstate.dart';

/*

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState.onInit());
  final devTkn = "staff";

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
   if (event is OnLoginEvent) {
      yield PaymentState.onLogin(state, true);
    } else if (event is OnLoginSuccessEvent) {
      var response = await enableLoginButton(state);
      if (response.statusCode != null) {
        yield PaymentState.onLoginSuccess(state, true,);
      } else {
        yield PaymentState.onLoginSuccess(state, false,);
      }
    }
  }

  Future<Payment_Modal> enableLoginButton(
     PaymentState state) async {
 Payment_Modal response = await PaymentListApi( accessToken, foodItemList,totalPrice);

    print("2111212221333131====>    ${response.responseData?.order?.orderId.toString()}");
    print("testing name of api response++++++++++>>>>>> "
        "   ${response.responseData?.order?.foods.toString()}");

    if (response.statusCode == 1) {
      print("Status    " + response.statusCode.toString());

      return response;
    } else {
      return response;
    }
  }

}
*/
