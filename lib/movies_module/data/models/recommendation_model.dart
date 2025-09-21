


 import 'package:movies_tv/movies_module/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  //هلاقي في مشاكل رجعالي بسبب ان الباك دروب باث ممكن ترجع بنل ف لازم اروح للريكومندشن من الاول واعدله
  //ونرجع هنا بقى منخليهاش ركويرد وتحت نعملها انيشيال فاليو عشان لو كانت بنل تبقى فيه حاجه ثابته ترجع بديله بدل ماتضرب ايرور
  const RecommendationModel({ super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String,dynamic> json) =>
      RecommendationModel(
          backdropPath: json['backdrop_Path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
          id: json['id']
      );

}

