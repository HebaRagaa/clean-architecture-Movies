

 //وهنعمل امبليمنتس للاكسيبشن اللي موجوده ف الاس دي كيه نفسه
 //وهستقبل جواه الايرور موديل ماسج اللي انا عامله ف النتورك ف الكور
 import 'package:movies_tv/core_%20module/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel  errorMessageModel ;

  ServerException({required this.errorMessageModel});

 }

 //وده عشان لو استعملت لوكال داتا بيز(داتا بيز او جيت لوكيشن او داتا فروم فايل) مش ريموت
 //وهروح وقتها للموفي داتا سورس ارمي لوكال اكسيبشن مش ريموت
 class LocalDatabaseException implements Exception {
   final String  message  ;

   LocalDatabaseException({required this.message});


 }

