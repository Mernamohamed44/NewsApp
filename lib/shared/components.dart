import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:news_app/moudels/web_views.dart';

Widget buildArticalItem(Articles articles, context) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WebViewScreen(articles.url);
      }));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${articles.urlToImage}')))),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${articles.title}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Text('${articles.publishedAt}',
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildScreenItem(list, {isSearch = false}) {
  return ConditionalBuilder(
      condition: list!.isNotEmpty,
      builder: (context) => ListView.separated(
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticalItem(list[index], context),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 7),
      fallback: (context) => isSearch
          ? Container()
          : const Center(child: CircularProgressIndicator()));
}
