// class Users{
//   final String title;
//   final String id;
//   Users({required this.title, required this.id});
//
//   factory Users.fromJson(Map<String, dynamic> json){
//     return Users(
//       title: json["title"],
//       id: json["id"]
//     );
//   }
// }


class Users {
  final int id;
  final int userId;
  final String title;
  final bool completed;
  Users({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
