import 'dart:convert';

import 'package:get/get.dart';

import 'package:http_client/controller/base_controller.dart';
import 'package:http_client/helper/dialog_helper.dart';
import 'package:http_client/services/app_exceptions.dart';
import 'package:http_client/services/base_client.dart';

class TestController extends GetxController with BaseController {
  var lst = [].obs;

  // void getData() async {
  //   showLoading('Fetching data');
  //   var response = await BaseClient()
  //       .get('https://jsonplaceholder.typicode.com', '/todos/1');

  //   print(response);

  //   if (response == null) return;
  //   hideLoading();

  //   //lst.value = testFromJson(response);
  // }

  void getData() async {
    showLoading('Fetching data');
    var response = await BaseClient()
        .get('https://jsonplaceholder.typicode.com', '/todos')
        .catchError(handleError);

    if (response == null) return;
    hideLoading();
    var apiError = json.decode(response);
    lst.value = (apiError);
  }

  void postData() async {
    var Body = {'message': ' Testing'};
    showLoading('Posting data...');
    var response = await BaseClient()
        .post('https://jsonplaceholder.typicode.com', '/posts', Body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
    hideLoading();
  }
}
