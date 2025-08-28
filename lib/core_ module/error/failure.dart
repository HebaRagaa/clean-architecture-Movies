//هعمل ابستراكت كلاس يعني ثابت وعمومي ع اي ايرور اللي يحصل تبع الايه بي اي
//وهلاقي عندي الايرور ماسج موديل واللوكال داتا ايرور والاتنين المشترك بينهم الماسج
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {

  final String message;
  const Failure(this.message);

//وهبدء اعمل البروبيرتز بتاعتنا اللي بتري ترن ماسج من كليك جنريت واكويتابل بروبيرتز
  @override
  List<Object> get props => [message];

}

//ودلوقتي الفلير ده عشان اقدر استخدمه واقول للاكسبشن ريترن الفلير ده ف هعمل كلاس للسيرفر واللوكل داتا
// هعمل داتنين كلاس وياكستند من الفيلير وبينادوا ع الماسج اللي ف الاابستراكت كلاس فيلير ده
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

