import 'package:blog_journey/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Blog Journey'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hi, Ehsan', style: Theme.of(context).textTheme.headlineSmall),
                    Image.asset('assets/images/icons/notifications_unread_30dp.png'),
                    // Image.asset('assets/images/icons/notifications_30dp.png')
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  'Explore the moment!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final story = stories[index];
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffF7B267),
                                    Color(0xffF79D65),
                                    Color(0xffF4845F),
                                    Color(0xffF27059),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Container(
                                margin: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: const EdgeInsets.all(4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.asset(
                                    'assets/images/stories/${story.imageFileName}',
                                  ),
                                ),
                              ),
                            ),
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
                    );
                  },
                  itemCount: stories.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
                  physics: BouncingScrollPhysics(),
                  // physics: NeverScrollableScrollPhysics()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}