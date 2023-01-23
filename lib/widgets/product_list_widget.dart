import 'package:ecommer_ui/models/product_list_model.dart';
import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:ecommer_ui/widgets/detailsPage.dart';

class ProductListWidget extends StatefulWidget {
  ProductListWidget(
      {super.key, required this.loggedIn, required this.product_list});
  final bool loggedIn;
  List<ProductList> product_list;

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 45.0),
      child: Container(
        height: MediaQuery.of(context).size.height - 300.0,
        child: ListView(
          children: [
            for (var product in widget.product_list)
              _buildFoodItem(
                  widget.loggedIn,
                  product.imagePath,
                  product.name,
                  product.price.toString(),
                  product.weight,
                  product.calories,
                  product.vitamins,
                  product.avail),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItem(
      bool loggedIn,
      String imgPath,
      String foodName,
      String price,
      List<dynamic> weight,
      List<dynamic> calories,
      List<dynamic> vitamins,
      List<dynamic> avail) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                    loggedIn: loggedIn,
                    heroTag: imgPath,
                    foodName: foodName,
                    foodPrice: price,
                    weight: weight,
                    calories: calories,
                    vitamins: vitamins,
                    avail: avail)));
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Hero(
                        tag: imgPath,
                        child: Image(
                          image: FirebaseImageProvider(
                            FirebaseUrl(imgPath),
                            options: const CacheOptions(
                              source: Source.server,
                            ),
                          ),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodName,
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$$price',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {},
                )
              ]),
        ));
  }
}
