// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController? _controller;
  InAppWebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    // await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    //   _controller = WebViewController()
    //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //     ..setBackgroundColor(const Color(0x00000000))
    //     ..setNavigationDelegate(
    //       NavigationDelegate(
    //         onProgress: (int progress) async {
    //           PermissionStatus cameraStatus = await Permission.camera.request();
    //           // Update loading bar.

    //           if (cameraStatus == PermissionStatus.granted) {
    //             print("diizinkan");
    //           }
    //         },
    //         onPageStarted: (String url) {},
    //         onPageFinished: (String url) {},
    //         onWebResourceError: (WebResourceError error) {},
    //         onNavigationRequest: (NavigationRequest request) {
    //           if (request.url.startsWith('https://www.youtube.com/')) {
    //             return NavigationDecision.prevent;
    //           }
    //           return NavigationDecision.navigate;
    //         },
    //       ),
    //     )
    //     ..loadRequest(Uri.parse('https://clever-peony-3af47e.netlify.app/'));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View"),
      ),
      body: InAppWebView(
          initialUrlRequest: URLRequest(
              url: Uri.parse("https://clever-peony-3af47e.netlify.app/")),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              mediaPlaybackRequiresUserGesture: false,
              // debuggingEnabled: true,
            ),
          ),
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
          },
          androidOnPermissionRequest: (InAppWebViewController controller,
              String origin, List<String> resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          }),
    );
  }
}
