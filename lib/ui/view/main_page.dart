
import 'package:flutter/material.dart';
import 'package:flutter_mask2/ui/widget/remain_stat_list_tile.dart';
import 'package:flutter_mask2/view_model/store_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('마스크 재고 있는곳: ${storeModel.stores.length}곳'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                storeModel.fetch();
              },
            )
          ],
        ),
        body: storeModel.isLoading == true
            ? loadingWidget()
            : ListView(
          children: storeModel.stores.map((store) {
            return ListTile(
              title: Text(store.name),
              subtitle: Text(store.addr),
              trailing: RemainStateListTile(store),
            );
          }).toList(),
        ));
  }



  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('정보를 가져오는 중'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}