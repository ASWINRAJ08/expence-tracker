import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firstpage.dart';

class Hom extends StatefulWidget {
  const Hom({Key? key}) : super(key: key);

  @override
  State<Hom> createState() => _HomState();
}

class _HomState extends State<Hom> {
  TextEditingController price=TextEditingController();
  TextEditingController purpo=TextEditingController();
  var amount;
  var purpose;
  Future<void> getData()async {
    SharedPreferences spname = await SharedPreferences.getInstance();
    amount = spname.getString('amount');
    purpose = spname.getString('purpose');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Text('$amount'),
                      Text('$purpose'),
                    ],
                  );
              },),
            ),

            Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
          ],
        ),
      ),
    );
  }
}
