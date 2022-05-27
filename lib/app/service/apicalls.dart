import 'dart:async';
import 'dart:io';

import 'package:githubcommit/app/service/logging.dart';
import 'package:http/http.dart' as http;

var hitApiX = HitApi();
var timeOut = 15;

class HitApi {
  Map<String, String> headerObject = {};

  getResponse(String urlx) async {
    try {
      var url = Uri.parse(urlx);
      final timer0 = logTimerStart('Get', 'Starting... $urlx $headerObject',
          level: LogLevel.warning);
      var response = await http
          .get(
            url,
            headers: headerObject,
          )
          .timeout(Duration(seconds: timeOut));
      logTimerStop('Get', timer0, 'Done...${response.statusCode} $urlx',
          level: LogLevel.warning);
      return response;
    } on TimeoutException catch (_) {
      // A timeout occurred.
      throw 'Connection Timeout. Your network is very weak.';
    } on SocketException catch (_) {
      // Other exception
      return 'No Internet Connection. Check your internet connection';
    }
  }

  putResponse(String urlx, Object body) async {
    try {
      var url = Uri.parse(urlx);

      var response = await http
          .put(url, body: body, headers: headerObject)
          .timeout(Duration(seconds: timeOut));
      return response;
    } on TimeoutException catch (_) {
      // A timeout occurred.
      throw 'Connection Timeout. Your network is very weak.';
    } on SocketException catch (_) {
      // Other exception
      return 'No Internet Connection. Check your internet connection';
    }
  }

  postResponse(String urlx, Object body) async {
    try {
      var url = Uri.parse(urlx);
      final timer0 =
          logTimerStart('Post', 'Starting...$urlx', level: LogLevel.warning);
      var response = await http
          .post(url, body: body, headers: headerObject)
          .timeout(Duration(seconds: timeOut));
      logTimerStop('Post', timer0, 'Done...${response.statusCode}  $urlx',
          level: LogLevel.warning);
      return response;
    } on TimeoutException catch (_) {
      // A timeout occurred.
      throw 'Connection Timeout. Your network is very weak.';
    } on SocketException catch (_) {
      // Other exception
      return 'No Internet Connection. Check your internet connection';
    }
  }
}
