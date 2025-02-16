import 'package:equatable/equatable.dart';

class Venue extends Equatable {
  final String id;
  final String name;
  final String shortDescription;
  final String imageUrl;

  const Venue({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, shortDescription, imageUrl];

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['venue']?['id'] ?? '',
      name: json['venue']?['name'] ?? '',
      shortDescription: json['venue']?['short_description'] ?? '',
      imageUrl: json['image']?['url'] ?? '',
    );
  }
}
