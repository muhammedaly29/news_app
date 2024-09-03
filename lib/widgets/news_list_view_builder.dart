import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/services/news_service.dart';
import 'package:news_app_ui_setup/widgets/news_list_views.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category ;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews( category :widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return NewsListView(articles: snapShot.data!);
          } else if (snapShot.hasError) {
            return const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 220),
                child: Column(
                  children: [
                    Text(
                      '" Oops there was an error, \n    Please try again later "',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: Container(
                  height: 600.0,
                  width: 120.0,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 70.0,
                        width: 70.0,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
