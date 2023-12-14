class SampleDataModel {
  final String title;
  final String description;
  final String imageURL;

  SampleDataModel({required this.title, required this.description, required this.imageURL});

  factory SampleDataModel.fromJson(Map<String, dynamic> json) {
    return SampleDataModel(title: json['title'], description: json['description'], imageURL: json['url']);
  }

  static List<SampleDataModel> decodeList(List<dynamic> jsonList) =>
      jsonList.map((e) => SampleDataModel.fromJson(e)).toList();
}
