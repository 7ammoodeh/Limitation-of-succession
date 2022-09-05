import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:limitation_of_succession/Model/heirs.dart';
import 'package:limitation_of_succession/Pages/Second_Page.dart';
import 'package:limitation_of_succession/Pages/Third_Page.dart';
import 'package:http/http.dart' as http;

class opration {
  List<double> family1 = [];
  List<String> familynum1 = [];
  opration(this.family1, this.familynum1);
  double money = 0;
  String national_number = '';
  double is_there_sons = 0, sons_nums = 0, sons_part0 = 0;
  double is_there_girls = 0,
      girls_part_2 = 12,
      girls_part_3 = 16,
      girls_nums = 0,
      girls_part0 = 0;
  double is_there_father = 0, father_part = 4, father_part0 = 0;
  double is_there_mother = 0,
      mother_part_1 = 4,
      mother_part_2 = 8,
      mother_part0 = 0;
  double is_there_husband = 0,
      husband_part_1 = 6,
      husband_part_2 = 12,
      husband_part0 = 0;
  double is_there_wife = 0,
      wife_part_1 = 3,
      wife_part_2 = 6,
      wives_nums = 0,
      wife_part0 = 0;
  double is_there_brothers = 0, brothers_nums = 0, brothers_part0 = 0;
  double is_there_sisters = 0,
      sisters_part_2 = 12,
      sisters_part_3 = 16,
      sisters_nums = 0,
      sisters_part0 = 0;
  double is_there_bro_sons = 0, bro_sons_nums = 0, bro_sons_part0 = 0;
  double is_there_m_stepbrothers = 0,
      m_stepbrothers_nums = 0,
      m_stepbrothers_part1 = 4,
      m_stepbrothers_part2 = 8,
      m_stepbrothers_part0 = 0;
  double is_there_uncles = 0, uncles_nums = 0, uncles_part0 = 0;
  double is_there_f_stepbrothers = 0,
      f_stepbrothers_nums = 0,
      f_stepbrothers_part0 = 0;
  double is_there_f_stepsisters = 0,
      f_stepsisters_nums = 0,
      f_stepsisters_part0 = 0;
  List<heirs> heir0 = [];
  double div = 24;
  double div1 = 0;
  double x = 0;
  dynamic res;
  dynamic senddata() async {
    national_number = familynum1[0];
    money = double.parse(familynum1[1]);
    is_there_husband = family1[0];
    is_there_wife = family1[1];
    is_there_sons = family1[2];
    is_there_girls = family1[3];
    is_there_father = family1[4];
    is_there_mother = family1[5];
    is_there_brothers = family1[6];
    is_there_sisters = family1[7];
    is_there_m_stepbrothers = family1[8];
    is_there_f_stepbrothers = family1[9];
    is_there_f_stepsisters = family1[10];
    is_there_bro_sons = family1[11];
    is_there_uncles = family1[12];
    wives_nums = double.parse(familynum1[2]);
    sons_nums = double.parse(familynum1[3]);
    girls_nums = double.parse(familynum1[4]);
    brothers_nums = double.parse(familynum1[5]);
    sisters_nums = double.parse(familynum1[6]);
    m_stepbrothers_nums = double.parse(familynum1[7]);
    f_stepbrothers_nums = double.parse(familynum1[8]);
    f_stepsisters_nums = double.parse(familynum1[9]);
    bro_sons_nums = double.parse(familynum1[10]);
    uncles_nums = double.parse(familynum1[11]);
    double bs = brothers_nums + sisters_nums;
    if (is_there_sons == 1 || is_there_girls == 1) {
      div1 = div1 +
          (is_there_husband * husband_part_1) +
          (is_there_wife * wife_part_1);
    } else {
      div1 = div1 +
          (is_there_husband * husband_part_2) +
          (is_there_wife * wife_part_2);
    }
    if (is_there_sons == 1 || is_there_girls == 1 || bs > 1) {
      div1 = div1 + (is_there_mother * mother_part_1);
    } else {
      div1 = div1 + (is_there_mother * mother_part_2);
    }
    if (is_there_sons == 0 && is_there_girls == 1) {
      if (girls_nums > 1) {
        div1 = div1 + girls_part_3;
      } else {
        div1 = div1 + girls_part_2;
      }
    }
    div1 = div1 + (is_there_father * father_part);
    if (is_there_sons == 0 &&
        is_there_father == 0 &&
        is_there_girls == 0 &&
        is_there_brothers == 0 &&
        is_there_sisters == 1) {
      if (sisters_nums > 1) {
        div1 = div1 + sisters_part_3;
      } else {
        div1 = div1 + sisters_part_2;
      }
    }
    if (is_there_sons == 0 &&
        is_there_father == 0 &&
        is_there_girls == 0 &&
        is_there_m_stepbrothers == 1) {
      if (m_stepbrothers_nums > 1) {
        div1 = div1 + m_stepbrothers_part2;
      } else {
        div1 = div1 + m_stepbrothers_part1;
      }
    }
    if (div1 > 24) {
      x = money / div1;
    } else {
      x = money / div;
    }
    //cout << x << endl;

    wife_part0 = (wife_part_1 * x) * is_there_wife;
    husband_part0 = is_there_husband * husband_part_1 * x;
    mother_part0 = is_there_mother * mother_part_1 * x;
    if (is_there_sons == 1) {
      father_part0 = is_there_father * father_part * x;
      double r =
          money - (wife_part0 + husband_part0 + mother_part0 + father_part0);
      double boys = sons_nums * 2;
      double child_part = r / (boys + girls_nums);

      sons_part0 = sons_nums * child_part * 2;
      girls_part0 = girls_nums * child_part;
    }
    if (is_there_sons == 0) {
      if (is_there_girls == 1) {
        if (girls_nums == 1) {
          girls_part0 = girls_part_2 * x;
        } else if (girls_nums > 1) {
          girls_part0 = girls_part_3 * x;
        }
        father_part0 = (money -
                (wife_part0 + husband_part0 + mother_part0 + girls_part0)) *
            is_there_father;
      } else {
        if (is_there_father == 1 &&
            is_there_mother == 1 &&
            (is_there_wife == 1 || is_there_husband == 1)) {
          wife_part0 = is_there_wife * wife_part_2 * x;
          husband_part0 = is_there_husband * husband_part_2 * x;
          double r1 = money - (wife_part0 + husband_part0);
          mother_part0 = r1 / 3;
          father_part0 = r1 - mother_part0;
        } else {
          wife_part0 = is_there_wife * wife_part_2 * x;
          husband_part0 = is_there_husband * husband_part_2 * x;
          double n = brothers_nums + sisters_nums;
          if (n > 1) {
            mother_part0 = is_there_mother * mother_part_1 * x;
          } else {
            mother_part0 = is_there_mother * mother_part_2 * x;
          }
          father_part0 = (money - (wife_part0 + husband_part0 + mother_part0)) *
              is_there_father;
        }
      }
      if (is_there_sons == 0 && is_there_father == 0) {
        if (is_there_girls == 0 && is_there_m_stepbrothers == 1) {
          if (m_stepbrothers_nums > 1) {
            m_stepbrothers_part0 = m_stepbrothers_part2 * x;
          } else {
            m_stepbrothers_part0 = m_stepbrothers_part1 * x;
          }
        }
        if (is_there_brothers == 1) {
          double rest =
              money - (wife_part0 + husband_part0 + mother_part0 + girls_part0);
          double broes = brothers_nums * 2;
          double money0 = rest / (broes + sisters_nums);
          brothers_part0 = money0 * broes;
          sisters_part0 = money0 * sisters_nums;
        } else {
          if (is_there_girls == 0) {
            if (is_there_sisters == 1) {
              if (is_there_sisters == 1) {
                sisters_part0 = sisters_part_2 * x;
              } else if (sisters_nums > 1) {
                sisters_part0 = sisters_part_3 * x;
              }
            }
          } else if (is_there_girls == 1 && is_there_sisters == 1) {
            double money1 = money -
                (wife_part0 + husband_part0 + mother_part0 + girls_part0);
            sisters_part0 = money1;
          }
          if (is_there_f_stepbrothers == 1 &&
              (is_there_sisters == 0 || is_there_girls == 0)) {
            double money1 = money -
                (wife_part0 +
                    husband_part0 +
                    mother_part0 +
                    girls_part0 +
                    sisters_part0);
            double f_broes = f_stepbrothers_nums * 2;
            double money0 = money1 / (f_broes + f_stepsisters_nums);
            f_stepbrothers_part0 = money0 * f_broes;
            f_stepsisters_part0 = money0 * f_stepsisters_nums;
          }
          if (is_there_bro_sons == 1 &&
              (is_there_sisters == 0 || is_there_girls == 0) &&
              is_there_f_stepbrothers == 0) {
            double money1 = money -
                (wife_part0 +
                    husband_part0 +
                    mother_part0 +
                    girls_part0 +
                    sisters_part0);
            bro_sons_part0 = money1;
          }
          if (is_there_bro_sons == 0 &&
              (is_there_sisters == 0 || is_there_girls == 0) &&
              is_there_uncles == 1) {
            double money1 = money -
                (wife_part0 +
                    husband_part0 +
                    mother_part0 +
                    girls_part0 +
                    sisters_part0);
            uncles_part0 = money1;
          }
          if (is_there_sons == 0 &&
              is_there_father == 0 &&
              is_there_brothers == 0 &&
              (is_there_sisters == 0 || is_there_girls == 0) &&
              is_there_bro_sons == 0 &&
              is_there_uncles == 0) {
            double money1 = money -
                (wife_part0 +
                    husband_part0 +
                    mother_part0 +
                    girls_part0 +
                    sisters_part0 +
                    m_stepbrothers_part0);
            if (money1 > 0) {
              double bs1 = brothers_nums + sisters_nums;
              double div2 = 0;
              if (is_there_sons == 1 || is_there_girls == 1 || bs1 > 1) {
                div2 = div2 + (is_there_mother * mother_part_1);
              } else {
                div2 = div2 + (is_there_mother * mother_part_2);
              }
              if (is_there_sons == 0 && is_there_girls == 1) {
                if (girls_nums > 1) {
                  div2 = div2 + girls_part_3;
                } else {
                  div2 = div2 + girls_part_2;
                }
              }
              if (is_there_bro_sons == 0 &&
                  is_there_father == 0 &&
                  is_there_girls == 0 &&
                  is_there_brothers == 0 &&
                  is_there_sisters == 1) {
                if (sisters_nums > 1) {
                  div2 = div2 + sisters_part_3;
                } else {
                  div2 = div2 + sisters_part_2;
                }
              }
              if (is_there_sons == 0 &&
                  is_there_father == 0 &&
                  is_there_girls == 0 &&
                  m_stepbrothers_nums == 1) {
                if (m_stepbrothers_nums > 1) {
                  div2 = div2 + m_stepbrothers_part2;
                } else {
                  div2 = div2 + m_stepbrothers_part1;
                }
              }
              double money2 = money1 / div2;
              if (is_there_sons == 1 || is_there_girls == 1 || bs1 > 1) {
                mother_part0 =
                    mother_part0 + (is_there_mother * mother_part_1 * money2);
              } else {
                mother_part0 =
                    mother_part0 + (is_there_mother * mother_part_2 * money2);
              }
              if (is_there_sons == 0 && is_there_girls == 1) {
                if (girls_nums > 1) {
                  girls_part0 = girls_part0 + (girls_part_3 * money2);
                } else {
                  girls_part0 = girls_part0 + (girls_part_2 * money2);
                }
              }
              if (is_there_sons == 0 &&
                  is_there_father == 0 &&
                  is_there_girls == 0 &&
                  is_there_brothers == 0 &&
                  is_there_sisters == 1) {
                if (sisters_nums > 1) {
                  sisters_part0 = sisters_part0 + (sisters_part_3 * money2);
                } else {
                  sisters_part0 = sisters_part0 + (sisters_part_2 * money2);
                }
              }
              if (is_there_sons == 0 &&
                  is_there_father == 0 &&
                  is_there_girls == 0 &&
                  is_there_m_stepbrothers == 1) {
                if (m_stepbrothers_nums > 1) {
                  m_stepbrothers_part0 =
                      m_stepbrothers_part0 + (m_stepbrothers_part2 * money2);
                } else {
                  m_stepbrothers_part0 =
                      m_stepbrothers_part0 + (m_stepbrothers_part1 * money2);
                }
              }
            }
          }
        }
      }
    }
    List<heirs> heir = [];
    heir.add(heirs(is_there_husband, "الزوج", husband_part0, husband_part0));
    heir.add(
        heirs(is_there_wife, "الزوجة", wife_part0, wife_part0 / wives_nums));
    heir.add(heirs(is_there_sons, "أولاد", sons_part0, sons_part0 / sons_nums));
    heir.add(
        heirs(is_there_girls, "بنات", girls_part0, girls_part0 / girls_nums));
    heir.add(heirs(is_there_father, "أب", father_part0, father_part0));
    heir.add(heirs(is_there_mother, "أم", mother_part0, mother_part0));
    heir.add(heirs(is_there_brothers, "أشقاء", brothers_part0,
        brothers_part0 / brothers_nums));
    heir.add(heirs(is_there_sisters, "شقيقات", sisters_part0,
        sisters_part0 / sisters_nums));
    heir.add(heirs(is_there_m_stepbrothers, "أخوة لأم", m_stepbrothers_part0,
        m_stepbrothers_part0 / m_stepbrothers_nums));
    heir.add(heirs(is_there_f_stepbrothers, "أخوة لأب", f_stepbrothers_part0,
        f_stepbrothers_part0 / f_stepbrothers_nums));
    heir.add(heirs(is_there_f_stepsisters, "خوات لأب", f_stepsisters_part0,
        f_stepsisters_part0 / f_stepsisters_nums));
    heir.add(heirs(is_there_bro_sons, "أبناء الأخوة", bro_sons_part0,
        bro_sons_part0 / bro_sons_nums));
    heir.add(heirs(
        is_there_uncles, "أعمام", uncles_part0, uncles_part0 / uncles_nums));
    heir0 = heir;
    try {
      final response = await http.post(
        Uri.parse('http://mohammadkhappaze-001-site1.itempurl.com/api/Heirs/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "money": money,
          "national_number": national_number,
          "is_there_sons": is_there_sons,
          "sons_nums": sons_nums,
          "sons_part0": sons_part0,
          "is_there_girls": is_there_girls,
          "girls_nums": girls_nums,
          "girls_part0": girls_part0,
          "is_there_father": is_there_father,
          "father_part0": father_part0,
          "is_there_mother": is_there_mother,
          "mother_part0": mother_part0,
          "is_there_husband": is_there_husband,
          "husband_part0": husband_part0,
          "is_there_wife": is_there_wife,
          "wives_nums": wives_nums,
          "wife_part0": wife_part0,
          "is_there_brothers": is_there_brothers,
          "brothers_nums": brothers_nums,
          "brothers_part0": brothers_part0,
          "is_there_sisters": is_there_sisters,
          "sisters_nums": sisters_nums,
          "sisters_part0": sisters_part0,
          "is_there_bro_sons": is_there_bro_sons,
          "bro_sons_nums": bro_sons_nums,
          "bro_sons_part0": bro_sons_part0,
          "is_there_m_stepbrothers": is_there_m_stepbrothers,
          "m_stepbrothers_nums": m_stepbrothers_nums,
          "m_stepbrothers_part0": m_stepbrothers_part0,
          "is_there_uncles": is_there_uncles,
          "uncles_nums": uncles_nums,
          "uncles_part0": uncles_part0,
          "is_there_f_stepbrothers": is_there_f_stepbrothers,
          "f_stepbrothers_nums": f_stepbrothers_nums,
          "f_stepbrothers_part0": f_stepbrothers_part0,
          "is_there_f_stepsisters": is_there_f_stepsisters,
          "f_stepsisters_nums": f_stepsisters_nums,
          "f_stepsisters_part0": f_stepsisters_part0,
        }),
      );
      res = response.body;
    } catch (e) {}
  }
}