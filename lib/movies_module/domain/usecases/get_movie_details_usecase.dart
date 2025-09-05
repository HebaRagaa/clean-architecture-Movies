

 import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_tv/core_%20module/error/failure.dart';
import 'package:movies_tv/core_%20module/useCase/base_usecase.dart';
import 'package:movies_tv/movies_module/domain/entities/movie_details.dart';
import 'package:movies_tv/movies_module/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  //انا محتاج الاي دي بتاع الفيلم عشان اعرف اجيب الديتلز بتاعته فهحطه كباراميترز ف الكول هنا فهلاقيه
  //ضرب ايرور ف البيز يوز كيس لاني محددله تي بس فهعمل متغير اسميه مثلا باراميترز عشان يبقى معبر
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetail();
  }
}

  //دلوقتي انا لو عند الكول غيرت رايي وعايز استعمل اكتر من باراميتر هيقول ايرور لانك محدد باراميتر واحد
  //الحل اني ف كل يوز كيس من اللي عايز اكتر من باراميتر هعمل كلاس باسم معبر وياكستند من اكويتابل
//يبقى هخليه كلاس لو اكتر من باراميتنؤر وولو واحد ممكن اخليه كلاس عادي او زي ماعملنا
 class MovieDetailsParameters extends Equatable {
  final int movieId ;
  //ولو عايز اضيف حاجه تاني باراميتر هضيفها هنا
  const MovieDetailsParameters ({required this.movieId});
  @override
  List<Object?> get props => [movieId] ;


 }




