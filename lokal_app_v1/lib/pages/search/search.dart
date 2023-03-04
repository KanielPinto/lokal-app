import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lokal_app_v1/routes/route_helper.dart';
import 'package:lokal_app_v1/utils/colors.dart';
import 'package:lokal_app_v1/widgets/header_text.dart';
import 'package:search_page/search_page.dart';

import '../../utils/dimensions.dart';

class Store implements Comparable<Store> {
  final String storeName, storeCategory;

  const Store(this.storeName, this.storeCategory);

  @override
  int compareTo(Store other) => storeName.compareTo(other.storeName);
}

class Search extends StatelessWidget {
  static const stores = [
    Store('Knit Wit', 'Crafts'),
    Store('Sew What', 'Crafts'),
    Store('Potted Paradise', 'Gardening'),
    Store('Sweet Treats', 'Food'),
    Store('The Spice Rack', 'Food'),
    Store('Book Nook', 'Books'),
    Store('The Vinyl Den', 'Music'),
    Store('Bath Bliss', 'Beauty'),
    Store('Vintage Finds', 'Antiques'),
    Store('The Toy Chest', 'Toys'),
    Store('Eco Essentials', 'Sustainability'),
    Store('Pet Paradise', 'Pet Supplies'),
    Store('Curious Curios', 'Oddities'),
    Store('Fashion Frenzy', 'Clothing'),
    Store('The Coffee House', 'Beverages'),
    Store('Funky Junk', 'Upcycling'),
    Store('Mindful Moment', 'Wellness'),
    Store('The Stationery Shop', 'Office Supplies'),
    Store('The Artisan Collective', 'Handmade'),
    Store('Cozy Corner', 'Home Decor'),
  ];

  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    HeaderText(
                      text: "Store Directory",
                      color: AppColors.yellowColor,
                      size: Dimensions.font26,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getPopularStore());
              },
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    final store = stores[index];

                    return ListTile(
                      title: Text(store.storeName),
                      subtitle: Text(store.storeCategory),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.pinkColor,
        tooltip: 'Search Stores',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Store>(
            items: stores,
            searchLabel: 'Search Stores',
            suggestion: const Center(
              child: Text('Filter Stores by Name or Category'),
            ),
            failure: const Center(
              child: Text('No store found :('),
            ),
            filter: (store) => [
              store.storeName,
              store.storeCategory,
            ],
            builder: (store) => GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getPopularStore());
              },
              child: ListTile(
                title: Text(store.storeName),
                subtitle: Text(store.storeCategory),
              ),
            ),
          ),
        ),
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
