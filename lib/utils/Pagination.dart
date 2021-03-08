class Pagination {
  //"current_page": 1,
  // "first_page_url": "http://localhost:8000/api/books?page=1",
  //     "from": 1,
  //     "last_page": 21,
  //     "last_page_url": "http://localhost:8000/api/books?page=21",
  // "next_page_url": "http://localhost:8000/api/books?page=2",
  //     "path": "http://localhost:8000/api/books",
  //     "per_page": 5,
  //     "prev_page_url": null,
  //     "to": 5,
  //     "total": 101

  final int currentPage;
  final int lastPage;
  Pagination.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] ?? 0,
        lastPage = json['last_page'] ?? 0;
}
