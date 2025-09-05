

import 'package:dartz/dartz.dart';
import 'package:movies_tv/core_%20module/error/exceptions.dart';
import 'package:movies_tv/core_%20module/error/failure.dart';
import 'package:movies_tv/movies_module/data/data_source/movie_remote_data_source.dart';
 import 'package:movies_tv/movies_module/domain/entities/movie.dart';
import 'package:movies_tv/movies_module/domain/entities/movie_details.dart';
import 'package:movies_tv/movies_module/domain/repository/base_movies_repository.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_movie_details_usecase.dart';

class MovieRepository extends BaseMoviesRepository {
  //كده انا ببقى وصلت لاخر مرحله وانا ب جيت الداتا
  //اعمل الريبوزتري بتاعتي تروح تنادي ع الداتا من الداتا سورس او تعمل كل الميثودز اللي ف الداتا سورس
 //ف انا هنا محتاج انادي ع الداتا سورس وعشان مفيش امبلمنتيشن هينادي ع امبلمنتيشن
  //ف مينفعش انادي ديركت ع موفي ريموت داتا سورس فهتكلم مع الابستراكت كلاسز اللي هى بيز موفي داتا سورس

 //ف هعمل فاينال بيز موفي ريموت داتا سورس وهعمل الكونستراكتور
  final BaseMovieRemoteDataSource  baseMovieRemoteDataSource ;
  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  //بعد فيوتشر هعمل ازيار ودي تبع دارت زيد بتيح ليا اعمل اتنين ريترن ليفت و رايت
  //الشمال للفيلير واليمين للسكسيس وعايز ف الفلير حاجه تكون ثابته ع كل الفلير اللي بيحصل ف الابلكيشن فعمل ف الايرور فايل ثابت فيلير
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async {
    //وهبدء اشتغل دلوقتي مع البيز ريموت داتا سورس بعد ماعملتها فوق وهاخد بالي انه بيريترن ليست موفي موديل ف الابستراكت
 //لما اجي استقبل القيمه اللي عندي اللي هى ريزلت بلاقيها ف حالة السكسيس ليست اوف موفي او ف الايرور تبقى اكسبشن ماسج
 //ومينفعش طبعا عند الفيوشر ف الليست اكتب اتنين بتاع الاحتمالات اللي هتظهرلي
final result = await baseMovieRemoteDataSource.getNowPlayingMovies() ;

//الرايت دي حاجه تبع الدارت زد برضو بقوله ف حالة الجنب الرايت اليمين ف الايزر اللي عند الفيوتشر يبقى رجع ريزلت ع طول
try {
  return Right(result);
} on ServerException catch(failure) {
  //ف حالة السيرفر اكسبشن, كاتش فيلير وريترن ف حالة الليفت اللي هو مشكله من السيرفر فيلير خد الفيلير والايرور ماسج.ستيتس ماسج
  return Left(ServerFailure(failure.errorMessageModel.statusMessage)) ;
}
  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies() ;
  try {
    return Right(result) ;
  } on ServerException catch (failure) {
    //البرينت دي لو عايز اطبع الايرور كله مش الماسج بشس
    print(failure.errorMessageModel);
    return Left(ServerFailure(failure.errorMessageModel.statusMessage)) ;
  }

  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies() ;
    try {
      return Right(result) ;
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage)) ;
    }
  }

  @override
  Future<Either<Failure,MovieDetail>> getMovieDetail(MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetail(parameters) ;
    try {
      return Right(result) ;
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage)) ;
    }
  }

}


