import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.jpg', categoryName: 'Business'),
    CategoryModel(
        image: 'assets/entetainment.jpg', categoryName: 'Entertainment'),
    CategoryModel(
        image: 'assets/general_news.jpg', categoryName: 'General News'),
    CategoryModel(image: 'assets/health.jpg', categoryName: 'Health'),
    CategoryModel(image: 'assets/science.jpg', categoryName: 'Science'),
    CategoryModel(image: 'assets/sports.jpeg', categoryName: 'Sports'),
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'Technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}
