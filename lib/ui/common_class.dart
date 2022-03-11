import 'package:intl/intl.dart';

String convertDate(DateTime dateTime) {
  return DateFormat('yyyy-MM-dd').format(dateTime);
}

String dateConverter(DateTime dateTime) {

  return DateFormat('EE,dd MMM yyyy, hh:mma').format(dateTime.toLocal());
}
//'T'HH:mm:ss.SSS'Z'
/*
 final df =  DateFormat('EE,dd MMM yyyy, hh:mma');
    //TimeZoneOffset time1 =   timeZoneOffset: 5:30:00.000000;
    //final df =  DateFormat('EE,dd MMM yyyy, hh:mma').parseUtc(time).timeZoneOffset;
    var time=widget.paymentDetails_modal.time.toString();
    var dateUtc = DateTime.now().toUtc();
    print("dateUtc: $dateUtc"); // 2019-10-10 12:05:01

// convert it to local
    var dateLocal = dateUtc.toLocal();
    print("local: $dateLocal");
    print(time);
   // print(df.format( DateTime.fromMillisecondsSinceEpoch(time*1000)));
    print(df.format( DateTime.parse(time).toLocal()));
    print(df.format(DateTime.now().toLocal()));
* */