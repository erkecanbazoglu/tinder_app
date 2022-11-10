///USER MEDIA MODEL

class UserMedia {
  final int id;
  final String url;

  UserMedia({
    required this.id,
    required this.url,
  });

  @override
  String toString() => 'UserMedia: {id: $id, url: $url}';
}
