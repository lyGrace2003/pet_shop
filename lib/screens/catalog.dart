
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    var cats = context.watch<CatProvider>().cat;
    var cart = context.watch<CatProvider>().cartList;
    var searchList = context.watch<CatProvider>().searchItems;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.blocksVertical! * 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Store",
                  style: mRegular.copyWith(
                    color: mBlack,
                    fontSize: SizeConfig.blocksHorizontal! * 6,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blocksVertical! * 3),
            Container(
              width: SizeConfig.screenWidth! / 1.1,
              height: SizeConfig.blocksVertical! * 6,
              decoration: BoxDecoration(
                color: mGrey2,
                borderRadius: BorderRadius.circular(mBorderRadius),
              ),
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    searchText = query;
                    Provider.of<CatProvider>(context, listen: false)
                        .searchFromList(query);
                  });
                },
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  filled: false,
                  fillColor: mAccent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(mBorderRadius),
                    borderSide: BorderSide.none,
                  ),
                  label: Text(
                    "Search...",
                    style: mRegular.copyWith(
                      color: mGrey,
                      fontSize: SizeConfig.blocksHorizontal! * 4,
                    ),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: mBlack,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchText.isEmpty
                    ? (cats.length / 2).ceil()
                    : (searchList.length / 2).ceil(),
                itemBuilder: (BuildContext context, int rowIndex) {
                  final startIndex = rowIndex * 2;
                  final endIndex = startIndex + 1;
                  return Row(
                    children: [
                      if (startIndex < (searchText.isEmpty ? cats.length : searchList.length))Expanded(child: catItem(context,searchText.isEmpty ? cats : searchList,startIndex,cart,),),
                      if (endIndex < (searchText.isEmpty ? cats.length : searchList.length)) const SizedBox(width: 10), // Adjust spacing as needed
                      if (endIndex < (searchText.isEmpty ? cats.length : searchList.length))Expanded(child: catItem(context,searchText.isEmpty ? cats : searchList,endIndex,cart,),),
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

  Container catItem(
    BuildContext context,
    List<Cat> cats,
    int startIndex,
    List<Cat> cart,
  ) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: SizeConfig.screenWidth! / 2,
      height: SizeConfig.blocksVertical! * 22,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CatInfo(info: cats[startIndex]),
              ));
            },
            child: Container(
              height: SizeConfig.blocksVertical! * 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mBorderRadius),
                image: DecorationImage(
                  image: AssetImage(cats[startIndex].image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blocksVertical! * 1),
          Text(
            "${cats[startIndex].breed} Cat",
            style: mBold.copyWith(
              color: mBlack,
              fontSize: SizeConfig.blocksHorizontal! * 3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${cats[startIndex].price}',
                style: mRegular.copyWith(
                  color: mYellow,
                  fontSize: SizeConfig.blocksHorizontal! * 3,
                ),
              ),
              IconButton(
                icon: Icon(
                  CupertinoIcons.cart_fill,
                  color: cart.contains(cats[startIndex]) ? mGrey : mYellow,
                  size: 15,
                ),
                onPressed: () {
                  if (!cart.contains(cats[startIndex])) {
                    context.read<CatProvider>().addToList(cats[startIndex]);
                  } else {
                    context.read<CatProvider>().removeFromList(cats[startIndex]);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}