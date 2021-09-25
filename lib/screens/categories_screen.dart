import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 25,
          top: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                    catData.id,
                    catData.title,
                    catData.color,
                  ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.62,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );
  }
}
