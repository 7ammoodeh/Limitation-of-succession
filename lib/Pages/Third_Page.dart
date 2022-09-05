import 'package:flutter/material.dart';
import 'package:limitation_of_succession/Model/heirs.dart';
import 'package:limitation_of_succession/Pages/Second_Page.dart';
import 'package:limitation_of_succession/Shared/Label_Style.dart';

class Third_Page extends StatelessWidget {
  List<heirs> heir0 = [];
  double money = 0;
  String national_number = "";
  Third_Page(this.heir0, this.money, this.national_number);
  @override
  Widget build(BuildContext context) {
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
        physics: ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                DataTable(columns: [
                  DataColumn(
                      label: Text('المال',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('الرقم الوطني',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text('$money',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                    DataCell(Text('$national_number',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                  ]),
                ]),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    if (heir0[index].existing != 0) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                (':الوريث'),
                                style: labeltext,
                              ),
                              Text(
                                (heir0[index].heir.toString()),
                                style: labeltext,
                              ),
                              Text(
                                (':الحصة لكل فرد'),
                                style: labeltext,
                              ),
                              Text(
                                (heir0[index].part1.toString()),
                                style: labeltext,
                              ),
                              Text(
                                (':الحصة الكلية'),
                                style: labeltext,
                              ),
                              Text(
                                (heir0[index].part.toString()),
                                style: labeltext,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Text('');
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
