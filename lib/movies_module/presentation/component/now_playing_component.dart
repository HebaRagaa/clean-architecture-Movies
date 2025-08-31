

 //وده اول جزء بيتعمله ريبلد ف اي حاجه يتعملها ريبلد بعملها ف كومبوننت منفصل
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core_ module/network/api_constance.dart';
import '../../../core_ module/utils/dummy.dart';

import '../../../core_ module/utils/dummy.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    //مكتبة بتوفر أنيميشن جاهزة زي FadeIn, Bounce, ZoomIn, Shake … إلخ، من غير ما تكتب كود أنيميشن معقد.انيميتد دو
    //استعمالاته: زرار بيدخل بمؤثر جميل.أي عنصر عايز تلفت بيه نظر المستخدم .صورة تعمل Bounce أو FadeIn عند الفتح.
    // الفيد بتخلي لما نعمل اسكرول بين الصور الكبيره الاسلايد تكون بانيميشن بسيط
    return  FadeIn( // 🎬 (animate_do) بيخلي العناصر تظهر بتأثير Fade In
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
    );
  }
}


