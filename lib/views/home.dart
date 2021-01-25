import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtt_news_today/helper/data.dart';
import 'package:mtt_news_today/helper/news.dart';
import 'package:mtt_news_today/models/article_model.dart';
import 'package:mtt_news_today/models/category_model.dart';
import 'package:mtt_news_today/views/article.dart';
// import 'package:mtt_news_today/views/category_news.dart';
import 'package:mtt_news_today/views/profile.dart';
import 'package:mtt_news_today/views/signup.dart';
import 'package:mtt_news_today/widgets/blog_tile.dart';
// import 'package:mtt_news_today/widgets/category_tile.dart';

class Home extends StatefulWidget {
  final String firstnameHolder;
  final String lastnameHolder;
  final String emailHolder;
  final String phoneHolder;
  final String password;

  Home(
      {this.firstnameHolder,
      this.lastnameHolder,
      this.emailHolder,
      this.phoneHolder,
      this.password});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(
                  color: Colors.black87,
                  // fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Today             ',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black87),
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.only(bottom: 10),
                    //   height: 60,
                    //   width: 60,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black26,
                    //     shape: BoxShape.circle,
                    //   ),
                    // ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.firstnameHolder} ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .3,
                            fontSize: 15,
                          ),
                        ),
                        Text("${widget.lastnameHolder}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .3,
                              fontSize: 15,
                            )),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${widget.emailHolder}",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      height: 1,
                      width: 175,
                      color: Colors.black54,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
              ),
              // ListTile(
              //   leading: Icon(Icons.star),
              //   title: Align(
              //     child: Text(
              //       'Saved Blogs',
              //       // textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontWeight: FontWeight.w600,
              //         color: Colors.grey[700],
              //         letterSpacing: .3,
              //         fontSize: 15,
              //       ),
              //     ),
              //     alignment: Alignment(-1.2, 0),
              //   ),
              //   onTap: () {
              //     // Update the state of the app.
              //     // ...
              //   },
              // ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.black54,
                ),
                title: Align(
                  child: Text(
                    'My Profile',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                      letterSpacing: .3,
                      fontSize: 15,
                    ),
                  ),
                  alignment: Alignment(-1.2, 0),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(
                        firstnameHolder: "${widget.firstnameHolder}",
                        lastnameHolder: "${widget.lastnameHolder}",
                        emailHolder: "${widget.emailHolder}",
                        phoneHolder: "${widget.phoneHolder}",
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black54,
                ),
                title: Align(
                  child: Text(
                    'Logout',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                      letterSpacing: .3,
                      fontSize: 15,
                    ),
                  ),
                  alignment: Alignment(-1.2, 0),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      /// Categories
                      // Container(
                      //   padding: EdgeInsets.only(
                      //     left: 5,
                      //     right: 5,
                      //   ),
                      //   height: 50,
                      //   child: ListView.builder(
                      //     itemCount: categories.length,
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (context, index) {
                      //       return CategoryTile(
                      //         categoryName: categories[index].categoryName,
                      //         imageUrl: categories[index].imageUrl,
                      //         onTap: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => CategoryNews(
                      //                 category: categories[index]
                      //                     .categoryName
                      //                     .toString()
                      //                     .toLowerCase(),
                      //               ),
                      //             ),
                      //           );
                      //         },
                      //       );
                      //     },
                      //   ),
                      // ),

                      /// Blog
                      Container(
                        padding: EdgeInsets.only(
                          top: 12,
                        ),
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Article(
                                      blogUrl: articles[index].url,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
