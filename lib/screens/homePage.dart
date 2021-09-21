import 'package:flutter/material.dart';
import 'package:flutter_dio/models/apiModel.dart';
import 'package:flutter_dio/services/apiHelper.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel>? newsModel;

  @override
  void initState() {
    newsModel = ApiHelper().getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello"),),
      body: FutureBuilder<NewsModel?>(
        future: newsModel,
        builder:(context,snapshot){
          if(snapshot.hasData){
             return ListView.builder(
            itemCount: snapshot.data!.articles.length,
            itemBuilder:(context,index){
              var article = snapshot.data!.articles[index];
                return  Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  article.urlToImage,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                
                                Text(
                                  article.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  article.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            },
          );
          }
          else{
            return Center(
              child: CircularProgressIndicator()
              );
          }
         
        },
        ),
    );
  }
}
