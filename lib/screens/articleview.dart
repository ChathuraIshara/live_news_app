import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class ArticleView extends StatefulWidget {
  late String url;
  ArticleView(this.url);
  

  
  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  

  
  
  

  
 late  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith(widget.url)) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse(widget.url));

 

  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:IconButton(
          color:Colors.black,
          onPressed: (){
            Navigator.pop(context);
          }, icon:Icon(Icons.arrow_back_ios),
        ),
        
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [

            Text("Live",style:TextStyle(color:Colors.black87,fontWeight: FontWeight.w600)),
            Text("News",style:TextStyle(color:Colors.blue,fontWeight: FontWeight.w600))
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      
      ),
        body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  WebViewWidget(controller: controller),
  )
      
    );
  }
}