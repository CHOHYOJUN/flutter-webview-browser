import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나만의 웹 브라우저'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          // +   ,  Icons.more_vert 햄버거 아이콘
          PopupMenuButton<String>(
            onSelected: (value){
              print(value);
            },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                        value: 'https://google.com',
                        child: Text(
                          '구글',
                        )),
                    const PopupMenuItem(
                        value: 'https://naver.com',
                        child: Text(
                          '네이버',
                        ))
                  ]),
        ],
      ),
      body: const WebView(
        initialUrl: 'https://www.naver.com',
      ),
    );
  }
}
