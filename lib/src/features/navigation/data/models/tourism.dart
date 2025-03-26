class TourismData {
  final String city;
  final double longitude;
  final double latitude;
  final List<Hotel> hotels;
  final List<Hospital> hospitals;
  final List<Restaurant> restaurants;
  final List<Attraction> attractions;
  final Services services;

  TourismData({
    required this.city,
    required this.longitude,
    required this.latitude,
    required this.hotels,
    required this.hospitals,
    required this.restaurants,
    required this.attractions,
    required this.services,
  });

  factory TourismData.fromJson(Map<String, dynamic> json) {
    return TourismData(
      city: json['city'],
      longitude: json['longitude'].toDouble(),
      latitude: json['latitude'].toDouble(),
      hotels: (json['hotels'] as List).map((e) => Hotel.fromJson(e)).toList(),
      hospitals:
          (json['hospitals'] as List).map((e) => Hospital.fromJson(e)).toList(),
      restaurants: (json['restaurants'] as List)
          .map((e) => Restaurant.fromJson(e))
          .toList(),
      attractions: (json['attractions'] as List)
          .map((e) => Attraction.fromJson(e))
          .toList(),
      services: Services.fromJson(json['services']),
    );
  }
}

class Hotel {
  final String name;
  final int price;
  final double rating;
  final String address;
  final List<String> images;

  Hotel({
    required this.name,
    required this.price,
    required this.rating,
    required this.address,
    required this.images,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
      price: json['price'],
      rating: json['rating'].toDouble(),
      address: json['address'],
      images: List<String>.from(json['images']),
    );
  }
}

class Hospital {
  final String name;
  final String address;

  Hospital({required this.name, required this.address});

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      name: json['name'],
      address: json['address'],
    );
  }
}

class Restaurant {
  final String name;
  final String address;
  final int price;
  final double rating;

  Restaurant({
    required this.name,
    required this.address,
    required this.price,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      address: json['address'],
      price: json['price'],
      rating: json['rating'].toDouble(),
    );
  }
}

class Attraction {
  final String name;
  final String desc;
  final String type;
  final List<String> images;

  Attraction({
    required this.name,
    required this.desc,
    required this.type,
    required this.images,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      name: json['name'],
      desc: json['desc'],
      type: json['type'],
      images: List<String>.from(json['images']),
    );
  }
}

class Services {
  final ServiceItem taxi;
  final ServiceItem map;

  Services({required this.taxi, required this.map});

  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
      taxi: ServiceItem.fromJson(json['taxi']),
      map: ServiceItem.fromJson(json['map']),
    );
  }
}

class ServiceItem {
  final String name;
  final String link;

  ServiceItem({required this.name, required this.link});

  factory ServiceItem.fromJson(Map<String, dynamic> json) {
    return ServiceItem(
      name: json['name'],
      link: json['link'],
    );
  }
}
