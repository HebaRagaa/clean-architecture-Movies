import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tv/core_%20module/utils/enums.dart';
import 'package:movies_tv/movies_module/domain/entities/movie_details.dart';
import 'package:movies_tv/movies_module/domain/entities/recommendation.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase) : super( const MovieDetailsState()) {
    //وهنا مش محتاج اشتغل مع الموفي ديتيلز ايفنت لكن هشتغل ع الجيت موفي ديتلز ايفينت
   //وكمان هحذف الايفينت والايميت لاني هشتغل بالميثود الخارجيه اللي عملناها قبل كده ونكريت منها ميثود بسيطه
    // on<MovieDetailsEvent>((event, emit) {
     on<GetMovieDetailsEvent>(_getMovieDetails);
     on<GetMovieRecommendationEvent>(_getRecommendation);

  }

  //وعشان هستعمل اليوز كيس هكتبه وابعته ف الكونستراكتر
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
         GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit)async{
    //هنتعامل مع الجيت موفي ديتل يوز كيس وهلاقيها بتاخد باراميتر اللي هى موفي ديتيلز باراميترز
 //وهنلاقيه بياخد الموفي اي دي ودا هنلاقيها ف الايفينت اللي ذاكرينها ف السطر اللي فوق ده
 final result = await getMovieDetailsUseCase (MovieDetailsParameters(movieId: event.id));
//الريزلت نعمل عليها فولد عشان دي ايزيار ونروح ع الاستيت نعمل الكوبي ويز

    //وهعمل ايميت للاستيت بالكوبي ويز لاني هغير بس الموفي ديتيلز استيت هخليه ركويست استيت دوت ايرور لاننا ف الليفت
  //والماسج بتاعتنا هناخدها من الليفت سايد دوت الماسج
    result.fold(
            (l) =>
        emit(state.copyWith(movieDetailsState: RequestState.error,
    movieDetailsMessage: l.message,))
    , (r) => emit(state.copyWith(movieDetail: r ,
              movieDetailsState: RequestState.loaded))
    ); //ونبدء نروح ع السيرفز لوكيتور عشان ماننساش وهنزود ف اليوز كيس والبلوك بس لكن الباقي زي ماهو
  }

  FutureOr<void> _getRecommendation(
          GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    //وهنكتب الباراميترز ايفينت اي دي لاننا اصلا كاتبينه ف الجيت موفي ريكومندشن ايفينت اللي حاطينها ف السطر اللي فوق ده
    final result = await getRecommendationUseCase (RecommendationParameters(event.id));
    result.fold((l) => emit (state.copyWith(recommendationState: RequestState.error,
    recommendationMessage: l.message))
        , (r) => emit(state.copyWith(recommendation: r,
        recommendationState: RequestState.loaded))
    );
  }
}
