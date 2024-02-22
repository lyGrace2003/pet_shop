import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/screens/cart.dart';
import 'package:pet_shop/screens/catalog.dart';
import 'package:pet_shop/screens/home.dart';
import 'package:pet_shop/screens/profile.dart';
import 'package:pet_shop/util/app_style.dart';
import 'package:pet_shop/util/size_config.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {

  int _index = 0;
  final screens =[
    const HomeScreen(),
    const CatalogScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body:screens[_index],
        bottomNavigationBar: BottomNavigationBar(
          //doesnt work
          selectedLabelStyle: TextStyle(color: const Color.fromRGBO(232, 190, 19, 1), fontSize: SizeConfig.blocksHorizontal!*3 ), 
          unselectedLabelStyle: TextStyle(color:const Color.fromRGBO(124, 124, 124, 1), fontSize: SizeConfig.blocksHorizontal!*3),
          currentIndex:_index ,
          onTap: (value){
            setState(() {
              _index = value;
            });
          },
          backgroundColor: mWhite,
          
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(
            icon: _index  == 0
                  ? const Icon(CupertinoIcons.house_fill, color: mYellow,)
                  : const Icon(CupertinoIcons.house_fill, color: mGrey,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
            icon: _index  == 1
                  ? const Icon(CupertinoIcons.book_fill, color: mYellow,)
                  : const Icon(CupertinoIcons.book_fill, color: mGrey,),
              label: 'Catalog',
            ),
            BottomNavigationBarItem(
            icon: _index  == 2
                  ? const Icon(CupertinoIcons.cart_fill, color: mYellow,)
                  : const Icon(CupertinoIcons.cart_fill, color: mGrey,),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
            icon: _index  == 3
                 ? const Icon(CupertinoIcons.person_alt_circle_fill, color: mYellow,)
                 : const Icon(CupertinoIcons.person_alt_circle_fill, color: mGrey,),
              label: 'Profile',
            ),
          ],
        ),
      );
  }
}