import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Data/Local/LocalData.dart';
import '../../../features/home/models/QuoteModel.dart';
import '../../../features/favorites/models/favModel.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  TextEditingController searchFavoriteQuote = TextEditingController();

  List<FavModel> test = [];

  static int randId = 0;

  int currentIndex = 0;

  Future<void> getAllFavLocal() async {
    emit(GetAllFavoritesLoading());
    test.clear();
    LocalData.getAllFavQuotes().then((value) {
      for (int i = 0; i < value.length; i++) {
        Map<String, dynamic> currentMap = value[i];
        int id = currentMap['id'];
        String name = currentMap['author'];
        String description = currentMap['quoteDescription'];
        test.add(FavModel(name: name, description: description, id: id));
      }
      emit(GetAllFavoritesSuccess());
    }).catchError((error) {
      emit(GetAllFavoritesError());
    });
  }

  void addToFavorites({required QuoteModel quote}) {
    // favoriteList.add(quote);
    test.add(
        FavModel(id: randId++, description: quote.content, name: quote.author));
    LocalData.addFavQuote(quote.author!, quote.content!);
    emit(AddQuoteToFavoritesState());
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }

  Future<void> deleteFavQuote(int id) async {
    final db = await LocalData.initDb();

    try {
      await db.delete('favoritesQuotes', where: "id=?", whereArgs: [id]);
      test.removeWhere((element) => element.id == id);
      emit(RemoveQuoteFromFavoritesState());
    } catch (error) {
      debugPrint("error Deleting");
      emit(RemoveQuoteFromFavoriteErrorsState());
    }
  }
}
