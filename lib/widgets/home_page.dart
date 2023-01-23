import 'package:ecommer_ui/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommer_ui/widgets/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommer_ui/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                  width: 220.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => AuthFunc(
                            loggedIn: appState.loggedIn,
                            signOut: () {
                              FirebaseAuth.instance.signOut();
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: Consumer<ApplicationState>(
                builder: (context, appState, _) => ListView(
                  primary: false,
                  padding: EdgeInsets.only(left: 25.0, right: 20.0),
                  children: <Widget>[
                    ProductListWidget(
                        loggedIn: appState.loggedIn,
                        product_list: appState.productList)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
