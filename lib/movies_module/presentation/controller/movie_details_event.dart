part of 'movie_details_bloc.dart';

//بفكر ف الايفينت ازاي بشوف عندي ف الاسكرين اتننين الموفي ديتيلز والمور لايك زيز بتاع الافلام المشابهه
sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

 class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id ;
  const GetMovieDetailsEvent(this.id);
  @override
  List<Object?> get props => [id];
 }


 class GetMovieRecommendationEvent extends MovieDetailsEvent {
   final int id ;
   const GetMovieRecommendationEvent(this.id);
   @override
   List<Object?> get props => [id];
 }

