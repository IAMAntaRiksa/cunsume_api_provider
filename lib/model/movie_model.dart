import 'package:flutter/widgets.dart';

class MovieModel {
  String? title;
  String? body;
  MovieModel({
    required this.title,
    required this.body,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      body: json['body'],
    );
  }
}

class ImagesModel {
  String? jpg;
  ImagesModel({required this.jpg});
  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return ImagesModel(jpg: json['images']);
  }
}

class JpgModel {
  String? image_url;
  JpgModel({required this.image_url});
  factory JpgModel.fromJson(Map<String, dynamic> json) {
    return JpgModel(
      image_url: json['image_url'],
    );
  }
}
