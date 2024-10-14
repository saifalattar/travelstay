class Image {
  final String imageId;
  final String hotelId;
  final String caption;
  final String url;
  final int imageOrder;
  final bool isDefault;

  Image({
    required this.imageId,
    required this.hotelId,
    required this.caption,
    required this.url,
    required this.imageOrder,
    required this.isDefault,
  });

  // Factory constructor to create an instance from a JSON object
  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      imageId: json['imageId'],
      hotelId: json['hotelId'],
      caption: json['caption'],
      url: json['url'],
      imageOrder: json['imageOrder'],
      isDefault: json['default'],
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'imageId': imageId,
      'hotelId': hotelId,
      'caption': caption,
      'url': url,
      'imageOrder': imageOrder,
      'default': isDefault,
    };
  }
}

class Payload {
  final List<Image> images;

  Payload({
    required this.images,
  });

  // Factory constructor to create an instance from a JSON object
  factory Payload.fromJson(Map<String, dynamic> json) {
    var imagesList = json['images'] as List;
    List<Image> images = imagesList.map((i) => Image.fromJson(i)).toList();

    return Payload(
      images: images,
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'images': images.map((image) => image.toJson()).toList(),
    };
  }
}

class HotelImageModel {
  final Payload payload;
  final String status;

  HotelImageModel({
    required this.payload,
    required this.status,
  });

  // Factory constructor to create an instance from a JSON object
  factory HotelImageModel.fromJson(Map<String, dynamic> json) {
    return HotelImageModel(
      payload: Payload.fromJson(json['payload']),
      status: json['status'],
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'payload': payload.toJson(),
      'status': status,
    };
  }
}
