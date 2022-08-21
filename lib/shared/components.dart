import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

Widget buildArticalItem(Articles articles) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(25) ,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('${articles.urlToImage}')
            )
          )
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${articles.title}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text('${articles.publishedAt}')
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}
