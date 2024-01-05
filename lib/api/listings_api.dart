//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:coding_challenge_real_estate_app/models/models.dart';


class ListingsApi {

  //static Future<List<ResponseBody>> getListings(BuildContext context) async {
  static Future<List<Listing>> getListings(BuildContext context) async {

    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/data/listings_data.json');
    //final body = json.decode(data);
    
    final nowPlayingResponse = ResponseBody.fromJson(data);
    return nowPlayingResponse.listings;

    //return body.map<ResponseBody>(ResponseBody.fromJson).toList();
  }
}