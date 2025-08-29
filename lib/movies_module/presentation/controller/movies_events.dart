//بنبدء بالايفنتس او الاستيت وهنا ف اول اسكرين عندنا 3 ايفنتس ناو بلاينج وبوبيولر وتوب ريتد
//  اي حاجه بيكون فيها داتا بنعملها اكستاند للاكويتابل ونعمل البروبيرتز كالعاده بالجنريت
import 'package:equatable/equatable.dart';

abstract class MoviesEvents extends Equatable {
  const MoviesEvents(); //ده الكونستراكتور

  @override
  List<Object> get props => [];

}

 class GetNowPlayingMoviesEvent extends MoviesEvents {

 }

class GetPopularMoviesEvent extends MoviesEvents {

}

class GetTopRatedMoviesEvent extends MoviesEvents {

}


