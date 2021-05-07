import 'package:flutter/material.dart';
import 'package:flutter_mask2/model/store_list.dart';
import 'package:url_launcher/url_launcher.dart';



class RemainStateListTile extends StatelessWidget {
  final Store store;

  RemainStateListTile(this.store);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(store.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(store.addr),
          Text('${store.km}km'),
        ],
      ),
      trailing: _buildRemainStatWidget(store),
      onTap: () {
        _launchURL(store.lat, store.lng);
      },
    );
  }

  Widget _buildRemainStatWidget(Store store) {
    var remainStat = '판매중지';
    var description = '판매중지';
    var color = Colors.black;
    if (store.remainStat == 'plenty') {
      remainStat = '충분';
      description = '100개 이상';
      color = Colors.green;
    }
    switch (store.remainStat) {
      case 'plenty':
        remainStat = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case 'some':
        remainStat = '보통';
        description = '30 ~ 100개 이상';
        color = Colors.yellow;
        break;
      case 'few':
        remainStat = '부족';
        description = '2 ~ 30개 이상';
        color = Colors.red;
        break;
      case 'empty':
        remainStat = '소진임박';
        description = '소진임박';
        color = Colors.grey;
        break;
      default:
    }

    return Column(
      children: [
        Text(
          remainStat,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
  void _launchURL(double lat, double lng) async {
    final url = 'https://google.com/maps/search/?api=1&query=$lat,$lng';
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  // void _launchURL() async {
  //   const url = 'https://flutter.dev';
  //   if (await canLaunch(url)) {
  //     launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   };
  // }
}


