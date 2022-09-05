import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:limitation_of_succession/Controller/Limitaion.dart';
import 'package:limitation_of_succession/Pages/Second_Page.dart';
import 'package:limitation_of_succession/Pages/Third_Page.dart';
import 'package:limitation_of_succession/Shared/Label_Style.dart';
import 'package:limitation_of_succession/api/DAL.dart';

class First_Page extends StatefulWidget {
  @override
  State<First_Page> createState() => _First_PageState();
}

class _First_PageState extends State<First_Page> {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    double sz = screensize.height / 4;
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.blue[500],
      minimumSize: Size(screensize.width, 36),
      padding: EdgeInsets.symmetric(horizontal: 4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appLogo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, sz, 30, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                  textAlign: TextAlign.right,
                  style: labeltext,
                  controller: IDnumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                  ],
                  decoration: InputDecoration(
                    hintText: "الرقم الوطني",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: labeltext,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () async {
                    if (IDnumber.text.length == 11) {
                      getdata instance = getdata(IDnumber.text);
                      await instance.getd();
                      if (instance.money != 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Third_Page(instance.heir0,
                                    instance.money, instance.IdNum)));
                      } else {
                        Widget okButton = TextButton(
                          child: Text("Cansle"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        );

                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: Text("Attention"),
                          content: Text("There is no data to this id number"),
                          actions: [
                            okButton,
                          ],
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext) {
                              return alert;
                            });
                      }
                    }else if (IDnumber.text.isEmpty){
                      Widget okButton = TextButton(
                        child: Text("Cansle"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: Text("Attention"),
                        content: Text("National Number mustn't be empty"),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext) {
                            return alert;
                          });
                    } else {
                      Widget okButton = TextButton(
                        child: Text("Cansle"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: Text("Attention"),
                        content: Text("National Number must be 11 number"),
                        actions: [
                          okButton,
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext) {
                            return alert;
                          });
                    }
                    IDnumber.clear();
                  },
                  child: Text(
                    'بحث',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Second_Page()));
                  },
                  child: Text(
                    'حصر الإرث',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
