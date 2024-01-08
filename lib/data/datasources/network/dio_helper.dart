import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gelivery_myanmar_code_test/core/core_config/config_constant.dart';
import 'package:gelivery_myanmar_code_test/core/core_config/config_result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/core_config/config_helper.dart';

class DioHelper {
  Dio? _dio;

  static final DioHelper _instance = DioHelper();
  static DioHelper get instance => _instance;
  SharedPreferences? prefs;

  init() async {
    _dio = Dio(BaseOptions(contentType: Headers.jsonContentType));

    prefs = await SharedPreferences.getInstance();
  }

  void saveData({@required String? key, @required String? value}) async {
    await prefs?.setString(
        key ?? ConfigConstant.no_data, value ?? ConfigConstant.no_data);
  }

  String getData({@required String? key}) {
    String? result = prefs?.getString(key ?? ConfigConstant.no_data);
    return result ?? ConfigConstant.no_data;
  }

  login() async {
    try {
      final result = await _dio?.post(
        ConfigHelper.login,
        data: ConfigHelper.b_login,
      );
      return Result.success(data: result?.data);
    } on DioException catch (e) {
      return Result.error(e.response?.data['message'],
          errorCode: e.response?.data['error']);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  fetchPickUpList() async {
    try {
      final result = await _dio?.post(ConfigHelper.pickUp,
          data: ConfigHelper.b_pickUp,
          options: Options(headers: ConfigHelper.h_token));
      return Result.success(data: result?.data);
    } on DioException catch (e) {
      return Result.error(e.response?.data['message'],
          errorCode: e.response?.data['error']);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  fetchRevokeAccessToken() async {
    try {
      final result = await _dio?.post(ConfigHelper.revokeToken,
          data: ConfigHelper.b_noData,
          options: Options(headers: ConfigHelper.h_token));
      return Result.success(data: result?.data);
    } on DioException catch (e) {
      return Result.error(e.response?.data['message'],
          errorCode: e.response?.data['error']);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
