class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  Post.initialState()
      : userId = 0,
        id = 0,
        title = '',
        body = ''; //! Why is this Static?

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
        userId: parsedJson['userId'],
        title: parsedJson['title'],
        body: parsedJson['body']);
  }
}
