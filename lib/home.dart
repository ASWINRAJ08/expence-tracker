import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firstpage.dart';
import 'list.dart';

class Hom extends StatefulWidget {
  const Hom({Key? key}) : super(key: key);

  @override
  State<Hom> createState() => _HomState();
}

class _HomState extends State<Hom> {
  Future <dynamic> getData() async {
    await Con();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 500,
              child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (Con.det.isNotEmpty) {
                    return
                      ListView.builder(
                        itemCount: Con.det.length,
                        itemBuilder: (context, index) {
                          return
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30),
                                child: Card(
                                  child: Container(
                                    height: 100,
                                    width: 300,
                                    color: Colors.tealAccent,
                                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Text('Amount  :  ₹', style: TextStyle(
                                              fontWeight: FontWeight.bold,)),
                                            Text(Con.det[index]['price'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 60,
                                            ),
                                            Text('Purpose  :  ', style: TextStyle(
                                              fontWeight: FontWeight.bold,)),
                                            Text(Con.det[index]['purpose'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      );

                  }
                else {
                  return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Text('Add Data',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold),),
                      ));
                }
              }
              ),
            ),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: FloatingActionButton(
                        child: Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Add();
                          },));
                        },),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
