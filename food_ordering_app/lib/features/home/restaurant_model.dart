class Restaurant {
  final String name;
  final String imageUrl;
  final double rating;
  final String deliveryTime;

  Restaurant({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
  });
}

final List<Restaurant> dummyRestaurants = [
  Restaurant(
    name: 'The Golden Spoon',
    imageUrl: 'assets/images/pizza.jpg',
    rating: 4.5,
    deliveryTime: '20-30 min',
  ),
  Restaurant(
    name: 'The Hungry Developer',
    imageUrl: 'assets/images/burger.jpg',
    rating: 4.8,
    deliveryTime: '15-25 min',
  ),
  Restaurant(
    name: 'The Code Kitchen',
    imageUrl: 'assets/images/sushi.jpg',
    rating: 4.2,
    deliveryTime: '25-35 min',
  ),
  Restaurant(
    name: 'The Buggy Bite',
    imageUrl: 'assets/images/pasta.jpg',
    rating: 3.8,
    deliveryTime: '30-40 min',
  ),
];
