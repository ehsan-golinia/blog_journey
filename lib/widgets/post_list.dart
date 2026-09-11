import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data.dart';

class PostList extends StatelessWidget {
  const PostList({
    super.key,
    required this.posts,
    });

  final List<PostData> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Latest News', style: Theme.of(context).textTheme.titleMedium),
              TextButton(onPressed: () {}, child: const Text('More'))
            ],
          ),
        ),
        ListView.builder(
          itemCount: posts.length,
          itemExtent: 141,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
          final post = posts[index];
          return _Post(post: post);
        })
      ],
    );

  }
}

class _Post extends StatelessWidget {
  const _Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x1a5282FF)
          )
        ]
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/images/posts/small/${post.imageFileName}',
            width: 125,
            height: 125,
            fit: BoxFit.cover,
            cacheWidth: 250,)
          ),
          // const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(post.caption, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 6),
                Text(
                  post.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.hand_thumbsup, size: 16, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 6),
                    Text(post.likes, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
                    const SizedBox(width: 12),
                    Icon(CupertinoIcons.clock, size: 16, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 6),
                    Text(post.time, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(post.isBookmarked ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark, size: 16, color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                )
              ],),
            ),
          )
        ],
      ),
    );
  }
}

