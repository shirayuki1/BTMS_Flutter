import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../Pages/Home/controller/homeController.dart';

class HomeSearchBar extends GetView<HomeController> {
  const HomeSearchBar({super.key});

  // final String buildingName;
  // HomeSearchBar({
  //   required this.buildingName,
  // });

  @override
  Widget build(BuildContext context) {
    // final screen = MediaQuery.of(context).size;
    return FloatingSearchBar(
      hint: 'Tìm kiếm..',
      hintStyle: const TextStyle(
        fontSize: 15,
      ),
      scrollPadding: const EdgeInsets.only(top: 5, bottom: 60),
      transitionDuration: const Duration(milliseconds: 500),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      width: 360,
      debounceDelay: const Duration(milliseconds: 500),
      // onQueryChanged: (query) => controller.searchCoupons(query),
      transition: CircularFloatingSearchBarTransition(),
      backdropColor: Colors.black.withOpacity(0.1),
      automaticallyImplyBackButton: false,
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: GestureDetector(
            // onTap: () => controller.gotoDetails(),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 1.3,
                  color: Colors.grey.shade300,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 10),
                  child: const Icon(Icons.apartment_rounded, color: Colors.black45),
                ),
                // Text(
                //   Formatter.shorten(buildingName, 10),
                //   style: TextStyle(
                //     color: Colors.black54,
                //     fontSize: 15,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
              ],
            ),
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return Material(
          color: Colors.white,
          elevation: 4.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
              // child: Obx(() {
              //   final listCoupons = controller.listSearchCoupons;
              //   if (controller.isSearching.value)
              //     return Container(
              //         padding:
              //             const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              //         child: Center(child: CircularProgressIndicator()));
              //   if (listCoupons.isEmpty)
              //     return Container(
              //         padding:
              //             const EdgeInsets.only(left: 20, top: 10, bottom: 20),
              //         child: Text("No coupons found!"));
              //   int count = listCoupons.length > 5 ? 5 : listCoupons.length;
              //   return ListView.separated(
              //     shrinkWrap: true,
              //     itemCount: count,
              //     separatorBuilder: (context, index) => Divider(
              //       indent: 15,
              //       endIndent: 15,
              //       height: 0,
              //       color: Colors.black38,
              //     ),
              //     itemBuilder: (context, index) {
              //       final coupon = listCoupons[index];
              //       final img = coupon.imageUrl ?? "";
              //       // final title = Formatter.shorten(coupon.store?.name) +
              //       //     " - " +
              //       //     Formatter.shorten(coupon.name);
              //       // final description = Formatter.shorten(coupon.description);
              //       return Container(
              //         height: 85,
              //         child: TextButton(
              //           onPressed: () {},
              //           child: ListTile(
              //             contentPadding: const EdgeInsets.all(0),
              //             leading: CircleAvatar(
              //               radius: 25,
              //               backgroundImage: NetworkImage(img),
              //             ),
              //             title: Text(title),
              //             subtitle: Text(description),
              //             // trailing: OutlinedButton.icon(
              //             //   onPressed: () => controller.goToCouponDetails(coupon),
              //             //   icon: Icon(
              //             //     Icons.local_activity,
              //             //     size: 24,
              //             //   ),
              //             //   label: Text("Chi Tiết"),
              //             // ),
              //           ),
              //         ),
              //       );
              //     },
              //   );
              // }),
              ),
        );
      },
    );
  }
}
