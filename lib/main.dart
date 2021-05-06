import 'package:flutter/material.dart';
import 'package:flutter_mask2/ui/view/main_page.dart';
import 'package:flutter_mask2/view_model/store_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => StoreModel()),
        ],
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
