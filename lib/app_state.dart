import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _VideoOfTheDay =
          prefs.getString('ff_VideoOfTheDay')?.ref ?? _VideoOfTheDay;
    });
    _safeInit(() {
      _filterRoleList =
          prefs.getStringList('ff_filterRoleList') ?? _filterRoleList;
    });
    _safeInit(() {
      _refUser = prefs.getString('ff_refUser')?.ref ?? _refUser;
    });
    _safeInit(() {
      _entitlementID = prefs.getString('ff_entitlementID') ?? _entitlementID;
    });
    _safeInit(() {
      _dailyNotificationID =
          prefs.getInt('ff_dailyNotificationID') ?? _dailyNotificationID;
    });
    _safeInit(() {
      _lastloginTime = prefs.containsKey('ff_lastloginTime')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastloginTime')!)
          : _lastloginTime;
    });
    _safeInit(() {
      _lastLoginNotificationID = prefs.getInt('ff_lastLoginNotificationID') ??
          _lastLoginNotificationID;
    });
    _safeInit(() {
      _IslastLoginHappened =
          prefs.getBool('ff_IslastLoginHappened') ?? _IslastLoginHappened;
    });
    _safeInit(() {
      _improvementList = prefs
              .getStringList('ff_improvementList')
              ?.map((x) {
                try {
                  return ImprovementItemStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _improvementList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<ServiceStruct> _addOns = [
    ServiceStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"CV Writing Service\",\"priceKarma\":\"0.0\",\"price\":\"80.0\",\"has_attach\":\"true\"}')),
    ServiceStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"1x1 Coaching \",\"priceKarma\":\"0.0\",\"price\":\"150.0\"}')),
    ServiceStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Mock up Recruiter Interview\",\"priceKarma\":\"0.0\",\"price\":\"150.0\"}'))
  ];
  List<ServiceStruct> get addOns => _addOns;
  set addOns(List<ServiceStruct> value) {
    _addOns = value;
  }

  void addToAddOns(ServiceStruct value) {
    _addOns.add(value);
  }

  void removeFromAddOns(ServiceStruct value) {
    _addOns.remove(value);
  }

  void removeAtIndexFromAddOns(int index) {
    _addOns.removeAt(index);
  }

  void updateAddOnsAtIndex(
    int index,
    ServiceStruct Function(ServiceStruct) updateFn,
  ) {
    _addOns[index] = updateFn(_addOns[index]);
  }

  void insertAtIndexInAddOns(int index, ServiceStruct value) {
    _addOns.insert(index, value);
  }

  List<ServiceStruct> _MockInterviewServices = [
    ServiceStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Mock Interview\",\"priceKarma\":\"30\",\"price\":\"0\"}')),
    ServiceStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"1х1 Coaching session\",\"priceKarma\":\"35\",\"price\":\"0\"}'))
  ];
  List<ServiceStruct> get MockInterviewServices => _MockInterviewServices;
  set MockInterviewServices(List<ServiceStruct> value) {
    _MockInterviewServices = value;
  }

  void addToMockInterviewServices(ServiceStruct value) {
    _MockInterviewServices.add(value);
  }

  void removeFromMockInterviewServices(ServiceStruct value) {
    _MockInterviewServices.remove(value);
  }

  void removeAtIndexFromMockInterviewServices(int index) {
    _MockInterviewServices.removeAt(index);
  }

  void updateMockInterviewServicesAtIndex(
    int index,
    ServiceStruct Function(ServiceStruct) updateFn,
  ) {
    _MockInterviewServices[index] = updateFn(_MockInterviewServices[index]);
  }

  void insertAtIndexInMockInterviewServices(int index, ServiceStruct value) {
    _MockInterviewServices.insert(index, value);
  }

  DocumentReference? _VideoOfTheDay;
  DocumentReference? get VideoOfTheDay => _VideoOfTheDay;
  set VideoOfTheDay(DocumentReference? value) {
    _VideoOfTheDay = value;
    value != null
        ? prefs.setString('ff_VideoOfTheDay', value.path)
        : prefs.remove('ff_VideoOfTheDay');
  }

  List<String> _interviewRoles = ['Waiter'];
  List<String> get interviewRoles => _interviewRoles;
  set interviewRoles(List<String> value) {
    _interviewRoles = value;
  }

  void addToInterviewRoles(String value) {
    _interviewRoles.add(value);
  }

  void removeFromInterviewRoles(String value) {
    _interviewRoles.remove(value);
  }

  void removeAtIndexFromInterviewRoles(int index) {
    _interviewRoles.removeAt(index);
  }

  void updateInterviewRolesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _interviewRoles[index] = updateFn(_interviewRoles[index]);
  }

  void insertAtIndexInInterviewRoles(int index, String value) {
    _interviewRoles.insert(index, value);
  }

  List<String> _filterRoleList = [
    'Cabin Crew',
    'Manager',
    'Hostess/ Host',
    'Bartender',
    'Supervisor',
    'Waiter'
  ];
  List<String> get filterRoleList => _filterRoleList;
  set filterRoleList(List<String> value) {
    _filterRoleList = value;
    prefs.setStringList('ff_filterRoleList', value);
  }

  void addToFilterRoleList(String value) {
    _filterRoleList.add(value);
    prefs.setStringList('ff_filterRoleList', _filterRoleList);
  }

  void removeFromFilterRoleList(String value) {
    _filterRoleList.remove(value);
    prefs.setStringList('ff_filterRoleList', _filterRoleList);
  }

  void removeAtIndexFromFilterRoleList(int index) {
    _filterRoleList.removeAt(index);
    prefs.setStringList('ff_filterRoleList', _filterRoleList);
  }

  void updateFilterRoleListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _filterRoleList[index] = updateFn(_filterRoleList[index]);
    prefs.setStringList('ff_filterRoleList', _filterRoleList);
  }

  void insertAtIndexInFilterRoleList(int index, String value) {
    _filterRoleList.insert(index, value);
    prefs.setStringList('ff_filterRoleList', _filterRoleList);
  }

  List<String> _supportTopicList = [
    'Billing',
    'Online Course',
    'Latest Interview Questions',
    'Karma & Karma Exchange',
    'Practice Interview',
    'Other'
  ];
  List<String> get supportTopicList => _supportTopicList;
  set supportTopicList(List<String> value) {
    _supportTopicList = value;
  }

  void addToSupportTopicList(String value) {
    _supportTopicList.add(value);
  }

  void removeFromSupportTopicList(String value) {
    _supportTopicList.remove(value);
  }

  void removeAtIndexFromSupportTopicList(int index) {
    _supportTopicList.removeAt(index);
  }

  void updateSupportTopicListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _supportTopicList[index] = updateFn(_supportTopicList[index]);
  }

  void insertAtIndexInSupportTopicList(int index, String value) {
    _supportTopicList.insert(index, value);
  }

  DocumentReference? _refUser;
  DocumentReference? get refUser => _refUser;
  set refUser(DocumentReference? value) {
    _refUser = value;
    value != null
        ? prefs.setString('ff_refUser', value.path)
        : prefs.remove('ff_refUser');
  }

  List<String> _questionStage = [
    'Pre-screening',
    'In-person',
    'Role-play game',
    'Final Interview'
  ];
  List<String> get questionStage => _questionStage;
  set questionStage(List<String> value) {
    _questionStage = value;
  }

  void addToQuestionStage(String value) {
    _questionStage.add(value);
  }

  void removeFromQuestionStage(String value) {
    _questionStage.remove(value);
  }

  void removeAtIndexFromQuestionStage(int index) {
    _questionStage.removeAt(index);
  }

  void updateQuestionStageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _questionStage[index] = updateFn(_questionStage[index]);
  }

  void insertAtIndexInQuestionStage(int index, String value) {
    _questionStage.insert(index, value);
  }

  List<String> _questionRound = ['Yes', 'No', 'I’m waiting for feedback'];
  List<String> get questionRound => _questionRound;
  set questionRound(List<String> value) {
    _questionRound = value;
  }

  void addToQuestionRound(String value) {
    _questionRound.add(value);
  }

  void removeFromQuestionRound(String value) {
    _questionRound.remove(value);
  }

  void removeAtIndexFromQuestionRound(int index) {
    _questionRound.removeAt(index);
  }

  void updateQuestionRoundAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _questionRound[index] = updateFn(_questionRound[index]);
  }

  void insertAtIndexInQuestionRound(int index, String value) {
    _questionRound.insert(index, value);
  }

  String _entitlementID = 'Premium';
  String get entitlementID => _entitlementID;
  set entitlementID(String value) {
    _entitlementID = value;
    prefs.setString('ff_entitlementID', value);
  }

  int _dailyNotificationID = 0;
  int get dailyNotificationID => _dailyNotificationID;
  set dailyNotificationID(int value) {
    _dailyNotificationID = value;
    prefs.setInt('ff_dailyNotificationID', value);
  }

  DateTime? _lastloginTime;
  DateTime? get lastloginTime => _lastloginTime;
  set lastloginTime(DateTime? value) {
    _lastloginTime = value;
    value != null
        ? prefs.setInt('ff_lastloginTime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastloginTime');
  }

  int _lastLoginNotificationID = 0;
  int get lastLoginNotificationID => _lastLoginNotificationID;
  set lastLoginNotificationID(int value) {
    _lastLoginNotificationID = value;
    prefs.setInt('ff_lastLoginNotificationID', value);
  }

  bool _IslastLoginHappened = false;
  bool get IslastLoginHappened => _IslastLoginHappened;
  set IslastLoginHappened(bool value) {
    _IslastLoginHappened = value;
    prefs.setBool('ff_IslastLoginHappened', value);
  }

  List<ImprovementItemStruct> _improvementList = [
    ImprovementItemStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Interview Process Awareness 💡\",\"description\":\" Knowing Interview structure help you see the final goal.\",\"sort\":\"1\"}')),
    ImprovementItemStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Get out from feeling of stuck 🤝 \",\"description\":\" This might be overwhelming, we know; we\'ve been in your shoes. Start slowly, and you will see progress with Quis.\",\"sort\":\"2\"}')),
    ImprovementItemStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Get more Confidence 🍀\",\"description\":\" You are not alone. As you start, you will see progress quickly.\",\"sort\":\"3\"}')),
    ImprovementItemStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Interview Questions 💬\",\"description\":\"Many failed because they did not know what to expect. We aim to change that!\",\"sort\":\"4\"}'))
  ];
  List<ImprovementItemStruct> get improvementList => _improvementList;
  set improvementList(List<ImprovementItemStruct> value) {
    _improvementList = value;
    prefs.setStringList(
        'ff_improvementList', value.map((x) => x.serialize()).toList());
  }

  void addToImprovementList(ImprovementItemStruct value) {
    _improvementList.add(value);
    prefs.setStringList('ff_improvementList',
        _improvementList.map((x) => x.serialize()).toList());
  }

  void removeFromImprovementList(ImprovementItemStruct value) {
    _improvementList.remove(value);
    prefs.setStringList('ff_improvementList',
        _improvementList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromImprovementList(int index) {
    _improvementList.removeAt(index);
    prefs.setStringList('ff_improvementList',
        _improvementList.map((x) => x.serialize()).toList());
  }

  void updateImprovementListAtIndex(
    int index,
    ImprovementItemStruct Function(ImprovementItemStruct) updateFn,
  ) {
    _improvementList[index] = updateFn(_improvementList[index]);
    prefs.setStringList('ff_improvementList',
        _improvementList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInImprovementList(
      int index, ImprovementItemStruct value) {
    _improvementList.insert(index, value);
    prefs.setStringList('ff_improvementList',
        _improvementList.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
