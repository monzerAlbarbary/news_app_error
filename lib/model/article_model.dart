class ArticleModel {
  String title;
  String description;
  String urlToImage;
  String content;
  String author;
  ArticleModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.content,
    required this.author,
  });

  ArticleModel copyWith({
    String? title,
    String? description,
    String? urlToImage,
    String? content,
    String? author,
  }) {
    return ArticleModel(
      title: title ?? this.title,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
      content: content ?? this.content,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'content': content,
      'author': author,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      title: map['title'] ?? 'This is null',
      description: map['description'] ?? "This is null",
      urlToImage: map['urlToImage'] ?? 'asset/image/placeholder.png',
      content: map['content'] ?? '',
      author: map['author'] ?? '',
    );
  }

  @override
  String toString() {
    return 'NewsModel(title: $title, description: $description, urlToImage: $urlToImage, content: $content, author: $author)';
  }
}
