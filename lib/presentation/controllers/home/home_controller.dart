import 'package:flutter/foundation.dart';
import 'package:gelivery_myanmar_code_test/data/models/pick_up_DTO.dart';
import 'package:gelivery_myanmar_code_test/domain/usecases/home/home_usecase.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  HomeController(this._homeUseCase);
  final HomeUseCase? _homeUseCase;

  Rx<PickUpListDTO> pickUpList = PickUpListDTO().obs;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  int currentPage = 1;

  Future<bool> fetchPickUpList() async {
    PickUpListDTO result = await _homeUseCase?.fetchPickUpList();
    if (result.success ?? false) {
      debugPrint("I am right ${result.data?.items?.length}");
      pickUpList.value = result;
      return true;
    } else {
      debugPrint("I am wrong");
      return false;
    }
  }

  void onRefresh() async {
    currentPage = 1;
    bool refreshing = await fetchPickUpList();
    if (refreshing) {
      refreshController.refreshCompleted();
    } else {
      refreshController.refreshFailed();
    }
  }

  void onLoading() async {
    currentPage++;
    PickUpListDTO result = await _homeUseCase?.fetchPickUpList();
    if (result.success ?? false) {
      result.data?.items?.forEach((element) {
        pickUpList.value.data?.items?.add(element);
      });
      pickUpList.refresh();
      refreshController.loadComplete();
    } else {
      refreshController.loadFailed();
    }
  }
}
