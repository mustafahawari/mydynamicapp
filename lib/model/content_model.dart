class ContentModel {
  String? imageUrl;
  int? postId;
  String? title;
  String? details;
  String? shortDescription;

  ContentModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json["yoast_head_json"]["og_image"][0]['url'];
    postId = json["id"];
    title = json['title']['rendered'];
    details = json['content']['rendered'];
    shortDescription = json['excerpt']['rendered'];
  }
}
