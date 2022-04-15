import 'dart:async';
import 'dart:typed_data';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class MockAdapter extends HttpClientAdapter {
  static const String mockHost = 'mockserver';
  static const String mockBase = 'http://$mockHost/';
  final _adapter = DefaultHttpClientAdapter();
  // Contract map path of endpoint - response
  final Map<String, String> mockResponse;

  MockAdapter(this.mockResponse);

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future? cancelFuture) async {
    final uri = options.uri;

    if (uri.host == mockHost) {
      if (mockResponse[uri.path] != null) {
        return ResponseBody.fromString(
          mockResponse[uri.path]!,
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
      } else {
        return ResponseBody.fromString('{}', 404);
      }
    }
    return _adapter.fetch(options, requestStream, cancelFuture);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
