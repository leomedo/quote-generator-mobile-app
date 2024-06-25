part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}


class AddQuoteToFavoritesState extends FavoriteState {}



class RemoveQuoteFromFavoritesState extends FavoriteState {}
class RemoveQuoteFromFavoriteErrorsState extends FavoriteState {}



class LocalFavoritesQuotesChangedState extends FavoriteState {}


class GetAllFavoritesLoading extends FavoriteState {}
class GetAllFavoritesSuccess extends FavoriteState {}
class GetAllFavoritesError extends FavoriteState {}




class ChangeIndexState extends FavoriteState {}






