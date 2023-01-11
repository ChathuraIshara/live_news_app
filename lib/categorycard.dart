import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/categorynews.dart';

class CategoryCard extends StatelessWidget
{
  String imgurl,categoryname;
  CategoryCard(this.imgurl,this.categoryname);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap:(){
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  CategoryNews(categoryname)),
  );

      },
      child:Container(
        margin:EdgeInsets.only(right:14),
        child:Stack(
          children: [
            ClipRRect(
              borderRadius:BorderRadius.circular(5),
              child: Image.network(imgurl,height: 60,width: 120,fit:BoxFit.cover)),
              Container(
                alignment: Alignment.center,
                height: 60,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(5),
                  color:Colors.black26,
                ),
                child:Text(
                  categoryname,
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),

          ],
        ),
        
      ),
    );


  }
  






}