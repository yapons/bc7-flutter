import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ebookflutter/networking/model/ebooklist_response_manual.dart';
import 'package:ebookflutter/utilities/app_string.dart';
import 'package:ebookflutter/networking/model/ebookdetail_response_manual.dart';


class APIRequest {
  APIRequest._();

  // static final Dio _dio = Dio()..options.baseUrl = AppString.baseUrl..options.headers = {"Authorization" : "1234346536"};
  static final Dio _dio = Dio()..options.baseUrl = AppString.baseUrl;
  //static final Dio _dioebook = Dio();

  static Future<List<EbookResponseManual>?> getEbookListManual() async {
    try {
      //final result = await _dioebook.get("https://api.itbook.store/1.0/new");
      final result = await _dio.get(AppString.ebooknew);
      if (result.data['books'] is List) {
        return List<EbookResponseManual>.from(result.data['books'].map((data) => EbookResponseManual.fromJson(data)));
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      print('print => $e');
      rethrow;
    }
  }
  static Future<EbookDetailResponseManual?> getEbookDetailManual(String? isbn) async {
    try {

      final result = await _dio.get('books/' + isbn.toString());
      if (result.data != null) {
        return EbookDetailResponseManual.fromJson(result.data);
      } else {
        throw Exception();
      }
    } catch (e, stackTrace) {
      print('print => $e');
      rethrow;
    }
  }
}
