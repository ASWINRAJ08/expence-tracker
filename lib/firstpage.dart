import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'home.dart';
import 'list.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  var fkey = GlobalKey<FormState>();
  TextEditingController purp= TextEditingController();
  TextEditingController price = TextEditingController();
  Color a=Colors.indigo;
  Color b=Colors.indigo;
  int count = 0;
  void press(){
    setState(() {
      if(count==1)
      {
        b=Colors.red;
        a=Colors.indigo;
      }
      else if(count==2){
        a=Colors.green;
        b=Colors.indigo;
      }
      else
      {
        count=0;
        b=Colors.indigo;
        a=Colors.indigo;
      }
    });

  }
 Future<dynamic> saveData() async {
    await Con();
    Con.det.add({'price' : price.text,'purpose' : purp.text});
    print(Con.det);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: fkey,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100,right: 100,left: 100),
                  child: TextFormField(
                    controller: price,
                    validator: (a){
                      if(a!.isEmpty){
                        return 'enter the amount ₹';
                      }
                    },
                    decoration: InputDecoration(labelText: 'Enter the Amount ₹',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),),
                ),
                Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: InkWell(onTap: (){
                            count=2;
                            press();
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
                            count=1;
                            press();
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60,right: 60,),
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
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(mainAxisAlignment: MainAxisAlignment.end,
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
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
