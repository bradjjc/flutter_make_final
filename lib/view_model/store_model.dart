
import 'package:flutter/cupertino.dart';
import 'package:flutter_mask2/model/store_list.dart';
import 'package:flutter_mask2/repository/location_repository.dart';
import 'package:flutter_mask2/repository/store_repository.dart';

class StoreModel with ChangeNotifier{
  var isLoading = false;
  List<Store> stores = [];

  final _storeRepository = StoreRepository();
  final _locationRepository  = LocationRepository();


  StoreModel() {
    fetch();
  }

  Future fetch() async {

    isLoading = true;
    notifyListeners();

    // Position position = await _locationRepository.getCurrentLocation();

    stores = await _storeRepository.fetch();
    isLoading = false;

    notifyListeners();
  }
}