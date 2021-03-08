class Book {
  int id;
  String createdAt;
  String updatedAt;
  String bookName;
  String author;
  String releaseDate;
  String coverUrl;

  Book({this.id, this.createdAt, this.updatedAt, this.bookName, this.author, this.releaseDate, this.coverUrl});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bookName = json['book_name'];
    author = json['author'];
    releaseDate = json['release_date'];
    coverUrl = json['cover_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['book_name'] = this.bookName;
    data['author'] = this.author;
    data['release_date'] = this.releaseDate;
    data['cover_url'] = this.coverUrl;
    return data;
  }
}
