import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late WebViewController _webViewController;

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
              onSelected: (value) {
                _webViewController.loadUrl(value);
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
                        )),
                    const PopupMenuItem(
                        value: 'https://kakao.com',
                        child: Text(
                          '카카오',
                        ))
                  ]),
        ],
      ),
      body: WillPopScope( // 뒤로가기 허용
        onWillPop: () async {
          if (await _webViewController.canGoBack()) { //  뒤로 갈 수 있는 지 여부 확인
            await _webViewController.goBack();
            return false;
          }
          return true;
        },
        child: WebView(
          initialUrl: 'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted, // 자바스크립트 허용
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}
