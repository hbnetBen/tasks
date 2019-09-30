import 'package:flutter/material.dart';
import 'package:tasks/src/data/models/category_model.dart';
import 'package:tasks/src/presentation/ui_colors.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryModel category;

  CategoryCardWidget({this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
      ),
      elevation: 5.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(
              flex: 5
            ),
            Text(
              category.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: UIColors.DarkGrey
              )
            ),
            SizedBox(height: 5),
            Text(
              category.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: UIColors.Blue,
                fontSize: 28.0
              )
            )
          ]
        )
      )
    );
  }
}