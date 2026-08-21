import 'package:flutter/material.dart';
import 'package:blog_journey/widgets/carousel/carousel_slider.dart';

import '../data.dart';

class CategoryList extends StatelessWidget {

  static final _radius_32 = BorderRadius.circular(32);

  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return _CategoryItem(
          category: categories[realIndex],
          left: realIndex == 0 ? 32:8,
          right: realIndex == categories.length - 1 ? 32:8,
          radius: _radius_32);
      },
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.8,
        aspectRatio: 1.2,
        initialPage: 0,
        scrollPhysics: const BouncingScrollPhysics(),
        disableCenter: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  final BorderRadius radius;

  const _CategoryItem({
    super.key,
    required this.category, required this.left, required this.right, required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
            top: 100,
            right: 65,
            left: 65,
            bottom: 24,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xaa0D253C))
                ]
              ),
            ),
          ),
          Positioned.fill(
            
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              decoration: BoxDecoration(
                borderRadius: radius,
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: radius,
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Color(0xff0D253C),
                    Colors.transparent,
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: radius,
                child: Image.asset(
                  'assets/images/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                  cacheWidth: 1000),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 32,
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
