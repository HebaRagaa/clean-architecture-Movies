

 //هبص للصوره هلاقي الاستيت اللي ممكن تظهرلي الفيلم نفسه واللودينج والماسج ف حالة الايرور
//هنلاقي اذ لودينج واذ لوديد واذ ايرور هتبقى ثابته مع اي ركويست ببعته ف الافضل اعملها اينم
//والاينم ده هبدء اسويتش ف الداتا اللي جواه او بين الحالات المختلفه وهعمله ف الكور ف اليوتيلز هعمل اينم
import 'package:equatable/equatable.dart';
import 'package:movies_tv/core_%20module/utils/enums.dart';
import 'package:movies_tv/movies_module/domain/entities/movie.dart';

class MoviesState extends Equatable {
  //اول حاجه محتاج اعمل فاينال للموفيز اللي هتجيلي من اليوز كيسز
//لو رحت لاول يوز اللي هى الجيت هلاقيها بترجع ليست اوف موفي وهسميها ناو بلاينج
  final List<Movie> nowPlayingMovies ;
  final RequestState  nowPlayingState ;
  final String nowPlayingMessage ;

  const MoviesState({
    //هنا بقوله ف حالة انها فاضيه رجع ليستا فاضيه
    this.nowPlayingMovies = const [],
    //وهنا رجع ركويست استيت لودينج
    this.nowPlayingState = RequestState.loading,
    //وف حالة الماسج فاضيه
    this.nowPlayingMessage = '',
   });

  @override
  List<Object?> get props => [nowPlayingMovies, nowPlayingState, nowPlayingMessage];

}
