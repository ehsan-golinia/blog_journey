class Story {
  final int id;
  final String name;
  final String imageFileName;
  final String iconFileName;
  final bool isViewed;

  Story(
      {required this.id,
      required this.name,
      required this.imageFileName,
      required this.iconFileName,
      required this.isViewed});
}

class Category {
  final int id;
  final String title;
  final String imageFileName;

  Category(
      {required this.id, required this.title, required this.imageFileName});
}

class AppDatabase {
  static List<Story> get stories {
    return [
      Story(
          id: 1001,
          name: 'Olivia',
          imageFileName: 'story_1.jpg',
          iconFileName: 'category_1.png',
          isViewed: false),
      Story(
          id: 1002,
          name: 'Charlotte',
          imageFileName: 'story_2.png',
          iconFileName: 'category_2.png',
          isViewed: false),
      Story(
          id: 1003,
          name: 'Emma',
          imageFileName: 'story_3.jpg',
          iconFileName: 'category_3.png',
          isViewed: true),
      Story(
          id: 1004,
          name: 'Lucas',
          imageFileName: 'story_4.png',
          iconFileName: 'category_4.png',
          isViewed: false),
      Story(
          id: 1005,
          name: 'Amelia',
          imageFileName: 'story_5.png',
          iconFileName: 'category_2.png',
          isViewed: false),
      Story(
          id: 1006,
          name: 'Hendri',
          imageFileName: 'story_6.png',
          iconFileName: 'category_1.png',
          isViewed: false),
      Story(
          id: 1007,
          name: 'Sophia',
          imageFileName: 'story_7.jpg',
          iconFileName: 'category_4.png',
          isViewed: false),
      Story(
          id: 1008,
          name: 'Hendri',
          imageFileName: 'story_8.png',
          iconFileName: 'category_3.png',
          isViewed: false),
    ];
  }

  static List<Category> get categories {
    return [
      Category(
        id: 101,
        title: 'Technology',
        imageFileName: 'large_post_1.jpg',
      ),
      Category(id: 102, title: 'Adventure', imageFileName: 'large_post_2.jpg'),
      Category(id: 103, title: 'Sports', imageFileName: 'large_post_3.jpg'),
      Category(id: 104, title: 'Politics', imageFileName: 'large_post_4.jpg'),
      Category(id: 105, title: 'Science', imageFileName: 'large_post_5.jpg'),
      Category(
          id: 106,
          title: 'Car and Motorcycles',
          imageFileName: 'large_post_6.jpg'),
    ];
  }
}
