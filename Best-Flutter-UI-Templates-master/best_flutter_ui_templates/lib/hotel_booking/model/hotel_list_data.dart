class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/icon/shan2.jpg',
      titleTxt: 'Mount Hyjal',
      subTxt: 'World of Warcraft',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 7,
    ),
    HotelListData(
      imagePath: 'assets/icon/shan5.jpg',
      titleTxt: 'High Hrothgar',
      subTxt: 'Skyrim',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      perNight: 3,
    ),
    HotelListData(
      imagePath: 'assets/icon/shan6.jpg',
      titleTxt: 'The Crystal Desert ',
      subTxt: 'Guild Wars 2',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      perNight: 8,
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_4.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      perNight: 170,
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_5.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: 240,
      rating: 4.5,
      perNight: 200,
    ),
  ];
}
