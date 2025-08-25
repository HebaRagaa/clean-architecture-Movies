

  //جوا البيز ريبوزتري انا هحدد انا عايز ايه من الاسكرينه دي بتاع الموفيز او الجزء ده
 //يعني هنا محتاجين نجيب get now playing movies ,get popular movies ,get top reted

  import 'package:movies_tv/movies_module/domain/entities/movie.dart';

abstract class BaseMoviesRepository {
//طبعا هنا مفيش اي امبلمنتيشن يعني مينفعش بعد البراكيت احط كيرلي براكيت ف اي ميثود واكتب جةاهم
 //بنعمل كونتراكت يعني ابستراكت كلاس وتحته ابستراكت ميثود لا غير
  Future<List<Movie>> getNowPlaying () ;
 Future<List<Movie>> getPopularMovies();
 Future<List<Movie>> getTopRatedMovies () ;

 //وبعدين هنروح لليوز كيس وطبعا مش هنعمل ملف دارت واحد دول هيبقوا تلات ملفات للتلات ميثود اللي فوق
}

