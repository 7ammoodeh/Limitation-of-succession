import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:limitation_of_succession/Controller/Limitaion.dart';
import 'package:limitation_of_succession/Controller/opreation.dart';
import 'package:limitation_of_succession/Model/heirs.dart';
import 'package:limitation_of_succession/Pages/First_Page.dart';
import 'package:limitation_of_succession/Pages/Third_Page.dart';
import 'package:limitation_of_succession/Shared/Label_Style.dart';

class Second_Page extends StatefulWidget {
  @override
  State<Second_Page> createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {
  bool husband = false;
  bool husbande = true;
  bool wife = false;
  bool wifee = true;
  bool sons = false;
  bool girls = false;
  bool father = false;
  bool mother = false;
  bool brothers = false;
  bool brotherse = true;
  bool sisters = false;
  bool sisterse = true;
  bool m_stepbrothers = false;
  bool m_stepbrotherse = true;
  bool f_stepbrothers = false;
  bool f_stepbrotherse = true;
  bool f_stepsisters = false;
  bool f_stepsisterse = true;
  bool bro_sons = false;
  bool bro_sonse = true;
  bool uncles = false;
  bool unclese = true;
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    double sz = screensize.height / 4;
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.blue[500],
      minimumSize: Size(screensize.width / 2, 30),
      padding: EdgeInsets.symmetric(horizontal: 4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    if (husband) {
      wifee = false;
    } else {
      wifee = true;
    }
    if (wife) {
      husbande = false;
    } else {
      husbande = true;
    }
    if (sons || girls) {
      brotherse = false;
      sisterse = false;
    } else {
      brotherse = true;
      sisterse = true;
    }
    if (sons || father) {
      f_stepbrotherse = false;
      f_stepsisterse = false;
      bro_sonse = false;
      unclese = false;
      if (!girls) {
        m_stepbrotherse = false;
      }
    } else {
      if (!girls) {
        m_stepbrotherse = true;
      }
      f_stepbrotherse = true;
      f_stepsisterse = true;
      bro_sonse = true;
      unclese = true;
    }
    if (girls && !sons) {
      m_stepbrotherse = false;
    } else {
      if (!sons) {
        m_stepbrotherse = true;
      }
    }
    if (brothers || (girls && sisters)) {
      f_stepbrotherse = false;
      f_stepsisterse = false;
      bro_sonse = false;
      unclese = false;
    } else if (!sons && !father) {
      f_stepbrotherse = true;
      f_stepsisterse = true;
      bro_sonse = true;
      unclese = true;
    }
    if (f_stepbrothers) {
      bro_sonse = false;
      unclese = false;
    } else if (!sons && !father && !brothers && (!girls && !sisters)) {
      bro_sonse = true;
      unclese = true;
    }
    if (bro_sons) {
      unclese = false;
    } else if (!sons &&
        !father &&
        !brothers &&
        (!girls && !sisters) &&
        !f_stepbrothers) {
      unclese = true;
    }
    List<double> family = [];
    List<String> familynum = [];
    if (husband && husbande) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (wife && wifee) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (sons) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (girls) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (father) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (mother) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (brothers && brotherse) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (sisters && sisterse) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (m_stepbrothers && m_stepbrotherse) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (f_stepbrothers && f_stepbrotherse) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (f_stepsisters && f_stepsisterse) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (bro_sons && bro_sonse) {
      family.add(1);
    } else {
      family.add(0);
    }
    if (uncles && unclese) {
      family.add(1);
    } else {
      family.add(0);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appLogo,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Center(
            child: Column(children: <Widget>[
              TextFormField(
                textAlign: TextAlign.right,
                style: labeltext,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                ],
                controller: ID_number,
                decoration: InputDecoration(
                  hintText: "الرقم الوطني",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintStyle: labeltext,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                style: labeltext,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                ],
                controller: money,
                decoration: InputDecoration(
                  hintText: "المال",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintStyle: labeltext,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DataTable(
                columns: [
                  DataColumn(
                      label: Text('',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('العدد',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('الورثة',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                        checkColor: Colors.white,
                        value: husband,
                        onChanged: husbande
                            ? (bool? value) {
                                setState(() {
                                  husband = value!;
                                });
                              }
                            : null,
                      ),
                    ),
                    DataCell(Text('')),
                    DataCell(Text(
                      'زوج',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                        checkColor: Colors.white,
                        value: wife,
                        onChanged: wifee
                            ? (bool? value) {
                                setState(() {
                                  wife = value!;
                                });
                              }
                            : null,
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        enabled: wifee,
                        controller: wife_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'زوجة',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                          checkColor: Colors.white,
                          value: sons,
                          onChanged: (bool? value) {
                            setState(() {
                              sons = value!;
                            });
                          }),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        controller: sons_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'أولاد',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                          checkColor: Colors.white,
                          value: girls,
                          onChanged: (bool? value) {
                            setState(() {
                              girls = value!;
                            });
                          }),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        controller: girls_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'بنات',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                          checkColor: Colors.white,
                          value: father,
                          onChanged: (bool? value) {
                            setState(() {
                              father = value!;
                            });
                          }),
                    ),
                    DataCell(Text('')),
                    DataCell(Text(
                      'أب',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                          checkColor: Colors.white,
                          value: mother,
                          onChanged: (bool? value) {
                            setState(() {
                              mother = value!;
                            });
                          }),
                    ),
                    DataCell(Text('')),
                    DataCell(Text(
                      'أم',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                        checkColor: Colors.white,
                        value: brothers,
                        onChanged: brotherse
                            ? (bool? value) {
                                setState(() {
                                  brothers = value!;
                                });
                              }
                            : null,
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        enabled: brotherse,
                        controller: bro_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'أشقاء',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                        checkColor: Colors.white,
                        value: sisters,
                        onChanged: sisterse
                            ? (bool? value) {
                                setState(() {
                                  sisters = value!;
                                });
                              }
                            : null,
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        enabled: sisterse,
                        controller: sis_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'شقيقات',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                        checkColor: Colors.white,
                        value: m_stepbrothers,
                        onChanged: m_stepbrotherse
                            ? (bool? value) {
                                setState(() {
                                  m_stepbrothers = value!;
                                });
                              }
                            : null,
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        enabled: m_stepbrotherse,
                        controller: m_stepbro_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'أخوة لأم',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                        checkColor: Colors.white,
                        value: f_stepbrothers,
                        onChanged: f_stepbrotherse
                            ? (bool? value) {
                                setState(() {
                                  f_stepbrothers = value!;
                                });
                              }
                            : null,
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        enabled: f_stepbrotherse,
                        controller: f_stepbro_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'أخوة لأب',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                        checkColor: Colors.white,
                        value: f_stepsisters,
                        onChanged: f_stepsisterse
                            ? (bool? value) {
                                setState(() {
                                  f_stepsisters = value!;
                                });
                              }
                            : null,
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        enabled: f_stepsisterse,
                        controller: f_stepsis_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'خوات لأب',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                        checkColor: Colors.white,
                        value: bro_sons,
                        onChanged: bro_sonse
                            ? (bool? value) {
                                setState(() {
                                  bro_sons = value!;
                                });
                              }
                            : null,
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        enabled: bro_sonse,
                        controller: bro_sons_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'أبناء أخ',
                      style: texttable,
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Checkbox(
                        checkColor: Colors.white,
                        value: uncles,
                        onChanged: unclese
                            ? (bool? value) {
                                setState(() {
                                  uncles = value!;
                                });
                              }
                            : null,
                      ),
                    ),
                    DataCell(
                      TextFormField(
                        textAlign: TextAlign.right,
                        style: labeltext,
                        enabled: unclese,
                        controller: uncles_num,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(r'[-.]')),
                        ],
                        decoration: InputDecoration(
                          hintText: "العدد",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintStyle: numltext,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      'أعمام',
                      style: texttable,
                    )),
                  ]),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () async {
                  if (ID_number.text.length == 11 && money.text.isNotEmpty) {
                    if (ID_number.text.isNotEmpty) {
                      familynum.add(ID_number.text);
                    } else {
                      familynum.add('0');
                    }
                    if (money.text.isNotEmpty) {
                      familynum.add(money.text);
                    } else {
                      familynum.add('0');
                    }
                    if (wife_num.text.isNotEmpty) {
                      familynum.add(wife_num.text);
                    } else {
                      familynum.add('0');
                    }
                    if (sons_num.text.isNotEmpty) {
                      familynum.add(sons_num.text);
                    } else {
                      familynum.add('0');
                    }
                    if (girls_num.text.isNotEmpty) {
                      familynum.add(girls_num.text);
                    } else {
                      familynum.add('0');
                    }
                    if (bro_num.text.isNotEmpty) {
                      familynum.add(bro_num.text);
                    } else {
                      familynum.add('0');
                    }
                    if (sis_num.text.isNotEmpty) {
                      familynum.add(sis_num.text);
                    } else {
                      familynum.add('0');
                    }
                    if (m_stepbro_num.text.isNotEmpty) {
                      familynum.add(m_stepbro_num.text);
                    } else {
                      familynum.add('0');
                    }
                    if (f_stepbro_num.text.isNotEmpty) {
                      familynum.add(f_stepbro_num.text);
                    } else {
                      familynum.add('0');
                    }
                    if (f_stepsis_num.text.isNotEmpty) {
                      familynum.add(f_stepsis_num.text);
                    } else {
                      familynum.add('0');
                    }
                    if (bro_sons_num.text.isNotEmpty) {
                      familynum.add(bro_sons_num.text);
                    } else {
                      familynum.add('0');
                    }
                    if (uncles_num.text.isNotEmpty) {
                      familynum.add(uncles_num.text);
                    } else {
                      familynum.add('0');
                    }
                    opration instance = opration(family, familynum);
                    await instance.senddata();
                    if (instance.res == "Data has been uploaded") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Third_Page(instance.heir0,
                                  instance.money, instance.national_number)));
                    }else if(ID_number.text.isEmpty || money.text.isEmpty){
                      Widget okButton = TextButton(
                        child: Text("Cansle"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: Text("Attention"),
                        content: Text("National Number or money mustn't be empty"),
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
                      Widget okButton1 = TextButton(
                        child: Text("Cansle"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );

                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: Text("Attention"),
                        content: Text("This National Number is exist"),
                        actions: [
                          okButton1,
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext) {
                            return alert;
                          });
                    }
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
                  husband = false;
                  wife = false;
                  sons = false;
                  girls = false;
                  father = false;
                  mother = false;
                  brothers = false;
                  sisters = false;
                  m_stepbrothers = false;
                  f_stepbrothers = false;
                  f_stepsisters = false;
                  bro_sons = false;
                  uncles = false;
                  ID_number.clear();
                  money.clear();
                  wife_num.clear();
                  sons_num.clear();
                  girls_num.clear();
                  bro_num.clear();
                  sis_num.clear();
                  m_stepbro_num.clear();
                  f_stepbro_num.clear();
                  f_stepsis_num.clear();
                  bro_sons_num.clear();
                  uncles_num.clear();
                },
                child: Text(
                  'حصر الإرث',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
