import 'package:flutter/material.dart';

class MenuLoadingItem extends StatelessWidget {
  const MenuLoadingItem({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 196, height: 20, color: Theme.of(context).scaffoldBackgroundColor),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(backgroundColor: Theme.of(context).scaffoldBackgroundColor),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: double.infinity, height: 24, color: Theme.of(context).scaffoldBackgroundColor),
                    const SizedBox(height: 8),
                    Container(width: 196, height: 20, color: Theme.of(context).scaffoldBackgroundColor),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
