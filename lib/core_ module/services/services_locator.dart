

import 'package:get_it/get_it.dart';
import 'package:movies_tv/movies_module/data/data_source/movie_remote_data_source.dart';
import 'package:movies_tv/movies_module/data/repository/movies_repository.dart';
import 'package:movies_tv/movies_module/domain/repository/base_movies_repository.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_now_playing_movies_usecase.dart';
//عشان تستخدم الجيت ات محتاج تقوله جيت ات انستنس وتعملها بره الكلاس عشان تكون جلوبال للبروجيت كله
//لكن هغيرها من جيت ات ل اس ال اختصار سيرفز لوكيتور
final sl = GetIt.instance;

class ServicesLocator {
  //اينيت يعني ميثود انيشيال
  void init () {
 //لو عايز اخزن اوبجيكت من الداتا سورس هعمل اس ال دوت وفي ريجستر فاكتوري وحاجات كتير
//بس هناخد منه الريجيستر ليزي سنجلتون وهنا بقوله دا ليزي ماتكريتهوش غير لما انادي عليه
 
    //use case
 sl.registerLazySingleton( () => GetNowPlayingMoviesUseCase(sl())) ;
    
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



