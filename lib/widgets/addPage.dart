import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Add Product',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                  top: 30.0,
                  left: (MediaQuery.of(context).size.width / 2) - 100.0,
                  child: Hero(
                      tag: '',
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/plate1.png'),
                              fit: BoxFit.cover
                              // image: FirebaseImageProvider(
                              //   FirebaseUrl(widget.heroTag),
                              // ),
                              // fit: BoxFit.cover
                              ),
                        ),
                        height: 200.0,
                        width: 200.0,
                      ))),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child:
                    // Consumer<SellState>(
                    //   builder: (context, appState, _) =>
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'TEST',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'TEST',
                          style: TextStyle(fontSize: 20.0, color: Colors.grey),
                        ),
                        // Container(
                        //   height: 25.0,
                        //   width: 1.0,
                        //   color: Colors.grey,
                        // ),
                        // Container(
                        //   width: 125.0,
                        //   height: 40.0,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(17.0),
                        //       color: Color(0xFF7A9BEE)),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: <Widget>[
                        //       InkWell(
                        //         onTap: () {
                        //           appState.decrement();
                        //         },
                        //         child: Container(
                        //           height: 25.0,
                        //           width: 25.0,
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(7.0),
                        //               color: Color(0xFF7A9BEE)),
                        //           child: Center(
                        //             child: Icon(
                        //               Icons.remove,
                        //               color: Colors.white,
                        //               size: 20.0,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       Text(
                        //         appState.counter.toString(),
                        //         style: TextStyle(
                        //             color: Colors.white, fontSize: 15.0),
                        //       ),
                        //       InkWell(
                        //         onTap: () {
                        //           appState.increment();
                        //         },
                        //         child: Container(
                        //           height: 25.0,
                        //           width: 25.0,
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(7.0),
                        //               color: Colors.white),
                        //           child: Center(
                        //             child: Icon(
                        //               Icons.add,
                        //               color: Color(0xFF7A9BEE),
                        //               size: 20.0,
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //       //)
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _builkdInfoCard('WEIGHT', '219', 'G'),
                          SizedBox(
                            width: 10.0,
                          ),
                          _builkdInfoCard('CALORIES', '190', 'CAL'),
                          SizedBox(
                            width: 10.0,
                          ),
                          _builkdInfoCard('VITAMINS', 'A2,A6', 'VIT'),
                          SizedBox(
                            width: 10.0,
                          ),
                          _builkdInfoCard('AVAIL', '10', 'AV'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Container()
                        // HorizontalSlidableButton(
                        //   width: MediaQuery.of(context).size.width,
                        //   buttonWidth: 60.0,
                        //   color: Theme.of(context).colorScheme.secondary,
                        //   dismissible: true,
                        //   isRestart: true,
                        //   label: Center(
                        //     child: const Text(
                        //       '>>>',
                        //       style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 20,
                        //           color: Colors.white),
                        //     ),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       children: [
                        //         Text('\$${appState.total.toString()}')
                        //       ],
                        //     ),
                        //   ),
                        //   onChanged: (position) {
                        //     setState(() {
                        //       if (position == SlidableButtonPosition.end) {
                        //         addSell(
                        //             widget.foodName,
                        //             widget.foodPrice,
                        //             appState.counter.toString(),
                        //             appState.total.toString());
                        //       }
                        //     });
                        //   },
                        // )
                        )
                  ],
                ),
                // )
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _builkdInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
      onTap: () {
        //selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color:
              //cardTitle == selectedCard ?
              Color(0xFF7A9BEE),
          //:
          //Colors.white,
          border: Border.all(
              color:
                  // cardTitle == selectedCard
                  //     ? Colors.transparent
                  //     :
                  Colors.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 0.75),
        ),
        height: 100.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15.0),
              child: Text(
                cardTitle,
                style: TextStyle(
                    fontSize: 15.0,
                    color: cardTitle == 'WEIGHT' ? Colors.white : Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    info,
                    style: TextStyle(
                        fontSize: 22.0,
                        color: cardTitle == 'WEIGHT'
                            ? Colors.white
                            : Colors.black),
                  ),
                  Text(
                    unit,
                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // selectCard(cardTitle) {
  //   setState(() {
  //     selectedCard = cardTitle;
  //   });
  //}
}
