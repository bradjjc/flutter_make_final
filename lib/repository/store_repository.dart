import 'package:flutter_mask2/model/store_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class StoreRepository {

  // Future<List<Store>> fetch(double lat, double lng) async {
  Future<List<Store>> fetch() async {
    final List<Store> stores = [];

    var uri = Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');
    // lat=$lat
    // lng=$lng

    var response = await http.get(uri);

    var jsonResult = jsonDecode(utf8.decode(response.bodyBytes));

    var jsonStores = jsonResult['stores'];

    // setState(() {
    jsonStores.forEach((e) {
      stores.add(Store.fromJson(e));
    });
    //   isLoading = false;
    // });
    print('fetch완료');

    return stores.where((store) {
      return store.remainStat == 'plenty' ||
          store.remainStat == 'some' ||
          store.remainStat == 'few';
    }).toList();
  }
}
