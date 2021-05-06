import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepository {
  // final _geolocator = Geolocator();

  Future getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

}