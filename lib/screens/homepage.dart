import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newsapp/blogtile.dart';
import 'package:newsapp/categorycard.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/model/categorymodel.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/newsarticle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> items=<CategoryModel>[];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items=getCategories();
 

  }
 
  Future<List<NewsArticle>> getNews() async
  {

    var url=Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=dce6627d397942429f06c7380a85c1b1");
    late http.Response response;
    try
    {

      

      response=await http.get(url);
       Map newsarticles=jsonDecode(response.body);
      if(newsarticles["status"]=="ok")
      {
         List<NewsArticle> list=[];

        
        
        List<dynamic> news=newsarticles["articles"];

        for(var item in news)
        {
          var imgurl=item["urlToImage"];
          var title=item["title"];
          var desc=item["description"];
          var url=item["url"];
          NewsArticle n=NewsArticle(imgurl, title, desc,url);
          list.add(n);

        }


        return list;
        }

      
      else{
        return Future.error("something gone wrong,${response.statusCode}");
      }

    }catch(e)
    {
      return Future.error(e.toString());
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body:Column(
        children: [
          Container(
            height: 70,
            child:ListView.builder(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return  CategoryCard(items[index].imgurl,items[index].categoriname);
                
              }
              
              )
          ),
          Expanded(
            child: FutureBuilder(
              future: getNews(),
              builder: (( context,snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting)
                {
                  return const Center(
                    child:Text("Waiting"),
                  );
          
                }
                else
                {
                  if(snapshot.hasError)
                  {
                    return Text(snapshot.error.toString());
                  }
                  else
                  {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: ((BuildContext context,int index) {
                        return BlogTile(snapshot.data![index].imgurl,snapshot.data![index].title,snapshot.data![index].desc,snapshot.data![index].url);
                      })
                      );
                  }
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}