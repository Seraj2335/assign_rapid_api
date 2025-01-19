import 'package:assign_linkdin/screens/home_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'common.dart';

void main() {
  // final wsUrl = Uri.parse('wss://echo.websocket.events');
  // final channel = WebSocketChannel.connect(wsUrl);
  // await channel.ready;
  //
  // channel.stream.listen((message) {
  //   channel.sink.add('received!');
  //   channel.sink.close();
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
