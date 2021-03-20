import 'package:findertask/login.dart';
import 'package:findertask/signin.dart';
import 'package:flutter/material.dart';
import 'package:findertask/constantcolors.dart';
import 'package:flutter/rendering.dart';
import 'package:findertask/models/resultemodel.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Favourit extends StatefulWidget {
  @override
  _FavouritState createState() => _FavouritState();
  Favourit({Key key}) : super(key: key);
}

class _FavouritState extends State<Favourit> {
  Future<ResultModel> cardResult;

  @override
  void initState() {
    super.initState();
    cardResult = fetchcard();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Container(
                    width: 35,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp),
                      color: Colors.black,
                      iconSize: 18,
                      alignment: Alignment.topLeft,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sign_in()));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Favourits",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: cardResult,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data.status.code == 200) {
                  print(snapshot.data);
                  return Container(
                    width: 350,
                    height: 700,
                    color: kmaincolor,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: ListView.builder(
                          itemCount: snapshot.data.results.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var result = snapshot.data.results[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: Column(
                                  // ignore: missing_return
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 324,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            //   color: Colors.grey,
                                            ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 140,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12))),
                                            child: Image.network(
                                              result.mainPhoto,
                                              fit: BoxFit.fitWidth,
                                              cacheHeight: 130,
                                              cacheWidth: 120,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    AutoSizeText(
                                                        result.category,

                                                        textAlign: TextAlign.justify,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        minFontSize: 8,
                                                        maxFontSize: 12,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),

                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  '| 27Yrs',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Container(
                                                  width: 70,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                    color: Colors.greenAccent,

                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Text(
                                                    result.type,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 10,

                                                  color: Colors.green,

                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Image(
                                                        image: AssetImage(
                                                            'images/runner.png')),
                                                    SizedBox(
                                                      width: 7,
                                                    ),
                                                    Text(
                                                      result.distance,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            size: 17,
                                                            color: Colors.grey,
                                                          ),
                                                          Text(
                                                            'CA/EG',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text(
                                                        '28 dec 2020',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                } else {
                  return Container(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      backgroundColor: kmaincolor,

                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
