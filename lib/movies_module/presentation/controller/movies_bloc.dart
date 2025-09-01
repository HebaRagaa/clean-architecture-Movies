

 // هنعمل اكستند للبلوك باكيدج وهنلاقيها بتاخد الايفينت والاستيت

 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tv/core_%20module/utils/enums.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_Popular_movies_usecase.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_tv/movies_module/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_event.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_state.dart';


// هنعمل اكستند للبلوك باكيدج وهنلاقيها بتاخد الايفينت والاستيت
 class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase  getNowPlayingMoviesUseCase ;
  final GetPopularMoviesUseCase  getPopularMoviesUseCase ;
  final GetTopRatedMoviesUseCase  getTopRatedMoviesUseCase ;

  // MoviesBloc() : super(MoviesInitial());
  //الانيشيال استيت بتاعنا هو الموفيز استيت
  //وده كونستراكتور والسوبر
  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase, this.getTopRatedMoviesUseCase) : super(MoviesState()) {
//عايزين اول ما ننادي ع البلوك نعمل فاير لاول اينيت استيت وهى الناو بلاينج موفيز
//السوبر دي بتنادي ع البيرنت بتاع الكلاس اللي هو البلوك نفسها بقوله خد الانيشيال استيت اللي هى الموفي استيت
  //بنضيف ايفنت ف البلوك باستخدام اون وبنحتلها الايفنت اللي هو جيت ناو ايفنت والايفنت اللي انت ىكتبته بين السهمين
  on<GetNowPlayingMoviesEvent>((event,emit) async {
   // الايميت هى اللي بتعمل فاير او بتقول انا عندي استيت جديد او بتري فريش الصفحه اللي قدامك
//ودلوقتي هنبدء ننادي ع اليوز كيس وهلاقيها محتاجه مني بيز موفي ريبوزتري ودي محتاجه بيز ريموت داتا سورس
//ما ينفعش تنادي على الميثود كـ GetNowPlayingMoviesUseCase.execute() كأنها static، لإن الميثود مش static.
// لازم تستخدم الـ instance اللي أنت مررته في الكونستراكتور: getNowPlayingMoviesUseCase.
 final result = await getNowPlayingMoviesUseCase.execute();
//دلوقتي عايز اقول للبلوك اللي عندي انت اول ماتتكريت ناديلي ع الجيت ناو بلاينج موفيز
//وعشان استعمل البلوك ف الموفيز اسكرين ف محتاج ويدجت تكريت نيو استنسز من من البلوك ده
   //مالهاش لازمه دلوقتي كنا بنتست بيها
  // emit(const MoviesState(nowPlayingState: RequestState.loaded));
    //وبكده هنأميت الموفيز استيت والناو بلاينج استيت ونطبع لوديد
   print(result);
   //بنستعمل الريزلت من خلال فولد ليها وف الليفت هعمل ايميت للماسج اللي راجعه ف حالة الايرور واغير برضو الايميت استيت
   //الالفيلير اللي هبعت منها الماسج
 result.fold( (l) => emit(
  //وبدل ما اكريت اوبجيكت جديد من الموفي استيت ف الموفي بلوك عند الايميت,لا انا هستخدم الكوبي ويز
 state.copyWith (
     nowPlayingState: RequestState.error,
     nowPlayingMessage: l.message)),

    (r) => emit(
        state.copyWith(
            nowPlayingMovies: r,
        nowPlayingState: RequestState.loaded)));

  }) ;

  on<GetPopularMoviesEvent>((event,emit) async {
   final result = await getPopularMoviesUseCase.execute();
   result.fold( (l) => emit(
       state.copyWith(
       popularState: RequestState.error,
       popularMessage: l.message)),

           (r) => emit(
               state.copyWith(
               popularMovies: r,
               popularState: RequestState.loaded)));
  }) ;


  }

 }

