import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../ViewModel/Bloc/FavoriteCubit/favorite_cubit.dart';
import '../Components/CustomText.dart';
import '../themes/AppColors.dart';
import '../../features/favorites/FavoritesPage.dart';

class FavoriteBtnNav extends StatelessWidget {
  const FavoriteBtnNav({super.key});

  @override
  Widget build(BuildContext context) {
    var favCubit = FavoriteCubit.get(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FavoritePage(),
            ));
      },
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height / 14,
                decoration: BoxDecoration(
                    color: AppColor.purple3,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(6))),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                      child: CustomText(
                    text: "Click Here To View Favorite Quotes",
                    fontSize: 22,
                  )),
                ),
              ),
            ],
          ),
          BlocConsumer<FavoriteCubit, FavoriteState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Align(
                alignment: Alignment.topRight,
                widthFactor: 13,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColor.black,
                      radius: 12.h,
                      child: Text(
                        "${favCubit.test.length}",
                        style: TextStyle(color: AppColor.white),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
