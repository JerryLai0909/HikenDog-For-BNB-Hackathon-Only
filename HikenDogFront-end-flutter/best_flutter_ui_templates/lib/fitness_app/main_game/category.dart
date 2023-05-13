class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,
  });

  String title;
  int lessonCount;
  int money;
  double rating;
  String imagePath;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/nft/31.png',
      title: 'NFT(古树任务)',
      lessonCount: 8,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/nft/32.png',
      title: 'NFT(漂浮任务)',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/nft/33.png',
      title: 'NFT(日出任务)',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/nft/34.png',
      title: 'NFT(月食任务)',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> categoryList2 = <Category>[
    Category(
      imagePath: 'assets/nft/1.png',
      title: '竞速挑战',
      lessonCount: 8,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/nft/5.png',
      title: '日出与落霞',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/nft/3.png',
      title: '森林解密',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/nft/9.png',
      title: '好友的聚会',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/nft/16.png',
      title: '魂绑NFT',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/nft/17.png',
      title: '极速挑战NFT',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/nft/18.png',
      title: '最高者认证',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/nft/19.png',
      title: '收益型NFT',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
  ];
}
