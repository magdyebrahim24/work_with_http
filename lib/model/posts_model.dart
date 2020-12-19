import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Data {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Data({this.postId, this.id, this.name, this.email, this.body});

  Data.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }

  // فانكشن عشان تجيب الداتا باشتخدام ال http
  // بنستدعى الفانكشن فى ال initiState بتاع ال home page
  Future<List<Data>> fetchData() async {
    // متغير بجيب فيه الداتا وبتبقى عاوزه يتعملها decode
    final response =
        await http.get('https://jsonplaceholder.typicode.com/comments');

    // شرط عشان لو ال statusCode لايساوى 200
    // ال statusCode دا بتاع السيرفر 200--> معناها ان السيرفر موجود
    //error 404  مثلا معناها ان السيرفر مش موجود وهكذا
    if (response.statusCode == 200) {
      // الداتا جاية ك list
      List jsonResponse = json.decode(response.body);
      // بحولها ل list of map عشان اشتغل بييها
      return jsonResponse.map((job) => new Data.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
