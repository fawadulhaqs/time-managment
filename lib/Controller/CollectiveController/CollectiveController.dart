import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timemanagment/Models/CollectiveModel.dart';
import 'package:timemanagment/constans/Colors.dart';

class CollectiveController extends GetxController {
  TextEditingController logDate = TextEditingController();
  TextEditingController logStartTime = TextEditingController();
  TextEditingController logEndTime = TextEditingController();
  TextEditingController logBoiler = TextEditingController();
  TextEditingController logFatCharge = TextEditingController();
  TextEditingController logSample = TextEditingController();
  TextEditingController sapStartTime = TextEditingController();
  TextEditingController sapEndTime = TextEditingController();
  TextEditingController cirStartTime = TextEditingController();
  TextEditingController cirEndTime = TextEditingController();
  TextEditingController water1st = TextEditingController();
  TextEditingController water2nd = TextEditingController();
  TextEditingController watercir = TextEditingController();
  TextEditingController watercor = TextEditingController();
  TextEditingController costic1st = TextEditingController();
  TextEditingController costic2nd = TextEditingController();
  TextEditingController costiccir = TextEditingController();
  TextEditingController costiccor = TextEditingController();
  TextEditingController palm1st = TextEditingController();
  TextEditingController palm2nd = TextEditingController();
  TextEditingController palmcir = TextEditingController();
  TextEditingController palmcor = TextEditingController();
  TextEditingController hard1st = TextEditingController();
  TextEditingController hard2nd = TextEditingController();
  TextEditingController hardcir = TextEditingController();
  TextEditingController hardcor = TextEditingController();
  TextEditingController dfa1st = TextEditingController();
  TextEditingController dfa2nd = TextEditingController();
  TextEditingController dfacir = TextEditingController();
  TextEditingController dfacor = TextEditingController();
  TextEditingController pko1st = TextEditingController();
  TextEditingController pko2nd = TextEditingController();
  TextEditingController pkocir = TextEditingController();
  TextEditingController pkocor = TextEditingController();
  TextEditingController lab1st = TextEditingController();
  TextEditingController lab2nd = TextEditingController();
  TextEditingController labcir = TextEditingController();
  TextEditingController labcor = TextEditingController();
  TextEditingController salt1st = TextEditingController();
  TextEditingController salt2nd = TextEditingController();
  TextEditingController saltcir = TextEditingController();
  TextEditingController saltcor = TextEditingController();
  TextEditingController sv1st = TextEditingController();
  TextEditingController sv2nd = TextEditingController();
  TextEditingController svcir = TextEditingController();
  TextEditingController svcor = TextEditingController();
  TextEditingController tur1st = TextEditingController();
  TextEditingController tur2nd = TextEditingController();
  TextEditingController turcir = TextEditingController();
  TextEditingController turcor = TextEditingController();

  DateTime sapstartingDate = DateTime.now();
  DateTime sapendingDate = DateTime.now();
  //final sapActTime = sapendingDate.difference(sapstartingDate).inMinutes;
  DateTime cirstartingDate = DateTime.now();
  DateTime cirendingDate = DateTime.now();

  DateTime logstartingDate = DateTime.now();
  DateTime logendingDate = DateTime.now();

  int overallTime;

  int cirDiff;
  int sapDiff;
  DateTime _selectedDate;
  RxString shiftValue = ''.obs;
  RxString baseValue = ''.obs;
  RxString panValue = ''.obs;
  RxString operatorValue = ''.obs;
  RxString sapLossesValue = ''.obs;
  RxString sapOtherLossesValue = ''.obs;
  RxString cirLossesValue = ''.obs;
  RxString cirOtherLossesValue = ''.obs;
  String sapStdTime = '180';
  String cirStdTime = '90';
  final firebaseFirestore = FirebaseFirestore.instance;

  //final newUi = Get.put(NewUi());

  Rx<List<CollectiveModel>> collectiveList = Rx<List<CollectiveModel>>();

  List<CollectiveModel> get log => collectiveList.value;

  void getlist() {
    collectiveList.bindStream(commonStream());
  }

  Stream<List<CollectiveModel>> commonStream() {
    print("enter in add function");
    return firebaseFirestore
        .collection('logSheetInfo')
        .orderBy('LogSentAt', descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<CollectiveModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(CollectiveModel.fromDocumentSnapShot(element));
      });

      print('length is ${retVal.length}');
      return retVal;
    });
  }

  Future<void> addCollectiveData(
    String date,
    String shift,
    String base,
    String boilNo,
    String panNo,
    String fatChange,
    String startTime,
    String endTime,
    String operator,
    String sampleNo,
    int overallTime,
    String sapStartTime,
    String sapEndTime,
    String sapStdTime,
    int sapDiff,
    String saplosses,
    String sapOtherLosses,
    String cirStartTime,
    String cirEndTime,
    String cirStdTime,
    int cirDiff,
    String cirLosses,
    String cirOtherLosses,
    String water1st,
    String water2nd,
    String watercir,
    String watercor,
    String costic1st,
    String costic2nd,
    String costiccir,
    String costiccor,
    String palm1st,
    String palm2nd,
    String palmcir,
    String palmcor,
    String hard1st,
    String hard2nd,
    String hardcir,
    String hardcor,
    String dfa1st,
    String dfa2nd,
    String dfacir,
    String dfacor,
    String pko1st,
    String pko2nd,
    String pkocir,
    String pkocor,
    String lab1st,
    String lab2nd,
    String labcir,
    String labcor,
    String salt1st,
    String salt2nd,
    String saltcir,
    String saltcor,
    String sv1st,
    String sv2nd,
    String svcir,
    String svcor,
    String tur1st,
    String tur2nd,
    String turcir,
    String turcor,
  ) async {
    try {
      await firebaseFirestore.collection('logSheetInfo').add({
        'LogDate': DateTime.now(),
        'LogSentAt': Timestamp.now(),
        'LogShift': shift,
        'LogBase': base,
        'LogBoilNo': boilNo,
        'LogPanNo': panNo,
        'LogFatChange': fatChange,
        'LogStartTime': startTime,
        'LogEndTime': endTime,
        'LogOperator': operator,
        'LogsampleNo': sampleNo,
        'OverAllTime': overallTime,
        'SapStartTime': sapStartTime,
        'SapEndTime': sapEndTime,
        'SapStdTime': '180',
        'SapActTime': sapDiff,
        'SapLosses': saplosses,
        'SapOtherLosses': sapOtherLosses,
        'CirStartTime': cirStartTime,
        'CirEndTime': cirEndTime,
        'CirStdTime': '90',
        'CirActTIme': cirDiff,
        'CirLosses': cirLosses,
        'CirOtherLosses': cirOtherLosses,
        'Water_1st': water1st,
        'Water_2nd': water2nd,
        'Water_Cir': watercir,
        'Water_Cor': watercor,
        'Caustic_1st': costic1st,
        'Caustic_2nd': costic2nd,
        'Caustic_Cir': costiccir,
        'Cautic_Cor': costiccor,
        'Palm_Oil_1st': palm1st,
        'Palm_Oil_2nd': palm2nd,
        'Palm_Oil_Cir': palmcir,
        'Palm_Oil_Cor': palmcor,
        'Hard_ST_1st': hard1st,
        'Hard_ST_2nd': hard2nd,
        'Hard_ST_Cir': hardcir,
        'Hard_ST_Cor': hardcor,
        'Lauric_DFA_1st': dfa1st,
        'Lauric_DFA_2nd': dfa2nd,
        'Lauric_DFA_Cir': dfacir,
        'Lauric_DFA_Cor': dfacor,
        'PKO_1st': pko1st,
        'PKO_2nd': pko2nd,
        'PKO_Cir': pkocir,
        'PKO_Cor': pkocor,
        'Labsa_1st': lab1st,
        'Labsa_2nd': lab2nd,
        'Labsa_Cir': labcir,
        'Labsa_Cor': labcor,
        'Salt_1st': salt1st,
        'Salt_2nd': salt2nd,
        'Salt_Cir': saltcir,
        'Salt_Cor': saltcor,
        'Sodium_Versence_1st': sv1st,
        'Sodium_Versence_2nd': sv2nd,
        'Sodium_Versence_Cir': svcir,
        'Sodium_Versence_Cor': svcor,
        'Turpinol_1st': tur1st,
        'Turpinol_2nd': tur2nd,
        'Turpinol_Cir': turcir,
        'Turpinol_Cor': turcor,
      }).then((value) => Get.snackbar('Success', 'Information Saved!'));
      print('Success Information Saved!');
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString());
      rethrow;
    }
  }

  void onContinue({formKey}) {
    final isValid = formKey.currentState.validate();
    if (isValid) {
      // assign();
      addCollectiveData(
        logDate.text,
        shiftValue.value,
        baseValue.value,
        logBoiler.text,
        panValue.value,
        logFatCharge.text,
        logStartTime.text,
        logEndTime.text,
        operatorValue.value,
        logSample.text,
        overallTime,
        sapStartTime.text,
        sapEndTime.text,
        sapStdTime,
        sapDiff,
        sapLossesValue.value,
        sapOtherLossesValue.value,
        cirStartTime.text,
        cirEndTime.text,
        cirStdTime,
        cirDiff,
        cirLossesValue.value,
        cirOtherLossesValue.value,
        water1st.text,
        water2nd.text,
        watercir.text,
        watercor.text,
        costic1st.text,
        costic2nd.text,
        costiccir.text,
        costiccor.text,
        palm1st.text,
        palm2nd.text,
        palmcir.text,
        palmcor.text,
        hard1st.text,
        hard2nd.text,
        hardcir.text,
        hardcor.text,
        dfa1st.text,
        dfa2nd.text,
        dfacir.text,
        dfacor.text,
        pko1st.text,
        pko2nd.text,
        pkocir.text,
        pkocor.text,
        lab1st.text,
        lab2nd.text,
        labcir.text,
        labcor.text,
        salt1st.text,
        salt2nd.text,
        saltcir.text,
        saltcor.text,
        sv1st.text,
        sv2nd.text,
        svcir.text,
        svcor.text,
        tur1st.text,
        tur2nd.text,
        turcir.text,
        turcor.text,
      );
      print('Date is : $_selectedDate');

      //clearController();

    } else {
      return;
      //login(emailSignIn.text, passwordSignIn.text);
    }
    formKey.currentState.save;
  }

  selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.black,
                onPrimary: Colors.blueAccent,
                surface: CustomColors.myBlue,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      logDate
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: logDate.text.length, affinity: TextAffinity.upstream));
    }
  }

  DateTime logformattedTime;

  logstartTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      logformattedTime = parsedTime;
      print(logformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      logstartingDate = logformattedTime;

      logStartTime.text = DateFormat('kk:mm:a').format(logformattedTime);

      //  startingDate=formattedTime;
    } else {
      print("Time is not selected");
    }
  }

  logendTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());

      logformattedTime = parsedTime;
      print(logformattedTime); //output 14:59:00
      logendingDate = logformattedTime;
      logEndTime.text = DateFormat('kk:mm:a').format(logformattedTime);
    } else {
      print("Time is not selected");
    }
  }

  DateTime sapformattedTime;

  sapstartTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      sapformattedTime = parsedTime;
      print(sapformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      sapstartingDate = sapformattedTime;

      sapStartTime.text = DateFormat('kk:mm:a').format(sapformattedTime);

      //  startingDate=formattedTime;
    } else {
      print("Time is not selected");
    }
  }

  sapendTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());

      sapformattedTime = parsedTime;
      print(sapformattedTime); //output 14:59:00
      sapendingDate = sapformattedTime;
      sapEndTime.text = DateFormat('kk:mm:a').format(sapformattedTime);
    } else {
      print("Time is not selected");
    }
  }

  DateTime cirformattedTime;

  cirstartTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      cirformattedTime = parsedTime;
      print(cirformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      cirstartingDate = cirformattedTime;

      cirStartTime.text = DateFormat('kk:mm:a').format(cirformattedTime);

      //  startingDate=formattedTime;
    } else {
      print("Time is not selected");
    }
  }

  cirendTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      cirformattedTime = parsedTime;
      print(cirformattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      cirendingDate = cirformattedTime;
      cirEndTime.text = DateFormat('kk:mm:a').format(cirformattedTime);

      // endingDate=formattedTime as DateTime;
    } else {
      print("Time is not selected");
    }
  }

  String validateLosses(String value) {
    if (value == null) {
      return "Please select None if no losses";
    } else {
      return null;
    }
  }

  String validateDate(String value) {
    if (value.length == 0) {
      return "Date can't be Empty";
    } else {
      return null;
    }
  }

  String validateShift(String value) {
    if (value == null) {
      return "Please select any shift";
    } else {
      return null;
    }
  }

  String validateBase(String value) {
    if (value == null) {
      return "Base can't be Empty";
    } else {
      return null;
    }
  }

  String validateBiloNo(String value) {
    if (value.length == 0) {
      return "Please Enter Boil number";
    } else {
      return null;
    }
  }

  String validatePanlNo(String value) {
    if (value == null) {
      return "Please Enter pan number";
    } else {
      return null;
    }
  }

  String validateFatChange(String value) {
    if (value.length == 0) {
      return "This field can't be empty";
    } else {
      return null;
    }
  }

  String validateStartTime(String value) {
    if (value.length == 0) {
      return "Please select Starting Time";
    } else {
      return null;
    }
  }

  String validateEndingTime(String value) {
    if (value.length == 0) {
      return "Please select Ending Time";
    } else {
      return null;
    }
  }

  String validateOperator(String value) {
    if (value == null) {
      return "Operator name is required";
    } else {
      return null;
    }
  }

  String validateSampleNo(String value) {
    if (value.length == 0) {
      return "SampleNo name is required";
    } else {
      return null;
    }
  }
}
