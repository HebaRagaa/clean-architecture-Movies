import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tv/core_%20module/utils/enums.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_bloc.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core_ module/network/api_constance.dart';

class PopularComponents extends StatelessWidget {
  const PopularComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      //وبقوله ابنيلي ف حاله واحده او عيد بناءه لما يكون الكارنت استيس السابق مش بيساوي الحالي او بالمختصر بقوله متبنيش غير لو اتغير استيت
    buildWhen: (previous,current) =>
                previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return SizedBox(
              //هعملها بنفس ارتفاع الاسلايدر
                height: 170,
                child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return FadeIn( // 🎬 (animate_do) لإظهار القائمة بتأثير Fade In
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder( // 📜 قائمة أفقية من الأفلام
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage( // 🖼️ (cached_network_image) صورة الفيلم
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                            //مكتبة بتعمل إفكت التحميل المتحرك (Shimmer effect) اللي بيبان كأنه Skeleton loading (زي في فيسبوك قبل ما الصور تطلع).
                            placeholder: (context, url) =>
                                Shimmer.fromColors( // ✨ (shimmer) تأثير تحميل
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
                            errorWidget: (context, url, error) =>
                            const Icon(
                                Icons.error), // ❌ أيقونة عند فشل تحميل الصورة
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
                height: 170,
                child: Center(child: Text(state.nowPlayingMessage)));
        }
      }
    );
  }
}




