part of 'quote_cubit.dart';

@immutable
abstract class QuoteState {}

class QuoteInitial extends QuoteState {}


class LoadingRandomQuote extends QuoteState {}
class SuccessRandomQuote extends QuoteState {}
class ErrorRandomQuote extends QuoteState {}
