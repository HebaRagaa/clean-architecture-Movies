import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath; //الصوره نفسها
  final List<int> genreIds;
  final String overview; //اللي هو الديسكربشن
  final double voteAverage; //اللي هو التصويت او التقييم
  final double releaseDate;


  //والريكويرد او علامة النل ؟ ف تسمياتهم فوق بتعتمد ع الكي والفاليو ف الايه بي اي وبالاتفاق مع الباك
  const Movie({
    //وزي ماعملنا كونست فوق لازم نعمل هنا برضو ف المين والا مفيش حاجه هتبقى صح ف الهاش كود
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,

  });

  //هنكليك جنريت ومنها نختار اكويتابل برو بيرتز
  @override
  List<Object> get props =>
      [id, title, backdropPath, genreIds, overview, voteAverage,releaseDate ];


//الباكيدج اكويتابل وفرت علينا كل ده
// //هنا دست كليك واخترنا جنريت وبعدين كنترول اول و اوك وظهرلنا ده
// //دي ميثود اسمها اوبريتور بترجع بوليان وبيعمل اندينتيكال للاوبجيكت الحالي والاظر
// @override
// bool operator ==(Object other) =>
//     identical(this, other) ||
//         //اول حاجه بيتأكد انه الاظر ده من نوع موفي
//     other is Movie &&
//         runtimeType == other.runtimeType &&
//         id == other.id &&
//         title == other.title &&
//         backdropPath == other.backdropPath &&
//         genreId == other.genreId &&
//         overview == other.overview &&
//         voteAverage == other.voteAverage;
//
// //^ علامة البت وايز دي لها حسب وصوره بتشرحها بس خلينا نقول كانها بتقارن وتشوف الباقي من قسمتهم او مقارنتهم
// @override
// int get hashCode =>
//     id.hashCode ^
//     title.hashCode ^
//     backdropPath.hashCode ^
//     genreId.hashCode ^
//     overview.hashCode ^
//     voteAverage.hashCode;
//
// //هاجي هنا هعمل اوفر رايد للهاش كود و للاكويتابل


}
