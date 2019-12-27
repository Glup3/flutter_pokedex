class APIResource {
  final String name;
  final String url;

  APIResource({this.name, this.url});

  factory APIResource.fromJson(Map<String, dynamic> json) {
    return APIResource(name: json['name'], url: json['url']);
  }
}
