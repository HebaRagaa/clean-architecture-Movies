
 part of 'movie_details_bloc.dart';


 class MovieDetailsState extends Equatable {
   const MovieDetailsState({
    this.movieDetail,
    //ونيجي عند الركويست نديله انيشيال استيت واللي فوقه مش ليستا ف مينفعش اعمل قوسينه ولكن هعمله بنل
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = ' ',
     this.recommendation = const [],
     this.recommendationState = RequestState.loading,
     this.recommendationMessage = '',
  });

  //هنجيبه من الانتيتي بتاعنا
  final MovieDetail? movieDetail;
  //وطبعا هيكون في ريسبونس او ركويست هيتبعت للايه بي اي واحنا اصلا عاملينه ف الاينم اللي ف اليوتيلز ف الكور
  //هتلاقي الركويست استيت فهستعمله
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
   final List<Recommendation> recommendation;
   final RequestState recommendationState;
   final String recommendationMessage;


   //ودلوقتي الكوبي ويز باخد نفس اسم الكلاس وبقول كوبي ويز وباخد اللي فيهم اللي هما الفاينابل وغيره وتريتيرن الكلاس
//هنمسح الفاينال وكله يبقى نالابل وبدل السيمي كولون يبقى كوما
//هقوله الموفي ديتيلز اللي جيالك من هنا لو بنل ف انت اشستغل مع الموفي ديتيل اللي جيالك من الموديل
   MovieDetailsState copyWith ({
     MovieDetail? movieDetail,
     RequestState? movieDetailsState,
     String? movieDetailsMessage,
     List<Recommendation>? recommendation,
     RequestState? recommendationState,
     String? recommendationMessage,
 }) {
     return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
       movieDetailsState: movieDetailsState?? this.movieDetailsState,
       movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage ,
       recommendation: recommendation ?? this.recommendation,
       recommendationState: recommendationState ?? this.recommendationState,
       recommendationMessage:
       recommendationMessage ?? this.recommendationMessage,
     );
   }


  @override
  List<Object?> get props => [
    movieDetail,
    movieDetailsState,
    movieDetailsMessage,
    recommendation,
    recommendationState,
    recommendationMessage,
  ];
}
