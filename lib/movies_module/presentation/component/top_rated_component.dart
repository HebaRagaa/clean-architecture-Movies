

 import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core_ module/network/api_constance.dart';
import '../../../core_ module/utils/dummy.dart';

class TopRatedComponent extends StatelessWidget {
   const TopRatedComponent({super.key});

   @override
   Widget build(BuildContext context) {
     return FadeIn( // 🎬 (animate_do) لإظهار قائمة Top Rated بأنيماشن
       duration: const Duration(milliseconds: 500),
       child: SizedBox(
         height: 170.0,
         child: ListView.builder(
           shrinkWrap: true,
           scrollDirection: Axis.horizontal,
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           itemCount: moviesList.length,
           itemBuilder: (context, index) {
             final movie = moviesList[index];
             return Container(
               padding: const EdgeInsets.only(right: 8.0),
               child: InkWell(
                 onTap: () {
                   /// TODO : NAVIGATE TO  MOVIE DETAILS
                 },
                 child: ClipRRect(
                   borderRadius:
                   const BorderRadius.all(Radius.circular(8.0)),
                   child: CachedNetworkImage( // 🖼️ صورة الفيلم
                     width: 120.0,
                     fit: BoxFit.cover,
                     imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                     placeholder: (context, url) => Shimmer.fromColors( // ✨ شيمر وقت التحميل
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
                     const Icon(Icons.error),
                   ),
                 ),
               ),
             );
           },
         ),
       ),
     );
   }
 }



