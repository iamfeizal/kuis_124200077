import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis_124200077/groceries.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailGroceries extends StatefulWidget {
  final int grocIdx;

  const DetailGroceries({Key? key, required this.grocIdx}) : super(key: key);

  @override
  State<DetailGroceries> createState() => _DetailGroceriesState();
}

class _DetailGroceriesState extends State<DetailGroceries> {
  @override
  bool toggle = false;

  late final _ratingController;
  late double _rating;

  double _initialRating = 0;
  bool _isVertical = false;

  Widget build(BuildContext context) {
    final Groceries item_groc = groceryList[widget.grocIdx];
    double a = double.parse(item_groc.reviewAverage);
    _initialRating = a;
    return Scaffold(
      appBar: AppBar(
        title: Text(item_groc.name),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              icon: toggle
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_border),
              onPressed: () {
                setState(() {
                  toggle = !toggle;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () async {
                  if (!await launch(item_groc.productUrl))
                    throw 'Could not launch ${item_groc.productUrl}';
                }),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height) / 3,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: item_groc.productImageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      item_groc.productImageUrls[index],
                      width: 200,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            child: Card(
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.lightGreen,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    item_groc.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Diskon : ${item_groc.discount}",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item_groc.storeName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rp. ${item_groc.price}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Stok : ${item_groc.stock}",
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RatingBar.builder(
                    initialRating: _initialRating,
                    direction: _isVertical ? Axis.vertical : Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.red,
                          );
                        case 1:
                          return Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.redAccent,
                          );
                        case 2:
                          return Icon(
                            Icons.sentiment_neutral,
                            color: Colors.amber,
                          );
                        case 3:
                          return Icon(
                            Icons.sentiment_satisfied,
                            color: Colors.lightGreen,
                          );
                        case 4:
                          return Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.green,
                          );
                        default:
                          return Container();
                      }
                    },
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                    updateOnDrag: true,
                  ),
                  Text(
                    " Average : ${item_groc.reviewAverage}",
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(
                      item_groc.description,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
