import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Important',
                style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(height: 3.5),
              Text(
                'List of tasks by important',
                style: Theme.of(context).textTheme.subtitle.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
