

import 'package:get_it/get_it.dart';
import 'package:movies_tv/movies_module/data/data_source/movie_remote_data_source.dart';
import 'package:movies_tv/movies_module/data/repository/movies_repository.dart';
import 'package:movies_tv/movies_module/domain/repository/base_movies_repository.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_Popular_movies_usecase.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_tv/movies_module/presentation/controller/movie_details_bloc.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_bloc.dart';
//عشان تستخدم الجيت ات محتاج تقوله جيت ات انستنس وتعملها بره الكلاس عشان تكون جلوبال للبروجيت كله
//لكن هغيرها من جيت ات ل اس ال اختصار سيرفز لوكيتور
final sl = GetIt.instance;

class ServicesLocator {
  //اينيت يعني ميثود انيشيال
  void init () {
 //لو عايز اخزن اوبجيكت من الداتا سورس هعمل اس ال دوت وفي ريجستر فاكتوري وحاجات كتير
//بس هناخد منه الريجيستر ليزي سنجلتون وهنا بقوله دا ليزي ماتكريتهوش غير لما انادي عليه
 
   //Bloc
   //ممكن اوقات احتاج اعمل ريلود للداتا او الاوبجيكت ف هنا السنجلتون ليزي مش هيفيدني
  //لان مهمة السنجلتون ليزي تخلي نفس الاوبجيكت حتى لو اتعمل ريلود هو لا او يتعمل وقت ما احتاجه
  //والسينجلتون بس من غير ليزي بقوله كريت الاوبجيكت من غير ما استخدمه
   //الريجيستر فاكتوري بتقولك انت كل ماتنادي ع الموفي بلوك هكريتلك نيو اوبجيكت من الموفي بلوك يعني يتعمل ابديت للموفي للاسكرين
   sl.registerFactory( () => MoviesBloc(
    //هبعتله التلاته للتلاته اللي عندي الناو والبوب والتوب
       sl(),sl(),sl() ));
   sl.registerFactory( () => MovieDetailsBloc(sl()));


    //use case
 sl.registerLazySingleton( () => GetNowPlayingMoviesUseCase(sl())) ;
   sl.registerLazySingleton( () => GetPopularMoviesUseCase(sl())) ;
   sl.registerLazySingleton( () => GetTopRatedMoviesUseCase(sl())) ;
   sl.registerLazySingleton( () => GetMovieDetailsUseCase(sl())) ;

   //Repository
 sl.registerLazySingleton<BaseMoviesRepository>(
         () => MovieRepository(sl()));
 //وبدل ما انادي كده وعشان انا عندي البيز داتا ف الاس ال ف هكتبها وهقوله عندك فيها اللي انت عايزه
    // () => MovieRepository(baseMovieRemoteDataSource));

 //Data source
 sl.registerLazySingleton<BaseMovieRemoteDataSource>(
     () => MovieRemoteDataSource());

  }


 }



