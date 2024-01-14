import 'package:flutter/material.dart';

import '../widgets/category_list.dart';
import '../widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Pulse',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoryList(),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 20,
            )),
            NewsListViewBuilder(
              categoryName: 'General',
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 20,
            )),
          ],
        ),
      ),
    );
  }
}
