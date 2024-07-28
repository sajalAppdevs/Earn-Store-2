import 'dart:convert';


import 'package:earn_store/Statics/network_links.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class GetNetworks {
  String baseUrl = NetworkLinks.networkUrl;
  Future<Either<String, T>> getData<T>({
    required String url,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + url));
      if (response.statusCode == 200) {
        return Right(
          fromJson(
            jsonDecode(response.body),
          ),
        );
      }
      throw "Something was unexpected while fetching data from $url";
    } catch (error) {
      return left(error.toString());
    }
  }
}