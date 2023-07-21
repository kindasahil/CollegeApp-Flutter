import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  List<dynamic> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    setState(() {
      isLoading = true;
    });
    var url =
        'https://newsapi.org/v2/everything?q=technology&apiKey=6b1eacd669bd47a4a98a5e7a8154114b';
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    var data = json.decode(response.body);
    setState(() {
      newsList = data['articles'];
      isLoading = false;
    });
    print("##############################");
    print(newsList[0]['urlToImage'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (BuildContext context, int index) {
                print(index);
                print(newsList[index]);
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      newsList[index]['urlToImage'] != null
                          ? Image.network(newsList[index]['urlToImage'])
                          : Container(),
                      // Image.network(newsList[index]['urlToImage'] ??= ""),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              newsList[index]['title'],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              newsList[index]['publishedAt'],
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              newsList[index]['description'],
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            OutlinedButton(
                              child: Text('Read More'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
