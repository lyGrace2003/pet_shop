import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_shop/providers/cat_providers.dart';
import 'package:pet_shop/util/app_style.dart';
import 'package:pet_shop/util/size_config.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final _cartList = context.watch<CatProvider>().cartList;
    var sum = 0;
    
    _cartList.forEach((item) {
      sum += item.price;
    });

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: SizeConfig.blocksVertical! * 3),
          Text("Cart",style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal! * 5)),
          SizedBox(height: SizeConfig.blocksVertical! * 2),
          Text(
            "${_cartList.length} items",
            style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal! * 5),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cartList.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.blocksVertical! * 10,
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
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.blocksVertical! * 10,
                        width: SizeConfig.screenWidth! / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(mBorderRadius),
                          image: DecorationImage(
                            image: AssetImage(_cartList[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.blocksHorizontal! * 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _cartList[index].breed,
                            style: mBold.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal! * 3.5),
                          ),
                          Text(
                            '\$${_cartList[index].price}',
                            style: mRegular.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal! * 3.5),
                          ),
                        ],
                      ),
                      SizedBox(width: SizeConfig.blocksHorizontal! * 7),
                      IconButton(
                        icon: const Icon(
                          CupertinoIcons.trash_fill,
                          color: mYellow,
                          size: 20,
                        ),
                        onPressed: () {
                          context.read<CatProvider>().removeFromList(_cartList[index]);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: SizeConfig.blocksVertical!*10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    "Total: \$${sum}",
                    style: mMedium.copyWith(color: mBlack, fontSize: SizeConfig.blocksHorizontal! * 3.5),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: buttonsmall,
            child: Text(
              "Check out",
              style: mBold.copyWith(color: mWhite, fontSize: SizeConfig.blocksVertical! * 2),
            ),
          ),
          SizedBox(height: SizeConfig.blocksVertical! * 5),
        ],
      ),
    );
  }
}