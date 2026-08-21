import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../data.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final story = stories[index];
          return _Story(story: story);
        },
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        key: ValueKey(story.id),
        children: [
          Stack(
            children: [
              story.isViewed ? _profileViewed(context) : _profileNormal(context),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            story.name,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }

  Widget _profileNormal(BuildContext context) {
    return Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF8008),
                    Color(0xFFFFA13D),
                    Color(0xFFFFC371),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(5),
                child: _profileImage(),
              ),
            );
  }

  Widget _profileViewed(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            dashPattern: const [8, 3],
            strokeWidth: 2,
            radius: Radius.circular(26),
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.6),
            padding: EdgeInsets.all(7),
          ),
          child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: _profileImage(),
                  ),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/stories/${story.imageFileName}',
                    width: 68,
                    height: 68,
                    fit: BoxFit.cover,
                    cacheWidth: 136,
                  ),
                );
  }
}