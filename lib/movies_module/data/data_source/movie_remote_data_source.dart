

// عايزين نعرف الداتا سورس اللي موجودين عندنا ف الابلكيشن وعشان تحددها ف انت خلاص حدتها ف اليوز كيسز
 // ومش محتاجين نفكر كتير بنحدد الميثودز اللي جواه ع اساس اليوز كيسز ف اول كيسز عندي هو اول ميثود هنا وهكذا
  import 'package:dio/dio.dart';
import 'package:movies_tv/movies_module/data/models/movie_model.dart';

class MovieRemoteDataSource {

  //جوه الميثود دي هبدا اعمل كل الاند بوينت بتاع الجيت ناو بلاينج
 Future<List<MovieModel>> getNowPlayingMovie () async {
    //هكتب دايو والجيت ركويست من الايه بي اي
 final response = await Dio().get('  ');

 if (response.statusCode == 200 ) {
   //هنا بقوله انت هتجيب الليست موفي فروم يعني من الريسبونس دوت الداتا اللي جوا الريزلت
   //واالكي ريزلت ده ليست عايز ادخل عليه باستخدام الماب واقوله ايي يعني اول عنصر من الليست دي
   //واعملي عليها لوبينج لحد ما تري تيرن كل الموفي موديل اللي موجود ف الليستا دي اللي هى الريزلت
   //ومسميها ريزلت عشان هى كده ف الريسونس ايه بي اي لكن ممكن تبقى داتا ع حسب التسميه
   return List<MovieModel>.from((response.data['results'] as List ).map(
       (e) => MovieModel.fromJson(e),
   ));
 } else {
   return [] ;
 }
  }

  }


