// ########## Blue Print Copy for all places that we will add sooner ########

class Place {
  Place({
    this.subTitle,
    required this.flags,
    this.tags,
    required this.title,
    this.imageUrl,
    this.description,
    this.imageGallary,
    this.location,
  });

  final String title;
  String? imageUrl;
  final String? subTitle;
  final List<String> flags;
  final List<String>? tags;
  final List<String>? imageGallary;
  String? description;
  final PlaceLocation? location;
}

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  final double latitude;
  final double longitude;
  final String? address;
}
