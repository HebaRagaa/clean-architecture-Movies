





//وهنادي ع بيز جيت موفي ريبوزتري وهنادي عليها بالطرقه دي عشان ابستراكت كلاس مينفعش اغعله انشيال
import 'package:movies_tv/movies_module/domain/entities/movie.dart';
import 'package:movies_tv/movies_module/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {

  final BaseMoviesRepository baseMoviesRepository ;
  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  //ودلوقتي هنعمل ميثود ينادي ع الميثود بتاع جيت ناو بلاينج موفيز اللي ف الريبو وهسميها اكس كيوت
  //وهنا مش هبعت حاجه ف الباراميترز اللي هما القوسين لان لما هشوف هلاقي انه البيز يو ار ال والاند بوينت والايه بي اي كي
  Future<List<Movie>> execute() async {
    //وجوا البدي هعمل اويت عشان زي ما اتفقنا كله فيوتشر ف البيز موفيز ريبوزتري
    return await baseMoviesRepository.getTopRatedMovies();

  }


}




