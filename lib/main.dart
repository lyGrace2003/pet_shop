import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/providers/cat_providers.dart';
import 'package:pet_shop/screens/screen.dart';
import 'package:pet_shop/util/app_style.dart';
import 'package:pet_shop/util/size_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CatProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      title: 'Pet Store',
      home: LandingScreen()
    );
  }
}

class LandingScreen extends StatefulWidget {
  LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
  final List<String> imagePaths = [
    "assets/cat_cover.png",
    "assets/norwegian_forest.jpg",
    "assets/tonkinese.jpg"
  ];
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Stack(
            children: [
               Positioned(
                top: 0,
                left: 0,
                right: 0,
                 child: SizedBox(
                  width: double.infinity,
                  height: SizeConfig.screenHeight!/1.6,
                  child: CarouselSlider.builder(
                    itemCount: widget.imagePaths.length,
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
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
                      final imagePath = widget.imagePaths[index];
                      return buildImage(imagePath);
                    },
                  ),
                ),
               ),
              Positioned(
                top: SizeConfig.screenHeight!/1.6 - 6 * SizeConfig.blocksVertical!,
                left: 0,
                right: 0,
                child: Container(
                  height: SizeConfig.screenHeight!/1.8,
                  decoration: const BoxDecoration(
                    color: mWhite,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(mBorderRadius), topLeft: Radius.circular(mBorderRadius))
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: SizeConfig.blocksVertical!*6,),
                      Text("Your One-Stop Pet Shop", style: mBold.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*7),),
                      Text("Experience!", style: mBold.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal!*7),),
                      SizedBox(height: SizeConfig.blocksVertical!*2,),
                      Text("Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care.", 
                      style: mRegular.copyWith(color: mGrey, fontSize: SizeConfig.blocksHorizontal!*4), softWrap: true,textAlign: TextAlign.center,),
                      SizedBox(height: SizeConfig.blocksVertical!*5,),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Screens()));
                        }, 
                        style: buttonyellow,
                        child: Text("Get Started", style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksVertical!*2),))
                    ],
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
      width: SizeConfig.screenWidth
    );
}