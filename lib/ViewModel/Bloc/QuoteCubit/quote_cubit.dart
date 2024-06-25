import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Data/Network/DioHelper.dart';
import '../../../core/Data/Network/EndPoints.dart';
import '../../../features/home/models/QuoteModel.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit() : super(QuoteInitial());

  static QuoteCubit get(context) => BlocProvider.of(context);

  QuoteModel randQuote = QuoteModel();

  Future<void> getRandomQuote() async {
    if (kDebugMode) {
      print("svsv");
    }
    DioHelper.get(endPoint: EndPoints.randomQuote).then((value) {
      if (kDebugMode) {
        print(value);
      }
      randQuote = QuoteModel.fromJson(value.data);
      if (kDebugMode) {
        print(randQuote.author);
      }
      emit(SuccessRandomQuote());
    }).catchError((error) {
      emit(ErrorRandomQuote());
    });
  }
}
