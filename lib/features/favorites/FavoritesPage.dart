import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/Components/CustonTextFeild.dart';
import 'models/favModel.dart';
import '../../ViewModel/Bloc/FavoriteCubit/favorite_cubit.dart';
import '../../core/shared_widgets/FavoriteQuoteWidget.dart';
import '../../core/shared_widgets/navigateBackBtn.dart';
import '../../core/themes/AppColors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  TextEditingController searchedItem = TextEditingController();
  List<FavModel> favQuotes = [];

  @override
  void initState() {
    super.initState();
    favQuotes = FavoriteCubit.get(context).test;
  }

  void searchQuote(String enteredKeyword) {
    List<FavModel> results = [];

    if (enteredKeyword.isEmpty) {
      results = FavoriteCubit.get(context).test;
      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      print(results);
    } else {
      results = FavoriteCubit.get(context)
          .test
          .where((item) => item.description!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      print('###############################################');
      print(results);
    }

    setState(() {
      favQuotes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: FavoriteCubit.get(context)..getAllFavLocal(),
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColor.purple,
        ),
        child: BlocConsumer<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                const NavigateBackBtn(),
                SizedBox(
                  height: 10.h,
                ),
                //search Fav
                CustomTextField(
                  hintText: "type something here to search..",
                  suffixIcon: searchedItem.text == ''? null: IconButton(
                    onPressed: () {
                      setState(() {
                        favQuotes = FavoriteCubit.get(context).test;
                        searchedItem.clear();
                      });
                    },
                    icon: const Icon(Icons.clear_outlined),
                  ),
                  widthBtn: MediaQuery.of(context).size.width - 20,
                  heightBtn: MediaQuery.of(context).size.height / 45,
                  controller: searchedItem,
                  onChanged: (value) => searchQuote(searchedItem.text),
                ), // fav Quotes
                Expanded(
                    child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10.h),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemCount: favQuotes.length,
                  itemBuilder: (context, index) => FavoriteQuote(
                      quote: favQuotes[index],
                      index: index),
                )),
              ],
            );
          },
        ),
      )),
    );
  }
}
