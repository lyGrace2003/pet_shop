import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_shop/model/cat_info_model.dart';
import 'package:pet_shop/providers/cat_providers.dart';
import 'package:pet_shop/screens/info.dart';
import 'package:pet_shop/util/app_style.dart';
import 'package:pet_shop/util/size_config.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    var cats = context.watch<CatProvider>().cat;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.blocksVertical!*5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Store", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*6),),
              ],
            ),
            SizedBox(height: SizeConfig.blocksVertical!*3,),
            Container(
              width: SizeConfig.screenWidth!/1.1,
              height: SizeConfig.blocksVertical!*6,
              decoration: BoxDecoration(
                color: mGrey2,
                borderRadius: BorderRadius.circular(mBorderRadius)
              ),
              child: Row(
                children: [
                  SizedBox(width: SizeConfig.blocksHorizontal!*4,),
                  const Icon(Icons.search, color: mBlack,),
                  SizedBox(width: SizeConfig.blocksHorizontal!*4,),
                  Text("Search Product or Brand", style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*4),)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: (cats.length / 2).ceil(), 
                itemBuilder: (BuildContext context, int rowIndex) {
                  final startIndex = rowIndex * 2;
                  final endIndex = startIndex + 1;
                  return Row(
                    children: [
                      if (startIndex < cats.length)
                        Expanded(
                          child: Container(
                            margin : const EdgeInsets.all(15),
                            width: SizeConfig.screenWidth! / 2,
                            height: SizeConfig.blocksVertical!*22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(mBorderRadius),
                              color: mWhite,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(4, 4), 
                                ),
                              ],),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CatInfo(info:cats[startIndex])));
                                  },
                                  child: Container(
                                    height: SizeConfig.blocksVertical! *12 ,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(mBorderRadius),
                                      image: DecorationImage(
                                        image: AssetImage(cats[startIndex].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.blocksVertical!*1,),
                                Text("${cats[startIndex].breed} Cat",style: mBold.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal! * 3,),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$${cats[startIndex].price}',style: mRegular.copyWith(color: mYellow,fontSize: SizeConfig.blocksHorizontal! * 3,),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Add to cart
                                      },
                                      icon: const Icon(Icons.shopping_cart),
                                      color: mYellow,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (endIndex < cats.length)
                        Expanded(
                          child: Container(
                            margin : const EdgeInsets.all(15),
                            width: SizeConfig.screenWidth! / 2, 
                            height: SizeConfig.blocksVertical!*22,
                            decoration: BoxDecoration(
                              color: mWhite,
                              borderRadius: BorderRadius.circular(mBorderRadius),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CatInfo(info:cats[endIndex])));
                                  },
                                  child: Container(
                                    height: SizeConfig.blocksVertical! * 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(mBorderRadius),
                                      image: DecorationImage(
                                        image: AssetImage(cats[endIndex].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: SizeConfig.blocksVertical!*1,),
                                Text("${cats[endIndex].breed} Cat",style: mBold.copyWith(color: mBlack,fontSize: SizeConfig.blocksHorizontal! * 3,),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$${cats[endIndex].price}',style: mRegular.copyWith(color: mYellow,fontSize: SizeConfig.blocksHorizontal! * 3,),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // Add to cart
                                      },
                                      icon: const Icon(Icons.shopping_cart),
                                      color: mYellow,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
          ),
      ),
    );
  }
}