import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/articleview.dart';
import 'package:newsapp/web.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogTile extends StatelessWidget {
  late final String imgurl,title,description,url;
  BlogTile(this.imgurl,this.title,this.description,this.url);
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  ArticleView(url)),
  );
        
      },
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.only(bottom: 24),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child:Image.network(imgurl,height: 200,width: MediaQuery.of(context).size.width,fit:BoxFit.cover),
              ),
            ),
            SizedBox(height: 12,),
            Text(title,maxLines: 2,style:TextStyle(fontWeight: FontWeight.w500,color:Colors.black87,fontSize:20)),
            SizedBox(height: 4,),
            Text(description,maxLines: 2,style:TextStyle(fontSize: 14,color:Colors.black54))

          ],
        ),
      ),
    );

     
    
  }
}