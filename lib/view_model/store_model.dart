
import 'package:flutter/cupertino.dart';
import 'package:flutter_mask2/model/store_list.dart';
import 'package:flutter_mask2/repoditory/store_repository.dart';

class StoreModel with ChangeNotifier{
  var isLoading = false;
  List<Store> stores = [];

  final _storeRepository = StoreRepository();


  StoreModel() {
    fetch();
  }

  Future fetch() async {

    isLoading = true;
    notifyListeners();

    stores = await _storeRepository.fetch();
    isLoading = false;

    notifyListeners();
  }
}