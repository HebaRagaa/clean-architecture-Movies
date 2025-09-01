

 //هبص للصوره هلاقي الاستيت اللي ممكن تظهرلي الفيلم نفسه واللودينج والماسج ف حالة الايرور
//هنلاقي اذ لودينج واذ لوديد واذ ايرور هتبقى ثابته مع اي ركويست ببعته ف الافضل اعملها اينم
//والاينم ده هبدء اسويتش ف الداتا اللي جواه او بين الحالات المختلفه وهعمله ف الكور ف اليوتيلز هعمل اينم
import 'package:equatable/equatable.dart';
import 'package:movies_tv/core_%20module/utils/enums.dart';
import 'package:movies_tv/movies_module/domain/entities/movie.dart';

//يبقى كده لو هعمل ميثود جديده بضيفها ف الاستيت والبلوك والاسكرين اقصد هى موجوده بس مافعلتهاش عشان تظهر
class MoviesState extends Equatable {
  //اول حاجه محتاج اعمل فاينال للموفيز اللي هتجيلي من اليوز كيسز
//لو رحت لاول يوز اللي هى الجيت هلاقيها بترجع ليست اوف موفي وهسميها ناو بلاينج
  final List<Movie> nowPlayingMovies ;
  final RequestState  nowPlayingState ;
  final String nowPlayingMessage ;

  final List<Movie> popularMovies ;
  final RequestState  popularState ;
  final String popularMessage ;

  final List<Movie> topRatedMovies ;
  final RequestState  topRatedState ;
  final String topRatedMessage ;

//شوفي الكومنتات عشان كده عملت كوبي ويز بدل ما كان بيظهر كونست ليستا فاضيه او لودينج او استرنج فاضي
//ف الكوبي ويز بتخليني اتفادى كل ده ففي الكوبي ويز بقوله ف اول جزء اي حاجه من دول ممكن ترجعلك نل
 //فبقوله اي حاجه بنل خدلي الفاليو اللي بالفعل موجوده ف الاوبجيكت الموفي استيت ده ولو راجعه بفاليو ف خد الجديده ف الكوبي ويز
  const MoviesState( {
    //هنا بقوله ف حالة انها فاضيه رجع ليستا فاضيه
    this.nowPlayingMovies = const [],
    //وهنا رجع ركويست استيت لودينج
    this.nowPlayingState = RequestState.loading,
    //وف حالة الماسج فاضيه
    this.nowPlayingMessage = '',

    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',

    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  //وبدل ما اكريت اوبجيكت جديد من الموفي استيت ف الموفي بلوك عند الايميت,لا انا هستخدم الكوبي ويز
  //هبعتله القيمه اللي انا عايز اضيفها جديد يعني مثلا الناو بلاينج موفيز لو انا عايز ابعتها هبعتها ف الكوبي ويز
 //وهو هيعمل اتشيك لو القيمه اللي رجعالي دي بنل ف هاخد اللي ف الاوبجيت اللي هو بعد زز ف الكونستراكت اللي تحت
  //ولو القيم اللي رجعالي مش بنل هسيف القيم الجديده اللي هى قبل كلامتين الاستفهام تحت برضو
  MoviesState copyWith ({

    List<Movie>? nowPlayingMovies ,
     RequestState?  nowPlayingState ,
     String? nowPlayingMessage ,

     List<Movie>? popularMovies ,
     RequestState?  popularState ,
     String? popularMessage ,

    List<Movie>? topRatedMovies ,
    RequestState?  topRatedState ,
    String? topRatedMessage ,

  }) {
    return MoviesState(
      //لو القيمه اللي جيالك بنل , خد القيمه اللي ف الاوبجيكت
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,

      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,

      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,

    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,

    popularMovies,
    popularState,
    popularMessage,

    topRatedMovies,
    topRatedState,
    topRatedMessage,

  ];

}
