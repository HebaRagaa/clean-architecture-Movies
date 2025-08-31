import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_tv/movies_module/presentation/component/now_playing_component.dart';
import 'package:movies_tv/movies_module/presentation/component/popular_components.dart';
import 'package:movies_tv/movies_module/presentation/component/top_rated_component.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core_ module/network/api_constance.dart';
import '../../../core_ module/services/services_locator.dart';
import '../../../core_ module/utils/dummy.dart';

//import 'package:animate_do/animate_do.dart'; // 🎬 (animate_do) باكيج خاص بالأنيميشن الجاهزة
// import 'package:cached_network_image/cached_network_image.dart'; // 🖼️ (cached_network_image) تحميل صور من النت مع الكاش
// import 'package:carousel_slider/carousel_slider.dart'; // 🎡 (carousel_slider) عمل سلايدر للصور/العناصر
// import 'package:flutter/material.dart'; // 🎨 (flutter) الأساسيات (UI Widgets)
// import 'package:google_fonts/google_fonts.dart'; // 🔤 (google_fonts) استخدام خطوط جوجل الجاهزة
// import 'package:shimmer/shimmer.dart'; // ✨ (shimmer) إفكت تحميل متحرك (skeleton loading)
// import '../../../core_ module/network/api_constance.dart'; // 🌐 ثابت رابط الصور من API
// import '../../../core_ module/utils/dummy.dart'; // 📂 بيانات مؤقتة للتجربة

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //وطبعا بعد عمل السيرفز لوكيتور الاس ال مش محتاج اعمل ريترن موفيز بلوك وبتاخد اليوز كيس لكن كتبت الاس ال بس
      create: (context) => sl<MoviesBloc>(),
      child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            // 🗝️ مفتاح مميز للـ ScrollView
            //في حد هيقولك طب مات انا ممكن اخد الكونتينر بتاع كل كومبوننت احطه معاها بس ده مش حلو
            //انت كده هتحتاج تحط كولم ف الكومبوننت ده غير الكولوم الاساسي هنا فبكده تبقى زوده ويدجت وخلاص والهدف اقلل
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlayingComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: GoogleFonts
                            .poppins( // 🔤 (google_fonts) خط Poppins من Google
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white
                        ),
                      ),
                      //الانك ويل عشان لما تضغط ينقلك للببيولر اسكرين او الموفي ديتلز وهكذا
                      InkWell( // 👆 نص + أيقونة بيوجه المستخدم لصفحة Popular
                        onTap: () {
                          /// TODO : NAVIGATION TO POPULAR SCREEN
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text('See More',
                                style: TextStyle(color: Colors.white),),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularComponents(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Rated",
                        style: GoogleFonts
                            .poppins( // 🔤 (google_fonts) خط Poppins
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO Top Rated Movies Screen
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text('See More',
                                style: TextStyle(color: Colors.white),),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedComponent(),
                const SizedBox(height: 50.0), // 📏 مسافة فارغة أسفل الصفحة
              ],
            ),
          )
      ),
    );
  }
}


