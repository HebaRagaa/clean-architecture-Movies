

import 'package:equatable/equatable.dart';

// وده الموديل للريسبونس او الايرور اللي بيطلع لو حاجه غير 200
class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic>json) {
    return ErrorMessageModel(
        statusCode: json['status_Code'] ,
        statusMessage: json['status_message'],
        success: json['success']
    );
  }

  @override
 //هنريتيرن ليست اوف البروبيرتز دي اللي ف الموديل بتاعنا
  List<Object?> get props =>  [statusCode , statusMessage , success ] ;
}
