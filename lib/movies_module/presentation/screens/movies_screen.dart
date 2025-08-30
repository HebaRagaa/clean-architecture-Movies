

 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_bloc.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_event.dart';
import 'package:movies_tv/movies_module/presentation/controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
   const MoviesScreen({super.key});

   @override
   Widget build(BuildContext context) {
     //دلوقتي عايز اقول للبلوك اللي عندي انت اول ماتتكريت ناديلي ع الجيت ناو بلاينج موفيز
//وعشان استعمل البلوك ف الموفيز اسكرين ف محتاج ويدجت تكريت نيو استنسز من من البلوك ده
     return BlocProvider(
       //والبلوك بروفايدر بتسمحلي انها تكريتلي انستانس من الموفي بلوك
         create: (BuildContext context) {
          //وطبعا عايز اول ما افتح انادي ع ايفنت الجيت ناو بلاينج
           return MoviesBloc()..add(GetNowPlayingMoviesEvent());
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


