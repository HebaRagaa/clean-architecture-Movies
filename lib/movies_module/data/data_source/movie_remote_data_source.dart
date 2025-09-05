

// عايزين نعرف الداتا سورس اللي موجودين عندنا ف الابلكيشن وعشان تحددها ف انت خلاص حدتها ف اليوز كيسز
 // ومش محتاجين نفكر كتير بنحدد الميثودز اللي جواه ع اساس اليوز كيسز ف اول كيسز عندي هو اول ميثود هنا وهكذا
  import 'package:dio/dio.dart';
import 'package:movies_tv/core_%20module/error/exceptions.dart';
import 'package:movies_tv/core_%20module/network/api_constance.dart';
import 'package:movies_tv/core_%20module/network/error_message_model.dart';
import 'package:movies_tv/movies_module/data/models/movie_model.dart';

 //بنبقى محتاجين نعمل كونتراكت او ابستراكت كلاس بيحدد الاسماء والريترن تايب بتاع كل ميثود
  //وعشان لو حبيت تقرا او تعرف الميثودز يبقى من هنا
abstract class BaseMovieRemoteDataSource {
   Future<List<MovieModel>> getNowPlayingMovies () ;
   //ولما اجي اضيف اي ميثود تاني لازم اكتبها هنا الاول اقوله هعمل كونتراكت
   Future<List<MovieModel>> getPopularMovies () ;
   Future<List<MovieModel>> getTopRatedMovies () ;

  // Future<List<MovieModel>> getMovieDetail () ;

// وبراجع ع اليوز كيس اللي ف الدومين لو اتضافت ميثود جديده اضيفها هنا ووبعدين اعملها اوفر رايد تحت
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
 @override
 //جوه الميثود دي هبدا اعمل كل الاند بوينت بتاع الجيت ناو بلاينج
 Future<List<MovieModel>> getNowPlayingMovies () async {
    //هكتب دايو والجيت ركويست من الايه بي اي
   //وهنا بدل ما اكتب البيز يو ار ال والاند بوينت والايه بي اي كي جوا قوسين الجيت,هقسمها ف الايه بي اي كونستانس ق الكور ف النتورك
   final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
   print(response);

 if (response.statusCode == 200 ) {
   //هنا بقوله انت هتجيب الليست موفي فروم يعني من الريسبونس دوت الداتا اللي جوا الريزلت
   //واالكي ريزلت ده ليست عايز ادخل عليه باستخدام الماب واقوله ايي يعني اول عنصر من الليست دي
   //واعملي عليها لوبينج لحد ما تري تيرن كل الموفي موديل اللي موجود ف الليستا دي اللي هى الريزلت
   //ومسميها ريزلت عشان هى كده ف الريسونس ايه بي اي لكن ممكن تبقى داتا ع حسب التسميه
   return List<MovieModel>.from((response.data['results'] as List ).map(
       (e) => MovieModel.fromJson(e),
   ));
 } else {
   //دلوقتي انا عايز استعمل الداتا اللي بترجعلي ف حالة الايرور او انه مش ناجح ف هستقبل البيانات
    //وعشان لما لعبنا ف الايه بي اي وظهرت الماسج ف الحالات غير ال200 عباره عن تلاته فهعمل موديل
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson( response.data )
      );
   //جوه الايلس المفروض ابعت اكسيبشن او اريترن نفس نوع المويل اللي فوق بتاع الميثود نفسها
   //ف انا دلوقتي هعمل حاجه جينرال ع الابلكيشن كله وهى ديركتولي ع الابلكيشن كله اسميه ايرور ف الكور وجواه اكسيبشن
 }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
 final response = await Dio().get(ApiConstance.popularMoviesPath) ;
 //ومن الاحسن نتاكد من كل ركويست كويس ف حالة السكسيس بالخصوص انه نفس الفورمات او شكل الداتا ريزلت ف ليست
   if (response.statusCode == 200 ) {
     return List<MovieModel>.from((response.data['results'] as List ).map(
         (e) => MovieModel.fromJson (e) ,
     ));
   } else {
     throw ServerException(
         errorMessageModel: ErrorMessageModel.fromJson(response.data )) ;
   }

 }


  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
 final response = await Dio().get(ApiConstance.topRatedMoviesPath) ;
 if (response.statusCode == 200 ) {
   return List<MovieModel>.from((response.data['results'] as List ).map(
         (e) => MovieModel.fromJson (e) ,
   ));
 } else {
   throw ServerException(
       errorMessageModel: ErrorMessageModel.fromJson(response.data )) ;
 }

  }

  // @override
  // Future<List<MovieModel>> getMovieDetail() {
  //
  // }


  }


