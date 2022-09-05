import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:limitation_of_succession/Model/heirs.dart';
import 'package:http/http.dart' as http;
import 'package:limitation_of_succession/Pages/First_Page.dart';

import 'package:limitation_of_succession/Pages/Third_Page.dart';
class getdata{
  String IdNum = '';
  double money = 0;
  getdata(this.IdNum);
  List<heirs> heir0 = [];
  Future<void> getd () async {
    final response = await http.get(Uri.parse(
            'http://mohammadkhappaze-001-site1.itempurl.com/api/Heirs/GetAsync/$IdNum'));
    Map data = jsonDecode(response.body);
          List<heirs> heir = [];
          heir.add(heirs(data["is_there_husband"], "الزوج",
              data["husband_part0"], data["husband_part0"]));
          heir.add(heirs(data["is_there_wife"], "الزوجة", data["wife_part0"],
              data["wife_part0"] / data["wives_nums"]));
          heir.add(heirs(data["is_there_sons"], "أولاد", data["sons_part0"],
              data["sons_part0"] / data["sons_nums"]));
          heir.add(heirs(data["is_there_girls"], "بنات", data["girls_part0"],
              data["girls_part0"] / data["girls_nums"]));
          heir.add(heirs(data["is_there_father"], "أب", data["father_part0"],
              data["father_part0"]));
          heir.add(heirs(data["is_there_mother"], "أم", data["mother_part0"],
              data["mother_part0"]));
          heir.add(heirs(
              data["is_there_brothers"],
              "أشقاء",
              data["brothers_part0"],
              data["brothers_part0"] / data["brothers_nums"]));
          heir.add(heirs(
              data["is_there_sisters"],
              "شقيقات",
              data["sisters_part0"],
              data["sisters_part0"] / data["sisters_nums"]));
          heir.add(heirs(
              data["is_there_m_stepbrothers"],
              "أخوة لأم",
              data["m_stepbrothers_part0"],
              data["m_stepbrothers_part0"] / data["m_stepbrothers_nums"]));
          heir.add(heirs(
              data["is_there_f_stepbrothers"],
              "أخوة لأب",
              data["f_stepbrothers_part0"],
              data["f_stepbrothers_part0"] / data["f_stepbrothers_nums"]));
          heir.add(heirs(
              data["is_there_f_stepsisters"],
              "خوات لأب",
              data["f_stepsisters_part0"],
              data["f_stepsisters_part0"] / data["f_stepsisters_nums"]));
          heir.add(heirs(
              data["is_there_bro_sons"],
              "أبناء الأخوة",
              data["bro_sons_part0"],
              data["bro_sons_part0"] / data["bro_sons_nums"]));
          heir.add(heirs(data["is_there_uncles"], "أعمام", data["uncles_part0"],
              data["uncles_part0"] / data["uncles_nums"]));
          money = data["money"];
          heir0 = heir;
  }
}