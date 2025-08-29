import 'package:movies_tv/movies_module/domain/entities/movie.dart';

//الموديل ده هو ىللي بنبدا نعمل فيه شوية موديلز او بروسيز ع الداتا اللي بتجيلك

 class MovieModel extends Movie {
   const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
   });

 //المفروض مني دلوقتي استقبل جيسون فايل عباره عن كي وفاليو وابدا اعمله كونفيرت للموفي موديل ده
 factory MovieModel.fromJson (Map<String,dynamic> json) => MovieModel(
     id: json['id'],
     title: json['title'],
     backdropPath: json['backdrop_path'],
     //ودي هعملها كده لان الجيندر اي ديز ليست اصلا
     genreIds: List<int>.from(json['genre_ids'].map((e) => e) ),
     overview: json['overview'],
     //عشان مره ترجع بدابل ومره انت فبقوله اي قيمه حولها لدابل
     voteAverage: json['vote_average'].toDouble(),
     releaseDate: json['release_date']
 );


 }
