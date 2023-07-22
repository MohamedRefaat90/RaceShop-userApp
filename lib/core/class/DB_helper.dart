import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/functions/checkInternetConncetion.dart';
import 'package:http/http.dart' as http;

class DB_helper {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.post(Uri.parse(url), body: data);

        Map responseBody = jsonDecode(response.body);

        return Right(responseBody);
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.failure);
    }
  }

  Future<Either<StatusRequest, Map>> patchData(String url, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.patch(Uri.parse(url), body: data);

        Map responseBody = jsonDecode(response.body);

        return Right(responseBody);
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.failure);
    }
  }

  Future<Either<StatusRequest, Map>> getAllData(String url) async {
    if (await checkInternetConnection()) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.failure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }
}
