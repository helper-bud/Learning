import 'dart:convert';
import 'dart:developer';

import 'package:bloc_api_call/features/posts/model/postModel.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static Future<List<PostDataUiModel>> fetchPostData() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
      // log(response.body);
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addPostData() async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
          body: {
            "title": "Akshit is a flutter Teacher",
            "body": "One Day shykat will be the best",
            "userId": 34
          });
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;

      log(e.toString());
    }
  }
}
