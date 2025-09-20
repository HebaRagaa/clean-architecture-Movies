


 import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_tv/core_%20module/error/failure.dart';
import 'package:movies_tv/core_%20module/useCase/base_usecase.dart';
import 'package:movies_tv/movies_module/domain/entities/recommendation.dart';
import 'package:movies_tv/movies_module/domain/repository/base_movies_repository.dart';
// هديله هنا الريتيرن اللي هو الريكومينديشن والباراميتر وهعمل اوفر رايد للميثود كود
 //وهعمل للباراميترز كلاس تحت ده
 class GetRecommendationUseCase extends
                 BaseUseCase <List<Recommendation>, RecommendationParameters> {

   final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationUseCase(this.baseMoviesRepository);
   //ولما هحذف الثرو اكسبشن بتاع الاوفر رايد بتاع الميثود كول هلاقيه ضرب ايرور لازم اعمل فاينال بيز موفي ريبوزتري والكونستراكتور
   @override
  Future<Either<Failure, List<Recommendation>>> call(
                      RecommendationParameters parameters) async {
  //وبعد ما اعمل الفاينال بيز موفي ريبو هعمله هنا واقول هيرجع الريكومندشن
   return await baseMoviesRepository.getRecommendation(parameters);
  }

}

 class RecommendationParameters extends Equatable {
   final int id;
  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [];

 }

