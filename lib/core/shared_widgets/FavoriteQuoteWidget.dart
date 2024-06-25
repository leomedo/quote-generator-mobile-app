import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/favorites/models/favModel.dart';
import '../../ViewModel/Bloc/FavoriteCubit/favorite_cubit.dart';
import '../Components/CustomBtn.dart';
import '../Components/CustomText.dart';
import '../themes/AppColors.dart';

class FavoriteQuote extends StatelessWidget {
  final int index;
  final FavModel quote;
   const FavoriteQuote({super.key, required this.quote , required this.index});
  @override
  Widget build(BuildContext context) {
    var favCubit = FavoriteCubit.get(context);
    return Container(
      width: MediaQuery.of(context).size.width -30,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CustomText(text: '"'"${quote.description}"'"',fontSize: 26),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomText(text:  quote.name ??"Ziad AHemd" , fontSize: 22,color:AppColor.purple2 ,),
            ],),
          const SizedBox(height: 15,),
          Row(children: [
            BlocConsumer<FavoriteCubit, FavoriteState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Expanded(
                flex:2,
                child: CustomButton(text: "Remove From Favorite",fontSize:22,icon:FluentIcons.heart_24_regular,textColor: AppColor.purple2,borderRadius:const BorderRadius.vertical(bottom: Radius.circular(6)),color: AppColor.white,borderWidth: 2,borderColor: AppColor.purple2, onTap: (){
                  favCubit.changeIndex(index);
                  favCubit.deleteFavQuote(FavoriteCubit.get(context).test[favCubit.currentIndex].id!);
                }));
  },
),
            const SizedBox(width: 10,),
          ],)
        ],
      ),
    );
  }
}
