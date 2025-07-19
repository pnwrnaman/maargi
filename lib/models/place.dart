class Place {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final List<String> tags;
  final double rating;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.tags,
    required this.rating,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      tags: List<String>.from(json['tags']),
      rating: json['rating'].toDouble(),
    );
  }
}
