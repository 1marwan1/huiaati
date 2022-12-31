import 'package:equatable/equatable.dart';

abstract class Faiture extends Equatable {}

//الاخطاء المتوقعة
//خطاء لايوجد نت
class OfflineFaiture extends Faiture {
  @override
  List<Object?> get props => [];
}

//خطاء بسيرفر
class ServerFaiture extends Faiture {
  @override
  List<Object?> get props => [];
}

//خطاء بحالة لا توجد  بيانات بالكاش
class EmtyCacheFaiture extends Faiture {
  @override
  List<Object?> get props => [];
}

//خطاء بادخال البيانات
class WrongDataFaiture extends Faiture {
  @override
  List<Object?> get props => [];
}
