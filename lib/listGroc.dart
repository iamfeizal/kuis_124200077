import 'package:flutter/material.dart';
import 'package:kuis_124200077/groceries.dart';
import 'package:kuis_124200077/detailGroc.dart';

class ListGroceries extends StatelessWidget {
  const ListGroceries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KUIS"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final Groceries item_groc = groceryList[index];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailGroceries(grocIdx: index);
                    }));
                  },
                  child: Card(
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            item_groc.productImageUrls[0],
                            width: 100,
                          ),
                          SizedBox(
                            width: 280,
                            child: Text(
                              item_groc.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: groceryList.length,
        ),
      ),
    );
  }
}
