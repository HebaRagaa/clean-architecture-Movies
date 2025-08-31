

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core_ module/network/api_constance.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        key: const Key('movieScrollView'), // 🗝️ مفتاح مميز للـ ScrollView
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //مكتبة بتوفر أنيميشن جاهزة زي FadeIn, Bounce, ZoomIn, Shake … إلخ، من غير ما تكتب كود أنيميشن معقد.انيميتد دو
          //استعمالاته: زرار بيدخل بمؤثر جميل.أي عنصر عايز تلفت بيه نظر المستخدم .صورة تعمل Bounce أو FadeIn عند الفتح.
          // الفيد بتخلي لما نعمل اسكرول بين الصور الكبيره الاسلايد تكون بانيميشن بسيط
          FadeIn( // 🎬 (animate_do) بيخلي العناصر تظهر بتأثير Fade In
            duration: const Duration(milliseconds: 500), // ⏱️ مدة الأنيميشن
            //مكتبة بتخليك تعمل سلايدر صور/عناصر يتنقل المستخدم بينهم بالسحب أو التمرير.carousel_slider
            child: CarouselSlider( // 🎡 (carousel_slider) سلايدر لعرض صور الأفلام
              options: CarouselOptions(
                height: 400.0, // 📏 ارتفاع السلايدر
                viewportFraction: 1.0, // 🔲 كل عنصر يغطي الشاشة بالكامل
                onPageChanged: (index, reason) {}, // 🔄 حدث عند تغيير العنصر
              ),
              items: moviesList.map(
                (item) {
                  return GestureDetector(
                    key: const Key('openMovieMinimalDetail'), // 🗝️ مفتاح مميز
                    onTap: () {
                      /// TODO : NAVIGATE TO MOVIE DETAILS
                    },
                    child: Stack( // 🏗️ طبقات فوق بعضها (الصورة + النصوص)
                      children: [
                        ShaderMask( // .بيعمل الشادو من تحت وفوق ف الصور🎨 تأثير Gradient فوق الصورة
                          shaderCallback: (rect) {
                            //اللينير جردين عشان تحط الكالرز بتاعتك
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn, // 🌀 وضع الدمج
                          //مكتبة لعرض الصور من الإنترنت مع التخزين المؤقت (cache).
                          // يعني أول مرة يحمل الصورة من النت → بعدها يحفظها محليًا → يجيبها من الجهاز بدل النت.
                          child: CachedNetworkImage( // 🖼️ (cached_network_image) عرض صورة البوستر
                            height: 560.0,
                            //بنحط فيها الايمج اللي جيالنا من الباك اند
                            imageUrl: ApiConstance.imageUrl(item.backdropPath), // 🌐 رابط الصورة من API
                            fit: BoxFit.cover, // 📐 تغطية كاملة
                          ),
                        ),
                        Align( // 📍 محاذاة العناصر لأسفل الصورة
                          //عشان نحط التايتل وكلمة ناو بلاينج
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.circle, // 🔴 أيقونة دائرية حمراء
                                      color: Colors.redAccent,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'Now Playing'.toUpperCase(), // 🎬 النص أسفل الصورة
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  item.title, // 📝 اسم الفيلم
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: GoogleFonts.poppins( // 🔤 (google_fonts) خط Poppins من Google
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
                        Text('See More',style: TextStyle(color: Colors.white),),
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
          FadeIn( // 🎬 (animate_do) لإظهار القائمة بتأثير Fade In
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder( // 📜 قائمة أفقية من الأفلام
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
                        child: CachedNetworkImage( // 🖼️ (cached_network_image) صورة الفيلم
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                          //مكتبة بتعمل إفكت التحميل المتحرك (Shimmer effect) اللي بيبان كأنه Skeleton loading (زي في فيسبوك قبل ما الصور تطلع).
                          placeholder: (context, url) => Shimmer.fromColors( // ✨ (shimmer) تأثير تحميل
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
                            const Icon(Icons.error), // ❌ أيقونة عند فشل تحميل الصورة
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
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
                  style: GoogleFonts.poppins( // 🔤 (google_fonts) خط Poppins
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
                        Text('See More',style: TextStyle(color: Colors.white),),
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
          FadeIn( // 🎬 (animate_do) لإظهار قائمة Top Rated بأنيماشن
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
          ),
          const SizedBox(height: 50.0), // 📏 مسافة فارغة أسفل الصفحة
        ],
      ),
      )
    );
  }
}


