class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;

  final int humidity;
  final String temperture;
  final String category;
  final String plantname;
  final String imageURL;
  bool isfavorated;
  final String description;

  Plant({
    required this.plantId,
    required this.price,
    required this.size,
    required this.rating,
    required this.humidity,
    required this.temperture,
    required this.category,
    required this.plantname,
    required this.isfavorated,
    required this.imageURL,
    required this.description,
  });
  // list of plants data
  static List<Plant> plantlist = [
    Plant(
        plantId: 0,
        price: 22,
        category: 'indoor',
        plantname: 'sanseviera',
        size: 'small',
        rating: 4.5,
        humidity: 34,
        temperture: '23-34',
        imageURL: 'assets/plant-eight.png',
        isfavorated: true,
        description:
            'this plant is one of the best plant.it grows in most of the  regions in the world and can survive'
            'even the harshest weather condition.'),
    Plant(
        plantId: 1,
        price: 11,
        category: 'outdoor',
        plantname: 'philodendron',
        size: 'medium',
        rating: 4.8,
        humidity: 56,
        temperture: '19-22',
        imageURL: 'assets/plant-eight.png',
        isfavorated: false,
        description:
            'this plant is one of the best plant.it grows in most of the regions in the world and can survive'
            'even the harshest weather condition.'),
    Plant(
        plantId: 2,
        price: 18,
        category: 'indoor',
        plantname: 'beach dasiy',
        size: 'large',
        rating: 4.7,
        humidity: 56,
        temperture: '30-26',
        imageURL: 'assets/plant-eight.png',
        isfavorated: false,
        description:
            'this plant is one of the best plant.it grows in most of the regions in the world and can survive'
            'even the harshest weather condition.'),
    Plant(
        plantId: 2,
        price: 18,
        category: 'indoor',
        plantname: 'beach dasiy',
        size: 'large',
        rating: 4.7,
        humidity: 56,
        temperture: '33-20',
        imageURL: 'assets/plant-eight.png',
        isfavorated: false,
        description:
            'this plant is one of the best plant.it grows in most of the regions in the world and can survive'
            'even the harshest weather condition.'),
    Plant(
        plantId: 8,
        price: 29,
        category: 'indoor',
        plantname: 'supplement',
        size: 'large',
        rating: 4.7,
        humidity: 56,
        temperture: '29-25',
        imageURL: 'assets/plant-eight.png',
        isfavorated: false,
        description:
            'this plant is one of the best plant.it grows in most of the regions in the world and can survive'
            'even the harshest weather condition.'),
  ];
}
