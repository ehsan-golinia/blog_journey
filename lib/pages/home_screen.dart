import 'package:blog_journey/data.dart';
import 'package:flutter/material.dart';
import '../theme/theme_controller.dart';
import '../widgets/widgets.dart';

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
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset('assets/images/icons/notifications_unread_30dp.png'),
                          ),
                        ),
                        InkWell(
                          onTap: toggleTheme,
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.palette_outlined, size: 30),
                          ),
                        ),
                      ],
                    ),
                    
                    // Image.asset('assets/images/icons/notifications_30dp.png')
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                child: Text(
                  'Explore the moment!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              StoryList(stories: stories),
              const SizedBox(height: 20,),
              CategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
