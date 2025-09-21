

  import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  //هقوله هنا انها ممكن تبقى نل ونحذف الركويرد من الكونستراكتور وعند الاوفر رايد برضو اقوله ممكن ترجع بنل
  final String? backdropPath ;
  final int id;

  const Recommendation({this.backdropPath, required this.id});

  @override
 List<Object?> get props => [backdropPath,id];

  }



