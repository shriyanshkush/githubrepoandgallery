class UnsplashImage {
  final String id;
  final String url;
  final String user;

  UnsplashImage({
    required this.id,
    required this.url,
    required this.user,
  });

  factory UnsplashImage.fromJson(Map<String, dynamic> json) {
    return UnsplashImage(
      id: json['id'],
      url: json['urls']['small'],
      user: json['user']['name'],
    );
  }
}
