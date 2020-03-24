import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../models/BookItem.dart';

List<BookItem> parse(String body) {
  final decoded = json.decode(body);
  final parsed = decoded['documents'].cast<Map<String, dynamic>>();
  return parsed.map<BookItem>((json) => BookItem.fromJson(json)).toList();
}

Future<List<BookItem>> fetch() async {
  String kakaoAPIKey = DotEnv().env['KAKAO_API_KEY'];
  final response = await http.get(
    'https://dapi.kakao.com/v3/search/book?target=title&query=amazon&page=1&size=50',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'KakaoAK ' + kakaoAPIKey
    }
  );

  if (response.statusCode == 200) {
    return compute(parse, response.body);
  } else {
    throw Exception('Failed to fetch data.');
  }
}

class DetailMeScreen extends StatefulWidget {
  @override
  _DetailMeState createState() => _DetailMeState();
}


class _DetailMeState extends State<DetailMeScreen> {
  static const String id = 'detail_me_screen';

  Future<List<BookItem>> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("DETAIL ME"),
            FutureBuilder<List<BookItem>>(
              future: fetch(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? Text('data size : ' + snapshot.data.length.toString()) // PhotosList를 출력
                    : Center(
                    child: CircularProgressIndicator()); // 데이터 수신 전이면 인디케이터 출력
              },
            ),
            Container(
              child: RaisedButton(
                color: Colors.amber,
                child: Text('go to back',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                )
              )
            ],
          )
        )
    );
  }
}