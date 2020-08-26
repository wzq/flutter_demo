import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// WEB DETAIL PAGE
class DetailPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DetailPage> {
  bool _loadFinish = false;
  WebViewController _controller;
  String _title = "detail page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Offstage(offstage: _loadFinish, child: LinearProgressIndicator()),
          ),
          Expanded(
            child: WebView(
              initialUrl: ModalRoute.of(context).settings.arguments,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (s) {
                _controller.evaluateJavascript("document.title").then((value) {
                  setState(() {
                    _loadFinish = true;
                    _title = value;
                  });
                });
              },
              onPageStarted: (s) {
                print('web start $s');
              },
              onWebViewCreated: (control){
                _controller = control;
              },
            ),
          )
        ],
      ),
    );
  }
}
