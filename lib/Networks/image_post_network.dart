// ignore_for_file: file_names, use_build_context_synchronously, deprecated_member_use, depend_on_referenced_packages, unused_local_variable
import 'dart:io';
import 'package:earn_store/Statics/network_links.dart';
import 'package:http/http.dart' as http;

import 'package:async/async.dart';
import 'package:path/path.dart';

class ImagePostNetwork {
  Future<bool> addImagePosts({
    required String url,
    required String imageKey,
    required File image,
    Map<String, dynamic>? parameters,
  }) async {
    var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    // stream.cast();
    var length = await image.length();
    var uri = Uri.parse(
      "${NetworkLinks.networkUrl}$url",
    );
    var request = http.MultipartRequest('POST', uri);
    if (parameters != null) {
      for (var entry in parameters.entries) {
        request.fields[entry.key.toString()] = entry.value.toString();
      }
    }
    var multiport = http.MultipartFile(
      imageKey,
      stream,
      length,
      filename: basename(image.path),
    );
    request.files.add(multiport);
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
