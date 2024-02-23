import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/util/app_style.dart';
import 'package:pet_shop/util/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: SizeConfig.blocksVertical!*5,),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mBorderRadius),
                  color: mYellow,
                ),
                child: const Icon(Icons.person, color: mWhite,size: 40,),
              ),
              SizedBox(width: SizeConfig.blocksHorizontal!*2,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Allyssa", style: mBold.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*6),),
                  Text("Echevarria", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*6),)
                ],
              ),
            ],
          ),
          ],
        )
    );
  }
}