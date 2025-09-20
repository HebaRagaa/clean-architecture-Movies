


 import 'package:movies_tv/movies_module/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String,dynamic> json) =>
      RecommendationModel(
          backdropPath: json['backdrop_Path'],
          id: json['id']
      );

}

