



import 'package:movies_tv/movies_module/domain/entities/genres.dart';
import 'package:movies_tv/movies_module/domain/entities/movie_details.dart';
import 'package:movies_tv/movies_module/domain/entities/recommendation.dart';

//الدامي هى داتا دامي جايبينها من الايه بي اي
MovieDetail movieDetailDummy = const MovieDetail(
  backdropPath: "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
  genres: [
    Genres(name: 'Family', id: 10751),
  ],
  id: 438148,
  overview:
  "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
  releaseDate: "2022-06-29",
  runtime: 87,
  title: "Minions: The Rise of Gru",
  voteAverage: 7.8,
);

//وعملنا ليست اوف ريكوميندشن عشان نتيست بيها اليو اي قبل مانشتغل مع اليوز كيسز بتاعتنا
List<Recommendation> recommendationDummy = [
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
  const Recommendation(
      backdropPath: "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg", id: 924482),
];

