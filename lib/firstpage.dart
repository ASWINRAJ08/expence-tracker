import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'home.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  var fkey = GlobalKey<FormState>();
  TextEditingController purp = TextEditingController();
  TextEditingController price = TextEditingController();
  Color a=Colors.indigo;
  Color b=Colors.indigo;
  bool x=false;
  bool y=false;
  saveData() async {
    SharedPreferences spname = await SharedPreferences.getInstance();
    spname.setString('amount', price.text);
    spname.setString('purpose', purp.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: fkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150,right: 50,left: 50),
                  child: TextFormField(
                    controller: price,
                    validator: (a){
                      if(a!.isEmpty){
                        return 'enter the amount';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Enter the Amount',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(onTap: (){
                        x=true;
                        if(x==true) {
                          setState((){
                            a=Colors.green;
                          });

                        }
                      },
                        child: Container(
                          decoration:  BoxDecoration(
                              color: a,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text('CREDIT',style: TextStyle(color: Colors.white),)),
                          height: 50,
                        width: 100,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: InkWell(onTap: (){
                        y=true;
                        if(y==true){
                          setState((){
                            b=Colors.red;
                          });
                        }
                      },
                        child: Container(
                          decoration: BoxDecoration(
                              color: b,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(child: Text('DEBIT',style: TextStyle(color: Colors.white),)),
                          height: 50,
                          width: 100,),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    controller: purp,
                    validator: (b){
                      if(b!.isEmpty){
                        return 'Enter the Purpose';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Purpose',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0))),),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40),
                          child: FloatingActionButton(
                              child: Icon(Icons.done_outline_outlined),
                              onPressed: () async {
                                await saveData();
                                if(fkey.currentState!.validate()){
                                  Fluttertoast.showToast(msg: 'Success');
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return Hom();
                                  },));
                                }
                              }),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
