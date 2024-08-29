// ignore_for_file: file_names, avoid_print, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body); //dacode is used to convert json to list
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); //dacode is used to convert json to list
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode} with body ${response.body}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url $url , body $body, token $token');
    http.Response response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data =
          jsonDecode(response.body); //dacode is used to convert json to map
      // ignore: avoid_print
      print(data);
      return data;
    } else {
      throw Exception(
          'There is a problem with status code ${response.statusCode} with body ${response.body}');
    }
  }
}
