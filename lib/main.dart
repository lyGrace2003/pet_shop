import 'package:flutter/material.dart';
import 'package:pet_shop/providers/cat_providers.dart';
import 'package:pet_shop/screens/screen.dart';
import 'package:pet_shop/util/app_style.dart';
import 'package:pet_shop/util/size_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CatProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const MaterialApp(
      title: 'Pet Store',
      home: LandingScreen()
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Stack(
          children: [
            // this is actually a carousel
             SizedBox(
              child: Image(
                height: SizeConfig.screenHeight!/1.6,
                width: SizeConfig.screenWidth,
                image: const AssetImage('assets/cat_cover.png'),
                fit: BoxFit.cover
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