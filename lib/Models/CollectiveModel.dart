import 'package:cloud_firestore/cloud_firestore.dart';

class CollectiveModel {
  String id;
  Timestamp sentAt;
  Timestamp date;
  String shift;
  String base;
  String boilNo;
  String panlNo;
  String fatChange;
  String startTime;
  String endTime;
  String operator;
  String sampleNo;
  int overall;
  String startTimeSoap;
  String endTimeSoap;
  String stdTimeSoap;
  int actTimeSoap;
  String downTimeLossSoap;
  String downTimeOtherLossSoap;
  String startTimeCir;
  String endTimeCir;
  String stdTimeCir;
  int actTimeCir;
  String downTimeLossCir;
  String downTimeOtherLossCir;
  String water1st;
  String water2nd;
  String watercir;
  String watercor;
  String costic1st;
  String costic2nd;
  String costiccir;
  String costiccor;
  String palm1st;
  String palm2nd;
  String palmcir;
  String palmcor;
  String hard1st;
  String hard2nd;
  String hardcir;
  String hardcor;
  String dfa1st;
  String dfa2nd;
  String dfacir;
  String dfacor;
  String pko1st;
  String pko2nd;
  String pkocir;
  String pkocor;
  String lab1st;
  String lab2nd;
  String labcir;
  String labcor;
  String salt1st;
  String salt2nd;
  String saltcir;
  String saltcor;
  String sv1st;
  String sv2nd;
  String svcir;
  String svcor;
  String tur1st;
  String tur2nd;
  String turcir;
  String turcor;

  CollectiveModel({
    this.id,
    this.date,
    this.shift,
    this.base,
    this.endTime,
    this.startTime,
    this.boilNo,
    this.fatChange,
    this.operator,
    this.panlNo,
    this.sampleNo,
    this.overall,
    this.sentAt,
    this.actTimeSoap,
    this.downTimeLossSoap,
    this.downTimeOtherLossSoap,
    this.endTimeSoap,
    this.startTimeSoap,
    this.stdTimeSoap,
    this.actTimeCir,
    this.downTimeLossCir,
    this.downTimeOtherLossCir,
    this.endTimeCir,
    this.startTimeCir,
    this.stdTimeCir,
    this.water1st,
    this.water2nd,
    this.watercir,
    this.watercor,
    this.costic1st,
    this.costic2nd,
    this.costiccir,
    this.costiccor,
    this.palm1st,
    this.palm2nd,
    this.palmcir,
    this.palmcor,
    this.hard1st,
    this.hard2nd,
    this.hardcir,
    this.hardcor,
    this.dfa1st,
    this.dfa2nd,
    this.dfacir,
    this.dfacor,
    this.pko1st,
    this.pko2nd,
    this.pkocir,
    this.pkocor,
    this.lab1st,
    this.lab2nd,
    this.labcir,
    this.labcor,
    this.salt1st,
    this.salt2nd,
    this.saltcir,
    this.saltcor,
    this.sv1st,
    this.sv2nd,
    this.svcir,
    this.svcor,
    this.tur1st,
    this.tur2nd,
    this.turcir,
    this.turcor,
  });

  CollectiveModel.fromDocumentSnapShot(DocumentSnapshot snapshot) {
    id = snapshot.id;
    sentAt = Timestamp.now();

    date = snapshot.data()['LogDate'] ?? "";

    shift = snapshot.data()['LogShift'] ?? "";
    base = snapshot.data()['LogBase'] ?? "";
    endTime = snapshot.data()['LogEndTime'] ?? "";
    startTime = snapshot.data()['LogStartTime'] ?? "";
    boilNo = snapshot.data()['LogBoilNo'] ?? "";
    fatChange = snapshot.data()['LogFatChange'] ?? "";
    operator = snapshot.data()['LogOperator'] ?? "";
    panlNo = snapshot.data()['LogPanNo'] ?? "";
    sampleNo = snapshot.data()['LogsampleNo'] ?? "";
    overall = snapshot.data()['OverAllTime'] ?? 0;
    startTimeSoap = snapshot.data()['SapStartTime'] ?? "";
    endTimeSoap = snapshot.data()['SapEndTime'] ?? "";
    stdTimeSoap = snapshot.data()['SapStdTime'] ?? "";
    actTimeSoap = snapshot.data()['SapActTime'] ?? 0;
    downTimeLossSoap = snapshot.data()['SapLosses'] ?? "";
    downTimeOtherLossSoap = snapshot.data()['SapOtherLosses'] ?? "";
    startTimeCir = snapshot.data()['CirStartTime'] ?? "";
    endTimeCir = snapshot.data()['CirEndTime'] ?? "";
    stdTimeCir = snapshot.data()['CirStdTime'] ?? "";
    actTimeCir = snapshot.data()['CirActTIme'] ?? "";
    downTimeLossCir = snapshot.data()['CirLosses'] ?? "";
    downTimeOtherLossCir = snapshot.data()['CirOtherLosses'] ?? "";
    water1st = snapshot.data()['Water_1st'] ?? "";
    water2nd = snapshot.data()['Water_2nd'] ?? "";
    watercir = snapshot.data()['Water_Cir'] ?? "";
    watercor = snapshot.data()['Water_Cor'] ?? "";
    costic1st = snapshot.data()['Caustic_1st'] ?? "";
    costic2nd = snapshot.data()['Caustic_2nd'] ?? "";
    costiccir = snapshot.data()['Caustic_Cir'] ?? "";
    costiccor = snapshot.data()['Caustic_Cor'] ?? "";
    palm1st = snapshot.data()['Palm_Oil_1st'] ?? "";
    palm2nd = snapshot.data()['Palm_Oil_2st'] ?? "";
    palmcir = snapshot.data()['Palm_Oil_Cir'] ?? "";
    palmcor = snapshot.data()['Palm_Oil_Cor'] ?? "";
    hard1st = snapshot.data()['Hard_ST_1st'] ?? "";
    hard2nd = snapshot.data()['Hard_ST_2st'] ?? "";
    hardcir = snapshot.data()['Hard_ST_Cir'] ?? "";
    hardcor = snapshot.data()['Hard_ST_Cor'] ?? "";
    dfa1st = snapshot.data()['Lauric_DFA_1st'] ?? "";
    dfa2nd = snapshot.data()['Lauric_DFA_2st'] ?? "";
    dfacir = snapshot.data()['Lauric_DFA_Cir'] ?? "";
    dfacor = snapshot.data()['Lauric_DFA_Cor'] ?? "";
    pko1st = snapshot.data()['PKO_1nd'] ?? "";
    pko2nd = snapshot.data()['PKO_2nd'] ?? "";
    pkocir = snapshot.data()['PKO_Cir'] ?? "";
    pkocor = snapshot.data()['PKO_Cor'] ?? "";
    lab1st = snapshot.data()['Labsa_1st'] ?? "";
    lab2nd = snapshot.data()['Labsa_2st'] ?? "";
    labcir = snapshot.data()['Labsa_Cir'] ?? "";
    labcor = snapshot.data()['Labsa_Cor'] ?? "";
    salt1st = snapshot.data()['Salt_1st'] ?? "";
    salt2nd = snapshot.data()['Salt_2st'] ?? "";
    saltcir = snapshot.data()['Salt_Cir'] ?? "";
    saltcor = snapshot.data()['Salt_Cor'] ?? "";
    sv1st = snapshot.data()['Sodium_Versence_1st'] ?? "";
    sv2nd = snapshot.data()['Sodium_Versence_2st'] ?? "";
    svcir = snapshot.data()['Sodium_Versence_Cir'] ?? "";
    svcor = snapshot.data()['Sodium_Versence_Cor'] ?? "";
    tur1st = snapshot.data()['Turpinol_1st'] ?? "";
    tur2nd = snapshot.data()['Turpinol_2st'] ?? "";
    turcir = snapshot.data()['Turpinol_Cir'] ?? "";
    turcor = snapshot.data()['Turpinol_Cor'] ?? "";
  }
}
