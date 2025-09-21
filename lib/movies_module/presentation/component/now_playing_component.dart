//وده اول جزء بيتعمله ريبلد ف اي حاجه يتعملها ريبلد بعملها ف كومبوننت منفصل
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tv/core_%20module/utils/enums.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_bloc.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_state.dart';
import 'package:movies_tv/movies_module/presentation/screens/movies_details_screen.dart';
import '../../../core_ module/network/api_constance.dart';


class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    //مكتبة بتوفر أنيميشن جاهزة زي FadeIn, Bounce, ZoomIn, Shake … إلخ، من غير ما تكتب كود أنيميشن معقد.انيميتد دو
    //استعمالاته: زرار بيدخل بمؤثر جميل.أي عنصر عايز تلفت بيه نظر المستخدم .صورة تعمل Bounce أو FadeIn عند الفتح.
    // الفيد بتخلي لما نعمل اسكرول بين الصور الكبيره الاسلايد تكون بانيميشن بسيط
    return BlocBuilder<MoviesBloc, MoviesState>(
      //الويدجت كانت بتتبني اربع مرات كل واحده منهم ف الرن الواحد وهى الوفروض مره
      //في بيلد وينن بتقولي البرفيس والكارنت استيت الجديد وهقوله اعمل بيلد ف حالة ان
   // ان البرفيس اللي هو الاستيت القديمه الناو بلاينج استيت لا تساوي الكارنت ناو بلاينج استيت
      buildWhen: (previous,current) =>
 //وبقوله ابنيلي ف حاله واحده او عيد بناءه لما يكون الكارنت استيس السابق مش بيساوي الحالي او بالمختصر بقوله متبنيش غير لو اتغير استيت
               previous.nowPlayingState != current.nowPlayingState,
      //وبكده بعد استعمال البيلد وين هيعمل بيلد مرتين بس ف حالة اللودينج وف حالة ان الحاله جات من السيرفر
      //ولاحظ ف الاستيت هتلاقي الثلاث حالات ف الاستيت والديفولت لودينج وف الموفي بلوك هتلاقي نفسك بتغير الحاله بتاعتها
     //من خلال الايميت ف حالة النجاح لوديد وف الايرور ايرور
      builder: (context, state) {
        //انا عملت الاسويتش لسه لاني لو رجعت فيد ان ع طول بتظهر شاشه سودا لحد مايحمل ولو مدتها قصيره بس مينفعش
         switch (state.nowPlayingState) {
           case RequestState.loading:
             return SizedBox(
               //هعملها بنفس ارتفاع الاسلايدر
                 height: 400,
                 child: Center(child: CircularProgressIndicator()));
           case RequestState.loaded:
             return FadeIn( // 🎬 (animate_do) بيخلي العناصر تظهر بتأثير Fade In
               duration: const Duration(milliseconds: 500),
               // ⏱️ مدة الأنيميشن
               //مكتبة بتخليك تعمل سلايدر صور/عناصر يتنقل المستخدم بينهم بالسحب أو التمرير.carousel_slider
               child: CarouselSlider( // 🎡 (carousel_slider) سلايدر لعرض صور الأفلام
                 options: CarouselOptions(
                   height: 400.0, // 📏 ارتفاع السلايدر
                   viewportFraction: 1.0, // 🔲 كل عنصر يغطي الشاشة بالكامل
                   onPageChanged: (index, reason) {}, // 🔄 حدث عند تغيير العنصر
                 ),
                 items: state.nowPlayingMovies.map(
                       (item) {
                     return GestureDetector(
                       key: const Key('openMovieMinimalDetail'), // 🗝️ مفتاح مميز
                       onTap: () {

                         Navigator.push( context, MaterialPageRoute(
                                   builder: (BuildContext context) => MovieDetailScreen(id: item.id)
                         ),);

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
                             blendMode: BlendMode.dstIn,
                             // 🌀 وضع الدمج
                             //مكتبة لعرض الصور من الإنترنت مع التخزين المؤقت (cache).
                             // يعني أول مرة يحمل الصورة من النت → بعدها يحفظها محليًا → يجيبها من الجهاز بدل النت.
                             child: CachedNetworkImage( // 🖼️ (cached_network_image) عرض صورة البوستر
                               height: 560.0,
                               //بنحط فيها الايمج اللي جيالنا من الباك اند
                               imageUrl: ApiConstance.imageUrl(item.backdropPath),
                               // 🌐 رابط الصورة من API
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
                                         'Now Playing'.toUpperCase(),
                                         // 🎬 النص أسفل الصورة
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
           case RequestState.error:
             return SizedBox(
                 height: 400,
                 child: Center(child: Text(state.nowPlayingMessage)));
         }
      },
    );
  }
}
