import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/util/app_style.dart';
import 'package:pet_shop/util/size_config.dart';
import '../model/cat_info_model.dart';

class CatInfo extends StatefulWidget {
  Cat info;
  CatInfo({super.key,
  required this.info});

  @override
  State<CatInfo> createState() => _CatInfoState();
}

class _CatInfoState extends State<CatInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: SizeConfig.screenHeight!/2,
                decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.info.image),fit: BoxFit.cover),
              ),
              ),
            ),
            Positioned(
              top: SizeConfig.screenHeight!/2-40,
              left: 15,
              right: 15,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: SizeConfig.screenHeight!/1.5,
                decoration: BoxDecoration(
                  color: mWhite,
                  borderRadius: BorderRadius.circular(mBorderRadius)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.info.breed, style: mBold.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*7),softWrap: true,),
                            Row(
                              children: [
                                Text(widget.info.location, style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*4),),
                                SizedBox(width: SizeConfig.blocksHorizontal!*2,),
                                Container(height: 3, width: 3,decoration: BoxDecoration( color: mGrey, borderRadius: BorderRadius.circular(20)),),
                                SizedBox(width: SizeConfig.blocksHorizontal!*2,),
                                Text("8m", style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*4),),
                              ],
                            ),
                          ],
                        ),
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: mYellow,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.close_fullscreen_outlined, color: mWhite,),
                            onPressed: (){
                              Navigator.pop(context);
                            },),
                        ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blocksVertical!*4,),
                      Row(
                        children: [
                          Icon(CupertinoIcons.paw, color: mBlack, size: SizeConfig.blocksHorizontal!*8,),
                          SizedBox(width: SizeConfig.blocksHorizontal!*2,),
                          Text("About ${widget.info.breed}", style: mBold.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            height: 80,
                            width: 90,
                            decoration: const BoxDecoration(
                              color: mAccent
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Weight", style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*3.5),),
                                Text("${widget.info.weight} kg", style: mBold.copyWith(color: mYellow, fontSize: SizeConfig.blocksHorizontal!*3.5),),
                              ],
                            ),
                          ),
                           Container(
                            padding: const EdgeInsets.all(20),
                            height: 80,
                            width: 90,
                            decoration: const BoxDecoration(
                              color: mAccent
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Height", style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*3.5),),
                                Text("${widget.info.height} cm", style: mBold.copyWith(color: mYellow, fontSize: SizeConfig.blocksHorizontal!*3.5),),
                              ],
                            ),
                          ),
                           Container(
                            padding: const EdgeInsets.all(20),
                            height: 80,
                            width: 130,
                            decoration: const BoxDecoration(
                              color: mAccent
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Color", style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*3.5),),
                                Text(widget.info.color, style: mBold.copyWith(color: mYellow, fontSize: SizeConfig.blocksHorizontal!*3.5),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.blocksHorizontal!*3,),
                      Text(widget.info.desc, style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*3.5),softWrap: true,)
                  ],
                ),
              )
            ),
          ],
          ),
      ),
    );
  }
}