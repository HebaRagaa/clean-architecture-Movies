

 class ApiConstance {
   static const String baseUrl = "https://api.themoviedb.org/3";
   static const String apiKey = "c3435cfe40aeb079689227d82bf921d3";

   static const String nowPlayingMoviesPath =
                  '$baseUrl/movie/now_playing?api_key=$apiKey' ;

   static const String popularMoviesPath =
       '$baseUrl/movie/popular?api_key=$apiKey' ;

   static const String topRatedMoviesPath =
       '$baseUrl/movie/top_rated?api_key=$apiKey' ;

//لو بصيت ف الريسبونس هتلاقي البوستر باث او الباك دروب باث اليو ار ال بتاع الصوره مش كامل
//فهنكتب ف الموقع ايمج هلاقي له زي بيز يو ار ال اساسي والكماله ع حسب الصوره
 static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500' ;

//عايز لما تجيلي الصوره من الايه بي اي اعمل كونتاكت بين الباث والبيز ايميج يو ار ال
//هعمل ميثود تريترن استرنج وهبعتلها الباث اللي هو الكماله وهى هتبقى عباره عن البيز يو ار ال والباث
   static String  imageUrl(String path) => '$baseImageUrl$path' ;

}

