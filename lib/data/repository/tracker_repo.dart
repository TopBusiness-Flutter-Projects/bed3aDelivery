import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bed3aDelivery/data/api/api_client.dart';
import 'package:bed3aDelivery/data/model/body/track_body.dart';
import 'package:bed3aDelivery/utill/app_constants.dart';

class TrackerRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  TrackerRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getTrackList(String id, DateTime filterDate) async {
    String startDate = '${DateFormat('yyyy-MM-dd').format(filterDate)}T00:00:00.000Z';
    String endDate = '${DateFormat('yyyy-MM-dd').format(filterDate)}T23:59:59.000Z';
    Response response = await apiClient.getData('/tracks?user.id=$id&date_gte=$startDate&date_lte=$endDate');
    return response;

  }

  Future<Response> getHistoryList(String id) async {
    Response response = await apiClient.getData('/track-histories?track=$id');
    return response;

  }
  Future<Response> addHistory(TrackBody trackBody) async {
      Response response = await apiClient.postData(AppConstants.recordLocationUri, trackBody.toJson(),);
      return response;

  }

}