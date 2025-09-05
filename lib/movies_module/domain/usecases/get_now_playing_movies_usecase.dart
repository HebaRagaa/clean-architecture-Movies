

  //وهنادي ع بيز جيت موفي ريبوزتري وهنادي عليها بالطرقه دي عشان ابستراكت كلاس مينفعش اغعله انشيال
 import 'package:dartz/dartz.dart';
import 'package:movies_tv/core_%20module/error/failure.dart';
import 'package:movies_tv/core_%20module/useCase/base_usecase.dart';
import 'package:movies_tv/movies_module/domain/entities/movie.dart';
import 'package:movies_tv/movies_module/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase <List<Movie>, NoParameters> {

  final BaseMoviesRepository baseMoviesRepository ;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  // ودلوقتي هنعمل ميثود ينادي ع الميثود بتاع جيت ناو بلاينج موفيز اللي ف الريبو وهسميها اكس كيوت او ممكن برضو اي اسم
 //وهنا مش هبعت حاجه ف الباراميترز اللي هما القوسين لان لما هشوف هلاقي انه البيز يو ار ال والاند بوينت والايه بي اي كي
 @override
  Future<Either<Failure,List<Movie>>> call(NoParameters noParameters) async {
 //وجوا البدي هعمل اويت عشان زي ما اتفقنا كله فيوتشر ف البيز موفيز ريبوزتري
  return await baseMoviesRepository.getNowPlayingMovies();

 }


 }
