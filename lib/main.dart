import 'package:assign_linkdin/model/routes.dart';

import 'package:assign_linkdin/view_model/cricket_view_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (cTx) => CricketViewProvider())],
      child: MaterialApp.router(
        routerConfig: Routes.goRoute(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
