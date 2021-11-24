import 'dart:convert';
import 'dart:io';

// import 'package:health_kit_reporter/health_kit_reporter.dart';
// import 'package:health_kit_reporter/model/payload/device.dart';
// import 'package:health_kit_reporter/model/payload/quantity.dart';
// import 'package:health_kit_reporter/model/payload/source.dart';
// import 'package:health_kit_reporter/model/payload/source_revision.dart';
// import 'package:health_kit_reporter/model/predicate.dart';
// import 'package:health_kit_reporter/model/type/activity_summary_type.dart';
// import 'package:health_kit_reporter/model/type/category_type.dart';
// import 'package:health_kit_reporter/model/type/characteristic_type.dart';
// import 'package:health_kit_reporter/model/type/electrocardiogram_type.dart';
// import 'package:health_kit_reporter/model/type/quantity_type.dart';
// import 'package:health_kit_reporter/model/type/series_type.dart';
// import 'package:health_kit_reporter/model/type/workout_type.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_kit_reporter/health_kit_reporter.dart';
import 'package:health_kit_reporter/model/payload/category.dart';
import 'package:health_kit_reporter/model/payload/date_components.dart';
import 'package:health_kit_reporter/model/payload/device.dart';
import 'package:health_kit_reporter/model/payload/preferred_unit.dart';
import 'package:health_kit_reporter/model/payload/quantity.dart';
import 'package:health_kit_reporter/model/payload/source.dart';
import 'package:health_kit_reporter/model/payload/source_revision.dart';
import 'package:health_kit_reporter/model/payload/workout.dart';
import 'package:health_kit_reporter/model/payload/workout_activity_type.dart';
import 'package:health_kit_reporter/model/payload/workout_event.dart';
import 'package:health_kit_reporter/model/payload/workout_event_type.dart';
import 'package:health_kit_reporter/model/predicate.dart';
import 'package:health_kit_reporter/model/type/activity_summary_type.dart';
import 'package:health_kit_reporter/model/type/category_type.dart';
import 'package:health_kit_reporter/model/type/characteristic_type.dart';
import 'package:health_kit_reporter/model/type/correlation_type.dart';
import 'package:health_kit_reporter/model/type/electrocardiogram_type.dart';
import 'package:health_kit_reporter/model/type/quantity_type.dart';
import 'package:health_kit_reporter/model/type/series_type.dart';
import 'package:health_kit_reporter/model/type/workout_type.dart';
import 'package:health_kit_reporter/model/update_frequency.dart';

import 'TypeUserModel.dart';

class ServerConnection {
  static Future<UserModel?> findUserByUid(String uid) async {
    var userModel;
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/find_user_by_uid.php?uid=" + uid));
    var responseBody = utf8.decode(response.bodyBytes);

    Map<String, dynamic> list = json.decode(response.body);

    if (list['result'] == '0') {
      return null;
    }
    print("making usermodel");
    return UserModel(
      uid: uid,
      name: list['result']["user_name"],
      email: list['result']["email"],
      profileUrl:
          "http://kaistuser.iptime.org:8080/img/profile/" + uid + ".jpg",
    );
  }

  static Future<Map<String, dynamic>> GetEnergyburned(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_energyburned.php?uid=" + uid));
    print("debug : getEnergyBurned");
    return Map<String, dynamic>.from(json.decode(response.body));
  }

  static Future<Map<String, dynamic>> GetStress(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_stress.php?uid=" + uid));
    print("debug : getStress");
    return Map<String, dynamic>.from(json.decode(response.body));
  }

  static Future<Map<String, dynamic>> GetWeight(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_weight.php?uid=" + uid));
    print("debug : getWeight");
    return Map<String, dynamic>.from(json.decode(response.body));
  }

  static Future<String> GetBirthDay(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_birthday.php?uid=" + uid));
    return (json.decode(response.body));
  }

  static Future<void> uploadProfileImage(String uid, String photoURL) async {
    await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/upload_image.php?uid=" +
            uid +
            "&photoURL=" +
            photoURL));
  }

  static Future<void> createUser(
    String uid,
    String email,
    String userName,
  ) async {
    await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/create_user.php?uid=" +
            uid +
            "&email=" +
            email +
            "&user_name=" +
            userName));
  }

  static Future<String> AuthSignedUser(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/check_user_by_uid.php?uid=" + uid));
    print("check user");
    print(json.decode(response.body));
    return json.decode(response.body).toString();
  }

  static Future<String> checkFoodPhoto(String uid, String photoURL) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/check_food_uid.php?uid=" +
            uid +
            "&photoURL=" +
            photoURL));
    print("checkfoodphto !!!!!!!!!!!!!!");
    print(json.decode(response.body));
    return json.decode(response.body).toString();
  }

  static Future<String> save_food(String uid, List food) async {
    var data = [];
    // if (num != 31) {
    //   for (int i = 0; i < num; i++) {
    //     var tmp = DateTime.now()
    //         .add(Duration(days: -i))
    //         .toString()
    //         .substring(0, 10)
    //         .replaceAll("-", "_");
    //     print(tmp);
    //     date.add(tmp);
    //   }
    // } else {}
    food.forEach((e) {
      var map = {};
      print(e[0]);
      print(e[1]);
      print(e[2][0]);
      print(e[2][1] * e[3]);
      data.add([
        e[0].toString().substring(0, 10).replaceAll("-", "_"),
        e[0].toString(),
        e[1],
        e[2][0],
        e[2][1] * e[3]
      ]);
    });
    print(food.length);
    print(data);
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'upload_food.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'data': json.encode(data)
        // 'data': json.encode(data.toString())
        // 'data': data.toString()
      },
    );
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  static Future<List<dynamic>> total_weight(
      String uid, List<dynamic> date) async {
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_weight.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<List<dynamic>> total_sleep(
      String uid, List<dynamic> date) async {
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_sleep.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<List<dynamic>> total_stress(
      String uid, List<dynamic> date) async {
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_stress.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<List<dynamic>> total_food(
      String uid, List<dynamic> date) async {
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_food.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<List<dynamic>> total_burned(
      String uid, List<dynamic> date) async {
    print('showing date');
    print(date);
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_burned.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<List<dynamic>> total_seven_sleep(
      String uid, List<dynamic> date) async {
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_seven_sleep.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<List<dynamic>> total_seven_food(
      String uid, List<dynamic> date) async {
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_seven_food.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<List<dynamic>> total_workout(String uid, DateTime date) async {
    var dateStr = date.toString().substring(0, 10).replaceAll("-", "_");

    List<String> dateStrs = [];

    dateStrs.add(dateStr);

    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'get_workout_by_date.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(dateStrs)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<String> updateHeathData(String uid) async {
    // final response = await http.get(Uri.parse(
    //     "http://kaistuser.iptime.org:8080/healthData_get_lastupdate.php?uid=alpaca"));
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/healthData_get_lastupdate.php?uid=" +
            uid));
    // var responseBody = utf8.decode(response.bodyBytes);
    // List<dynamic> list = jsonDecode(responseBody);
    // var list = jsonDecode(response.body);
    // Map<String, dynamic> list = json.decode(response.body);
    // print("!!!!!!!!!!!!!!!!!!!");
    // print(list);
    // print(list['result']);
    // print(list['result']['uid']);
    print(json.decode(response.body));
    String lastupdate = json.decode(response.body).toString();
    DateTime start;
    if (lastupdate == "0") {
      print("update date is none");
      start = DateTime.now().add(Duration(days: -400));
      // start = DateTime.now().add(Duration(days: -10));
    } else {
      print("update date is not none");
      // start = DateTime.parse(lastupdate);
      start = DateTime.now();
      // start = DateTime.now().add(Duration(days: -20));
    }
    DateTime now = DateTime.now();
    final _predicate = Predicate(
      start,
      // DateTime.now().add(Duration(days: -365 * 2)),
      // lastupdate.,
      now,
    );
    bool _isAuthorizationRequested = false;
    try {
      final readTypes = <String>[];
      readTypes.addAll(ActivitySummaryType.values.map((e) => e.identifier));
      readTypes.addAll(CategoryType.values.map((e) => e.identifier));
      readTypes.addAll(CharacteristicType.values.map((e) => e.identifier));
      readTypes.addAll(QuantityType.values.map((e) => e.identifier));
      readTypes.addAll(WorkoutType.values.map((e) => e.identifier));
      readTypes.addAll(SeriesType.values.map((e) => e.identifier));
      readTypes.addAll(ElectrocardiogramType.values.map((e) => e.identifier));
      final writeTypes = <String>[
        // QuantityType.stepCount.identifier,
        QuantityType.bodyMass.identifier,
        // WorkoutType.workoutType.identifier,
        // CategoryType.sleepAnalysis.identifier,
        // CategoryType.mindfulSession.identifier,
      ];
      final isRequested =
          await HealthKitReporter.requestAuthorization(readTypes, writeTypes);
      _isAuthorizationRequested = isRequested;
    } catch (e) {
      print(e);
      print("error...?");
    }
    try {
      // var activityData = [];
      // if (lastupdate == "0") {
      //   final appleHealthActivity = await HealthKitReporter.sampleQuery(
      //       QuantityType.activeEnergyBurned.identifier,
      //       Predicate(start.add(Duration(days: -10)), start));
      //   // print(samples2.map((e) => e.map).toList()[0]);
      //   for (final q in appleHealthActivity) {
      //     var map = {};
      //     map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
      //     map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
      //     map['calorie'] = '${json.encode(q.map["harmonized"]["value"])}';
      //     activityData.add(map);
      //   }
      // } else {
      //   final appleHealthActivity = await HealthKitReporter.sampleQuery(
      //       QuantityType.activeEnergyBurned.identifier, _predicate);
      //   // print(samples2.map((e) => e.map).toList()[0]);
      //   for (final q in appleHealthActivity) {
      //     var map = {};
      //     map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
      //     map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
      //     map['calorie'] = '${json.encode(q.map["harmonized"]["value"])}';
      //     activityData.add(map);
      //   }
      // }

      var activitySummaryData = [];
      final appleHealthactivitySummary =
          await HealthKitReporter.queryActivitySummary(_predicate);
      for (final q in appleHealthactivitySummary) {
        // print('q: ${json.encode(q.map)} \n');
        // print(json.encode(q.map["date"]).substring(1, 11).replaceAll("-", "_"));
        // print(json.encode(q.map["harmonized"]["activeEnergyBurned"]));
        // print(json.encode(q.map["harmonized"]["activeEnergyBurnedGoal"]));
        var map = {};
        map['startTime'] =
            '${json.encode(q.map["date"]).substring(1, 11).replaceAll("-", "_")}';
        map['activeEnergyBurned'] =
            '${json.encode(q.map["harmonized"]["activeEnergyBurned"])}';
        map['activeEnergyBurnedGoal'] =
            '${json.encode(q.map["harmonized"]["activeEnergyBurnedGoal"])}';
        activitySummaryData.add(map);
      }

      // var sleepData = [];
      // var tmp = [];
      // final appleHealthSleep = await HealthKitReporter.categoryQuery(
      //     CategoryType.sleepAnalysis, _predicate);
      // for (final q in appleHealthSleep) {
      //   var map = {};
      //   map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
      //   map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
      //   if (!tmp.contains(map.toString())) {
      //     sleepData.add(map);
      //     tmp.add(map.toString());
      //   }
      // }

      var sleepData = [];
      var sleepDataSpecific = [];
      var tmp = [];
      final appleHealthSleep = await HealthKitReporter.categoryQuery(
          CategoryType.sleepAnalysis, _predicate);
      for (final q in appleHealthSleep) {
        var map = {};
        var map2 = {};
        // var startTime = '${json.encode(q.map["startTimestamp"])}';
        int startTime = q.map["startTimestamp"].toInt();
        int endTime = q.map["endTimestamp"].toInt();
        var temp = startTime.toString() + '/' + endTime.toString();
        map['endTime'] =
            DateTime.fromMillisecondsSinceEpoch((endTime * 1000).toInt())
                .toString()
                .substring(0, 10)
                .replaceAll("-", "_");
        map['period'] = ((endTime - startTime) ~/ 60).toString();

        map2['startTime'] =
            DateTime.fromMillisecondsSinceEpoch((startTime * 1000).toInt())
                .toString();
        map2['endTime'] =
            DateTime.fromMillisecondsSinceEpoch((endTime * 1000).toInt())
                .toString();
        print(DateTime.fromMillisecondsSinceEpoch((endTime * 1000).toInt())
            .toString());
        map2['startDate'] =
            DateTime.fromMillisecondsSinceEpoch((startTime * 1000).toInt())
                .toString()
                .substring(0, 10)
                .replaceAll("-", "_");
        map2['endDate'] =
            DateTime.fromMillisecondsSinceEpoch((endTime * 1000).toInt())
                .toString()
                .substring(0, 10)
                .replaceAll("-", "_");
        print(endTime.runtimeType);
        if (!tmp.contains(temp)) {
          // sleepData.add(map);
          tmp.add(temp);
          // print(map);
          sleepDataSpecific.add(map2);
          if (sleepData.isNotEmpty &&
              sleepData.last["endTime"] == map['endTime']) {
            print("same");
            // print(sleepData.last["endTime"]);
            sleepData.last["period"] =
                (int.parse(sleepData.last["period"]) + int.parse(map["period"]))
                    .toString();
          } else {
            print("not same");
            sleepData.add(map);
          }
        }
      }

      var stressData = [];
      var mapHR = {};
      double stress;
      final appleHealthHR = await HealthKitReporter.sampleQuery(
          QuantityType.heartRate.identifier, _predicate);
      // print(samples2.map((e) => e.map).toList()[0]);
      for (final q in appleHealthHR) {
        // print('q: ${json.encode(q.map["harmonized"]["value"])} \n');
        mapHR['${json.encode(q.map["startTimestamp"])}'] =
            '${json.encode(q.map["harmonized"]["value"])}';
      }
      final appleHealthSDNN = await HealthKitReporter.sampleQuery(
          QuantityType.heartRateVariabilitySDNN.identifier, _predicate);
      for (final q in appleHealthSDNN) {
        var map = {};
        if (mapHR[json.encode(q.map["startTimestamp"])] != null) {
          stress =
              double.parse('${mapHR[json.encode(q.map["startTimestamp"])]}') -
                  double.parse('${json.encode(q.map["harmonized"]["value"])}') *
                      0.4;
          map['startDate'] = DateTime.fromMillisecondsSinceEpoch(
                  (q.map["startTimestamp"].toInt() * 1000).toInt())
              .toString()
              .substring(0, 10)
              .replaceAll("-", "_");
          map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
          map['stress'] = stress.toString();
          stressData.add(map);
        }
      }

      var weightData = [];
      final appleHealthWeight = await HealthKitReporter.sampleQuery(
          QuantityType.bodyMass.identifier, _predicate);
      for (final q in appleHealthWeight) {
        var map = {};
        // print('q: ${json.encode(q.map)} \n');
        // print(
        //     'q: ${json.encode(q.map["startTimestamp"])} ${json.encode(q.map["harmonized"]["value"])} kg \n');
        map['startDate'] = DateTime.fromMillisecondsSinceEpoch(
                (q.map["startTimestamp"].toInt() * 1000).toInt())
            .toString()
            .substring(0, 10)
            .replaceAll("-", "_");
        map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
        map['weight'] = '${json.encode(q.map["harmonized"]["value"])}';
        // print('q: ${json.encode(q.map["harmonized"]["value"])} \n');
        weightData.add(map);
      }

      var workoutsData = [];
      final appleHealthWorkouts =
          await HealthKitReporter.workoutQuery(_predicate);
      // print('workouts: ${workouts.map((e) => e.map).toList()}');
      for (final q in appleHealthWorkouts) {
        var map = {};
        // print('q: ${json.encode(q.map)} \n');
        // print('q: ${json.encode(q.map["startTimestamp"])}');
        // print('q: ${json.encode(q.map["endTimestamp"])}');
        // print('q: ${json.encode(q.map["duration"])}');
        // print('q: ${json.encode(q.map["harmonized"]["description"])}');
        // print('q: ${json.encode(q.map["harmonized"]["totalEnergyBurned"])}');
        // print(
        //     'q: ${json.encode(q.map["harmonized"]["totalEnergyBurnedUnit"])}');
        map['startDate'] = DateTime.fromMillisecondsSinceEpoch(
                (q.map["startTimestamp"].toInt() * 1000).toInt())
            .toString()
            .substring(0, 10)
            .replaceAll("-", "_");
        map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
        map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
        map['type'] = '${json.encode(q.map["harmonized"]["description"])}'
            .replaceAll('"', '');
        map['calorie'] =
            '${json.encode(q.map["harmonized"]["totalEnergyBurned"])}';
        workoutsData.add(map);
      }

      String checker = lastupdate == "0" ? "0" : "1";

      final response = await http.post(
        Uri.http('kaistuser.iptime.org:8080',
            'upload_healthData.php'), // ex ) http://123.0.0.0/test
        body: <String, String>{
          'uid': uid, //서버에 post key : 보내는 값
          'checkUser': checker,
          'lastupdate': now.toString(),
          // 'activityData': json.encode(activityData),
          'activitySummaryData': json.encode(activitySummaryData),
          'sleepData': json.encode(List.from(sleepData.reversed)),
          'sleepDataSpecific':
              json.encode(List.from(sleepDataSpecific.reversed)),
          'stressData': json.encode(List.from(stressData.reversed)),
          'weightData': json.encode(List.from(weightData.reversed)),
          'workoutsData': json.encode(List.from(workoutsData.reversed))
        },
      );
      // print("post test");
      // print(json.decode(response.body));
      // print(stressData);
      // final canWrite = await HealthKitReporter.isAuthorizedToWrite(
      //     QuantityType.bodyMass.identifier);
      // if (canWrite) {
      //   final _device = Device(
      //     'FlutterTracker',
      //     'kvs',
      //     'T-800',
      //     '3',
      //     '3.0',
      //     '1.1.1',
      //     'kvs.sample.app',
      //     '444-888-555',
      //   );
      // final _source = Source(
      //   'myApp',
      //   'com.kvs.health_kit_reporter_example',
      // );
      // final _operatingSystem = OperatingSystem(
      //   1,
      //   2,
      //   3,
      // );

      // SourceRevision _sourceRevision = SourceRevision(
      //   _source,
      //   '5',
      //   'fit',
      //   '4',
      //   _operatingSystem,
      // );
      // final _sourceRevision = SourceRevision(
      //   _source,
      //   '5',
      //   'fit',
      //   '4',
      //   _operatingSystem,
      // );
      // final now = DateTime.now().add(Duration(minutes: -1));
      // final minuteAgo = now.add(Duration(minutes: -1));
      // final harmonized = QuantityHarmonized(80, 'kg', null);
      // final weight = Quantity(
      //     'testStepsUUID',
      //     QuantityType.bodyMass.identifier,
      //     now.millisecondsSinceEpoch,
      //     now.millisecondsSinceEpoch,
      //     _device,
      //     _sourceRevision,
      //     harmonized);
      // print('try to save: ${weight.map}');
      // final saved = await HealthKitReporter.save(weight);
      // final now = DateTime.now();
      // final minuteAgo = now.add(Duration(minutes: -1));
      // final harmonized = QuantityHarmonized(100, 'count', null);
      // final steps = Quantity(
      //     'testStepsUUID',
      //     QuantityType.stepCount.identifier,
      //     minuteAgo.millisecondsSinceEpoch,
      //     now.millisecondsSinceEpoch,
      //     _device,
      //     _sourceRevision,
      //     harmonized);
      // print('try to save: ${steps.map}');
      // final saved = await HealthKitReporter.save(steps);
      // print('stepsSaved: $saved');
      // print('stepsWeight: $saved');
      // } else {
      //   print('error canWrite weight: $canWrite');
      // }
    } catch (e) {
      print(
          "the problem might happen because you do not have apple health on your device");
      print(e);
    }
    return lastupdate;
  }
}
