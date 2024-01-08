// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gelivery_myanmar_code_test/data/models/pick_up_DTO.dart';
import 'package:gelivery_myanmar_code_test/presentation/controllers/auth/auth_controller.dart';
import 'package:gelivery_myanmar_code_test/presentation/controllers/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  List<Items>? get detailList => controller.pickUpList.value.data?.items;

  TextStyle textStyle = const TextStyle(color: Colors.black, fontSize: 16);

  AuthController authController = Get.find<AuthController>();

  Widget refreshHeader() {
    return const ClassicHeader(
      textStyle: TextStyle(color: Colors.green),
      completeIcon: Icon(Icons.done, color: Colors.green),
      idleIcon: Icon(Icons.arrow_downward, color: Colors.green),
      releaseIcon: Icon(Icons.refresh, color: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pickup Completed"),
          actions: [
            IconButton(
                onPressed: () => authController.revokeAccessToken(),
                icon: const Icon(Icons.logout, color: Colors.red))
          ],
        ),
        body: Obx(() {
          return SmartRefresher(
              controller: controller.refreshController,
              enablePullUp: true,
              header: refreshHeader(),
              onRefresh: () => controller.onRefresh(),
              onLoading: () => controller.onLoading(),
              child: ListView.builder(
                  itemCount: detailList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detailList?[index].trackingId.toString() ??
                                      '',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: Get.width * 0.30,
                                  child: Text(
                                    detailList?[index].osName.toString() ?? '',
                                    style: textStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  detailList?[index]
                                          .osTownshipName
                                          .toString() ??
                                      '',
                                  style: textStyle,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  detailList?[index]
                                          .osPrimaryPhone
                                          .toString() ??
                                      '',
                                  style: textStyle,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  detailList?[index].pickupDate.toString() ??
                                      '',
                                  style: textStyle,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "${detailList?[index].totalWays} ways",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }));
        }));
  }
}
