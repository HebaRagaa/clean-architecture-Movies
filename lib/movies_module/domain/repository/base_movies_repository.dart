

  //جوا البيز ريبوزتري انا هحدد انا عايز ايه من الاسكرينه دي بتاع الموفيز او الجزء ده
 //يعني هنا محتاجين نجيب get now playing movies ,get popular movies ,get top reted

  import 'package:dartz/dartz.dart';
import 'package:movies_tv/core_%20module/error/failure.dart';
import 'package:movies_tv/movies_module/domain/entities/movie.dart';
import 'package:movies_tv/movies_module/domain/entities/movie_details.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_movie_details_usecase.dart';

abstract class BaseMoviesRepository {
//طبعا هنا مفيش اي امبلمنتيشن يعني مينفعش بعد البراكيت احط كيرلي براكيت ف اي ميثود واكتب جةاهم
 //بنعمل كونتراكت يعني ابستراكت كلاس وتحته ابستراكت ميثود لا غير
  //وطبعا هنخلي الريترن فيوتشر ايزير من دارت زد عشان تشيبل احتمالات اتنين ريترن
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies () ;
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies () ;

  Future<Either<Failure,MovieDetail>> getMovieDetail (MovieDetailsParameters parameters) ;

 //وبعدين هنروح لليوز كيس وطبعا مش هنعمل ملف دارت واحد دول هيبقوا تلات ملفات للتلات ميثود اللي فوق
}

