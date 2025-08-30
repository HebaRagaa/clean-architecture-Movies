

 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_bloc.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_event.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_state.dart';

import '../../../core_ module/services/services_locator.dart';

class MoviesScreen extends StatelessWidget {
   const MoviesScreen({super.key});

   //السنجلتون هدفي ان الموفيز ريبوزتري او ايا كان يتعمل منه اوبجيكت واحد بس يكفيني البروجيكت كله مش كل شويه بيلد
   //والسنجلتون بيريترن نفس الاوبجيكت كل مره بنادي فيها ع الكلاس
  //الجيت ات عباره عن سيرفز لوكيتور يعني بتهندل الابجيكت اللي بتتعمل ف الابلكيشن وبتستعملها بدل انهيرتيد ويدجت
  //يبقى الجيت ات بتأكسز الاوبجيكت من اليو اي او اي مكان ف الابلكيشن
  //انت محتاج تعمل سيت اب للاوبجيكت اللي هتخزنها ف الميموري فهنروح ع الكور نعمل سيرفزز وجواها سيرفزز لوكيتور
   @override
   Widget build(BuildContext context) {
     //دلوقتي عايز اقول للبلوك اللي عندي انت اول ماتتكريت ناديلي ع الجيت ناو بلاينج موفيز
//وعشان استعمل البلوك ف الموفيز اسكرين ف محتاج ويدجت تكريت نيو استنسز من من البلوك ده
     return BlocProvider(
       //والبلوك بروفايدر بتسمحلي انها تكريتلي انستانس من الموفي بلوك
         create: (BuildContext context) {
          //وطبعا عايز اول ما افتح انادي ع ايفنت الجيت ناو بلاينج
           //كده الموفيز بلوك هبعتله الاس ال عشان كاني بعتله الجيت ناو كيس وكل اللي ف السيرفر لوكيتور
           return MoviesBloc(sl())..add(GetNowPlayingMoviesEvent());
         },
         //لما جينا نعمل رن للبلوك والاسكاف فولد فاضي مش هيدخل ع الداتا سورس ولا هيعرض حاجه وده بسبب البلوك
        //في حاجه ف البلوك اسمها ليزي بتبقى بترو وبتخلي البلوك ماتتنفذ غير لما نستعمل الداتا اللي ف البلوك دي اللي هى الريترن
        // lazy: false,
         //طب ازاي هستعمل الاستيت والبلوك والايفنت وكل ده من خلال البلوك بيلدر
         //البلوك بيلدر بتاخد منك البلوك نفسه والاستيت
         child: BlocBuilder<MoviesBloc, MoviesState>(
           builder: (context, state) {
             print(state);
             return const Scaffold();
           })
     );
   }
}


