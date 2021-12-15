import 'package:flutter/material.dart';
import 'package:future_jobs_clone/models/category_model.dart';
import 'package:future_jobs_clone/pages/catetgory_page.dart';
import 'package:future_jobs_clone/theme.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              category: category,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 200,
        margin: const EdgeInsets.only(
          left: defaultMargin,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              category.imageUrl,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            category.name,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
        ),
      ),
    );
  }
}
