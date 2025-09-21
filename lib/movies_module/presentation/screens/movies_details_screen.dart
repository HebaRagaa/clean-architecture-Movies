

  //انا اخدتها كوبي بيست من عند اسامه الجندي لكن هفهم كل تفصيله
  import 'package:animate_do/animate_do.dart';
  import 'package:cached_network_image/cached_network_image.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:google_fonts/google_fonts.dart';
import 'package:movies_tv/core_%20module/network/api_constance.dart';
import 'package:movies_tv/core_%20module/services/services_locator.dart';
import 'package:movies_tv/core_%20module/utils/app_string.dart';
import 'package:movies_tv/core_%20module/utils/enums.dart';
import 'package:movies_tv/movies_module/domain/entities/genres.dart';
import 'package:movies_tv/movies_module/presentation/controller/movie_details_bloc.dart';
import 'package:movies_tv/movies_module/presentation/screens/dummy.dart';
  import 'package:shimmer/shimmer.dart';

  class MovieDetailScreen extends StatelessWidget {
    final int id; // الـ id بتاع الفيلم اللي جاي من الشاشة السابقة

    const MovieDetailScreen({super.key, required this.id});

    @override
    Widget build(BuildContext context) {
      return BlocProvider(
        // بننشئ MovieDetailsBloc ونبعتله event أول ما الشاشة تفتح
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))       // جلب تفاصيل الفيلم
        ..add(GetMovieRecommendationEvent(id)), // جلب اقتراحات أفلام مشابهة
        //وطبعا لو فكرت تنادي كده او تعمل رن مش هيعمل لازم تعمل الليزي فولس
        lazy: false, // معناه يشغل الـ Bloc على طول أول ما الشاشة تفتح
        child: const Scaffold(
          body: MovieDetailContent(),
        ),
      );
    }
  }

  class MovieDetailContent extends StatelessWidget {
    const MovieDetailContent({
      super.key,
    });

    @override
    Widget build(BuildContext context) {
      return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          switch (state.movieDetailsState) { // نشوف حالة الطلب
            case RequestState.loading: // لسه بيحمل
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded: // البيانات وصلت
              return CustomScrollView(
                key: const Key('movieDetailScrollView'),
                slivers: [
                  // AppBar بيتحرك مع السكرول
                  SliverAppBar(
                    pinned: true, // يفضل ظاهر
                    expandedHeight: 250.0, // الارتفاع لما يكون مفتوح
                    flexibleSpace: FlexibleSpaceBar(
                      background: FadeIn(
                        duration: const Duration(milliseconds: 500),
                        child: ShaderMask( // نعمل تدرج فوق الصورة
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.5, 1.0, 1.0],
                            ).createShader(
                              Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn, // يدمج التدرج مع الصورة
                          child: CachedNetworkImage( // تحميل الصورة من API
                            width: MediaQuery.of(context).size.width,
                            imageUrl: ApiConstance.imageUrl(
                                state.movieDetail!.backdropPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // باقي تفاصيل الفيلم
                  SliverToBoxAdapter(
                    child: FadeInUp( // أنيميشن من تحت لفوق
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // اسم الفيلم
                            Text(state.movieDetail!.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                )),
                            const SizedBox(height: 8.0),

                            // صف فيه تاريخ الإصدار + التقييم + المدة
                            Row(
                              children: [
                                // تاريخ الإصدار
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    state.movieDetail!.releaseDate.split('-')[0], // السنة
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                // التقييم بالنجمة
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      (state.movieDetail!.voteAverage / 2) // تقسيم على 2 (من 5)
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '(${state.movieDetail!.voteAverage})', // التقييم الأصلي
                                      style: const TextStyle(
                                        fontSize: 1.0, // 👀 ده صغير جدًا يمكن غلطة
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16.0),

                                // وقت الفيلم
                                Text(
                                  _showDuration(state.movieDetail!.runtime),
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),

                            // الوصف
                            Text(
                              state.movieDetail!.overview,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8.0),

                            // التصنيفات (Genres)
                            Text(
                              '${AppString.genres}: ${_showGenres(state.movieDetail!.genres)}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // عنوان More Like This
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                    sliver: SliverToBoxAdapter(
                      child: FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: const Text(
                          AppString.moreLikeThis,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Tab(text: 'More like this'.toUpperCase()),
                  // قائمة الأفلام المشابهة
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                    sliver: _showRecommendations(),
                  ),
                ],
              );
            case RequestState.error:
              return Center(child: Text(state.movieDetailsMessage));
          }
        },
      );
    }

    // دالة لعرض التصنيفات (Genres) بفاصلة
    String _showGenres(List<Genres> genres) {
      String result = '';
      for (var genre in genres) {
        result += '${genre.name}, ';
      }

      if (result.isEmpty) {
        return result;
      }

      return result.substring(0, result.length - 2); // نشيل آخر فاصلة
    }

    // دالة لعرض وقت الفيلم بالساعات والدقايق
    String _showDuration(int runtime) {
      final int hours = runtime ~/ 60;
      final int minutes = runtime % 60;

      if (hours > 0) {
        return '${hours}h ${minutes}m';
      } else {
        return '${minutes}m';
      }
    }

    // دالة لعرض قائمة الأفلام المقترحة (Recommendations)
    Widget _showRecommendations() {
      return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) => SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final recommendation = state.recommendation[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: CachedNetworkImage(
                    //وهنا هنقوله من خلال علامة التعجب انها مش هتكون بنل لاننا حاطين انيشيال فاليو ف الريكومندشن موديل
                    imageUrl: ApiConstance.imageUrl(recommendation.backdropPath!),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            childCount: recommendationDummy.length, // عدد الأفلام (dummy مؤقتًا)
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3, // 3 أعمدة
          ),
        ),
      );
    }
  }

