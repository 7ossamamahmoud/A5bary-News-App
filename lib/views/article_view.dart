import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late final WebViewController webViewController;
  double progressIndicator = 0.0;

  @override
  void initState() {
    super.initState();
    loadingNewsView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: progressIndicator < 100
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  value: progressIndicator / 100.0,
                ),
              )
            : WebViewWidget(
                controller: webViewController,
              ),
      ),
    );
  }

  void loadingNewsView() {
    webViewController = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url!),
      )
      ..setBackgroundColor(
        Colors.white,
      )
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            progressIndicator = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            progressIndicator = progress.toDouble();
          });
        },
        onPageFinished: (url) {
          setState(() {
            progressIndicator = 100;
          });
        },
      ));
  }
}
