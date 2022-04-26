import 'package:flutter/material.dart';

class RecipeLoadingItem extends StatelessWidget {
  const RecipeLoadingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: double.infinity, height: 24, color: Theme.of(context).scaffoldBackgroundColor),
                const SizedBox(height: 8),
                Container(width: double.infinity, height: 20, color: Theme.of(context).scaffoldBackgroundColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
