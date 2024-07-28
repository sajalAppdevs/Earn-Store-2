import 'dart:convert';

import 'package:earn_store/Statics/network_links.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class PostNetworks {
  String baseUrl = NetworkLinks.networkUrl;
  Future<Either<String, T>> postData<T>({
    required String url,
    required Map body,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + url),
        body: (body),
      );
      if (response.statusCode == 200) {
        return Right(
          fromJson(
            jsonDecode(response.body),
          ),
        );
      }
      throw "Something was unexpected while post data to $url";
    } catch (error) {
      return left(error.toString());
    }
  }

  Future<Either<String, int>> postDataWithoutResponse({
    required String url,
    required Map body,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + url),
        body: (body),
      );
      if (response.statusCode == 200) {
        return const Right(200);
      }
      throw "Something was unexpected while post data to $url";
    } catch (error) {
      return left(error.toString());
    }
  }
}
