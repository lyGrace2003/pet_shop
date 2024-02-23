import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_shop/model/catergory_model.dart';
import 'package:pet_shop/providers/cat_providers.dart';
import 'package:pet_shop/screens/info.dart';
import 'package:pet_shop/util/app_style.dart';
import 'package:pet_shop/util/size_config.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
    "assets/bengal.jpg",
    "assets/american_wirehair.jpg",
    "assets/tonkinese.jpg"
  ];
  var cats = context.watch<CatProvider>().cat;

    final List<Cate> cate = [
      Cate(
        species: 'Cats', 
        icon: const Icon(CupertinoIcons.paw, color: mWhite, size: 35,), 
        ),
        Cate(
        species: 'Dogs', 
        icon: const Icon(CupertinoIcons.paw, color: mWhite, size: 35,), 
        ),Cate(
        species: "Birds", 
        icon: const Icon(CupertinoIcons.paw, color: mWhite, size: 35,),
        ),Cate(
        species: 'Rabbits', 
        icon: const Icon(CupertinoIcons.paw, color: mWhite, size: 35,),
        ),Cate(
        species: "Ferrets", 
        icon: const Icon(CupertinoIcons.paw, color: mWhite, size: 35,), 
        ),
    ];

    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mBorderRadius),
                    color: mYellow,
                  ),
                  child: const Icon(Icons.person, color: mWhite,size: 20,),
                ),
                SizedBox(width: SizeConfig.blocksHorizontal!*4,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome!", style: mBold.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*5),),
                    Text("Allyssa Echevarria", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*3.5),)
                  ],
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blocksVertical!*4,),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Adjust the value as needed
                child: CarouselSlider.builder(
                  itemCount: imagePaths.length,
                  options: CarouselOptions(
                    height: SizeConfig.screenHeight! / 4,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final imagePath = imagePaths[index];
                    return buildImage(imagePath);
                  },
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blocksVertical!*4,),
            Text("Categories", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),),
            SizedBox(height: SizeConfig.blocksVertical!*2,),
            Container(
              height: 100,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: cate.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: mYellow,
                        borderRadius: BorderRadius.circular(mBorderRadius) 
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          cate[index].icon,
                          Text(cate[index].species, style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blocksVertical!*3,),
            Text("Recommended", style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*4),),
            SizedBox(height: SizeConfig.blocksVertical!*2,),
            Container(
              height: 150,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CatInfo(info: cats[index]),
                        ));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                          image: AssetImage(cats[index].image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(mBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cats[index].breed, style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksHorizontal!*4),),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildImage(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: SizeConfig.screenWidth,
    );
}