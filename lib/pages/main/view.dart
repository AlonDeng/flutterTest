import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const NewsCategoriesWidget(),
          const Divider(height: 1),
          const NewsRecommendWidget(),
          const Divider(height: 1),
          const NewsChannelsWidget(),
          const Divider(height: 1),
          const NewsListWidget(),
          const Divider(height: 1),
          NewsletterWidget(),
        ],
      ),
    );
  }
}
