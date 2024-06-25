import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ViewModel/Bloc/FavoriteCubit/favorite_cubit.dart';
import '../../ViewModel/Bloc/QuoteCubit/quote_cubit.dart';
import '../../core/shared_widgets/FavoriteButtonNav.dart';
import '../../core/shared_widgets/QouteCard.dart';
import '../../core/themes/AppColors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var quote = QuoteCubit.get(context);
    var favQuote = FavoriteCubit.get(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: quote..getRandomQuote(),
        ),
        BlocProvider.value(
          value: favQuote..getAllFavLocal(),
        ),
      ],
      child: Scaffold(

        body: BlocConsumer<QuoteCubit, QuoteState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColor.purple,
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FavoriteBtnNav(),
                  QuoteCard(quote: quote.randQuote),
                ],
              ),
            );
          },
        ),

      ),
    );
  }
}
