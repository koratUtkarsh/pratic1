import 'package:flutter/material.dart';
import 'package:pratic1/Modal.dart';

class PAGE extends StatefulWidget {
  const PAGE({Key? key}) : super(key: key);

  @override
  State<PAGE> createState() => _PAGEState();
}

class _PAGEState extends State<PAGE> {
  @override
  final GlobalKey globalKey = GlobalKey();
  Widget build(BuildContext context) {
    List<modal> m1 = ModalRoute.of(context)!.settings.arguments as List<modal>;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shop Bill's list"),
          centerTitle: true,
        ),
        body: RepaintBoundary(
          key: globalKey,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("SHOP RECEIPT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: 2),)),
                SizedBox(height: 30,),
                Text("TABLE NO : 543"),
                Text("RECEIPT : A123\456789"),
                Text("CASHIER : SUPERVISOR"),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 30,
                      child: Text("QTY",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      height: 20,
                      width: 90,
                      child: Text("DESCRIPTION",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      child: Text("PRICE",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      height: 20,
                      width: 50,
                      child: Text("TOTEL",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),

                Expanded(
                  child: ListView.builder(
                  itemCount: m1.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 20,
                              width: 40,
                              child: Text("${m1[index].bio}",),
                            ),
                            Container(
                              height: 20,
                              width: 90,
                              child: Text("${m1[index].name}",),
                            ),
                            Container(
                              height: 20,
                              width: 50,
                              child: Text("${m1[index].id}",),
                            ),
                            Container(
                              height: 20,
                              width: 50,
                              child: Text("555",),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
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
