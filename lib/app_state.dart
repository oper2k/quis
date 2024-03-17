import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
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
        '{\"name\":\"CV Writing Service\",\"priceKarma\":\"0\",\"price\":\"300\",\"has_attach\":\"true\"}')),
    ServiceStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"1x1 Coaching \",\"priceKarma\":\"0\",\"price\":\"500\"}')),
    ServiceStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Mock up Recruiter Interview\",\"priceKarma\":\"0\",\"price\":\"500\"}'))
  ];
  List<ServiceStruct> get addOns => _addOns;
  set addOns(List<ServiceStruct> _value) {
    _addOns = _value;
  }

  void addToAddOns(ServiceStruct _value) {
    _addOns.add(_value);
  }

  void removeFromAddOns(ServiceStruct _value) {
    _addOns.remove(_value);
  }

  void removeAtIndexFromAddOns(int _index) {
    _addOns.removeAt(_index);
  }

  void updateAddOnsAtIndex(
    int _index,
    ServiceStruct Function(ServiceStruct) updateFn,
  ) {
    _addOns[_index] = updateFn(_addOns[_index]);
  }

  void insertAtIndexInAddOns(int _index, ServiceStruct _value) {
    _addOns.insert(_index, _value);
  }

  List<ServiceStruct> _MockInterviewServices = [
    ServiceStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Mock Interview\",\"priceKarma\":\"30\",\"price\":\"0\"}')),
    ServiceStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"1х1 Coaching session\",\"priceKarma\":\"35\",\"price\":\"0\"}'))
  ];
  List<ServiceStruct> get MockInterviewServices => _MockInterviewServices;
  set MockInterviewServices(List<ServiceStruct> _value) {
    _MockInterviewServices = _value;
  }

  void addToMockInterviewServices(ServiceStruct _value) {
    _MockInterviewServices.add(_value);
  }

  void removeFromMockInterviewServices(ServiceStruct _value) {
    _MockInterviewServices.remove(_value);
  }

  void removeAtIndexFromMockInterviewServices(int _index) {
    _MockInterviewServices.removeAt(_index);
  }

  void updateMockInterviewServicesAtIndex(
    int _index,
    ServiceStruct Function(ServiceStruct) updateFn,
  ) {
    _MockInterviewServices[_index] = updateFn(_MockInterviewServices[_index]);
  }

  void insertAtIndexInMockInterviewServices(int _index, ServiceStruct _value) {
    _MockInterviewServices.insert(_index, _value);
  }

  DocumentReference? _VideoOfTheDay;
  DocumentReference? get VideoOfTheDay => _VideoOfTheDay;
  set VideoOfTheDay(DocumentReference? _value) {
    _VideoOfTheDay = _value;
    _value != null
        ? prefs.setString('ff_VideoOfTheDay', _value.path)
        : prefs.remove('ff_VideoOfTheDay');
  }

  List<String> _interviewRoles = ['Waiter'];
  List<String> get interviewRoles => _interviewRoles;
  set interviewRoles(List<String> _value) {
    _interviewRoles = _value;
  }

  void addToInterviewRoles(String _value) {
    _interviewRoles.add(_value);
  }

  void removeFromInterviewRoles(String _value) {
    _interviewRoles.remove(_value);
  }

  void removeAtIndexFromInterviewRoles(int _index) {
    _interviewRoles.removeAt(_index);
  }

  void updateInterviewRolesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _interviewRoles[_index] = updateFn(_interviewRoles[_index]);
  }

  void insertAtIndexInInterviewRoles(int _index, String _value) {
    _interviewRoles.insert(_index, _value);
  }

  List<String> _filterRoleList = [
    'Waiter',
    'Manager',
    'Hostess/ Host',
    'Bartender',
    'Supervisor',
    'Cabin Crew'
  ];
  List<String> get filterRoleList => _filterRoleList;
  set filterRoleList(List<String> _value) {
    _filterRoleList = _value;
  }

  void addToFilterRoleList(String _value) {
    _filterRoleList.add(_value);
  }

  void removeFromFilterRoleList(String _value) {
    _filterRoleList.remove(_value);
  }

  void removeAtIndexFromFilterRoleList(int _index) {
    _filterRoleList.removeAt(_index);
  }

  void updateFilterRoleListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _filterRoleList[_index] = updateFn(_filterRoleList[_index]);
  }

  void insertAtIndexInFilterRoleList(int _index, String _value) {
    _filterRoleList.insert(_index, _value);
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
  set supportTopicList(List<String> _value) {
    _supportTopicList = _value;
  }

  void addToSupportTopicList(String _value) {
    _supportTopicList.add(_value);
  }

  void removeFromSupportTopicList(String _value) {
    _supportTopicList.remove(_value);
  }

  void removeAtIndexFromSupportTopicList(int _index) {
    _supportTopicList.removeAt(_index);
  }

  void updateSupportTopicListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _supportTopicList[_index] = updateFn(_supportTopicList[_index]);
  }

  void insertAtIndexInSupportTopicList(int _index, String _value) {
    _supportTopicList.insert(_index, _value);
  }

  DocumentReference? _refUser;
  DocumentReference? get refUser => _refUser;
  set refUser(DocumentReference? _value) {
    _refUser = _value;
    _value != null
        ? prefs.setString('ff_refUser', _value.path)
        : prefs.remove('ff_refUser');
  }

  List<String> _questionStage = [
    'Pre-screening',
    'In-person',
    'Role-play game',
    'Final Interview'
  ];
  List<String> get questionStage => _questionStage;
  set questionStage(List<String> _value) {
    _questionStage = _value;
  }

  void addToQuestionStage(String _value) {
    _questionStage.add(_value);
  }

  void removeFromQuestionStage(String _value) {
    _questionStage.remove(_value);
  }

  void removeAtIndexFromQuestionStage(int _index) {
    _questionStage.removeAt(_index);
  }

  void updateQuestionStageAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _questionStage[_index] = updateFn(_questionStage[_index]);
  }

  void insertAtIndexInQuestionStage(int _index, String _value) {
    _questionStage.insert(_index, _value);
  }

  List<String> _questionRound = ['Yes', 'No', 'I’m waiting for feedback'];
  List<String> get questionRound => _questionRound;
  set questionRound(List<String> _value) {
    _questionRound = _value;
  }

  void addToQuestionRound(String _value) {
    _questionRound.add(_value);
  }

  void removeFromQuestionRound(String _value) {
    _questionRound.remove(_value);
  }

  void removeAtIndexFromQuestionRound(int _index) {
    _questionRound.removeAt(_index);
  }

  void updateQuestionRoundAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _questionRound[_index] = updateFn(_questionRound[_index]);
  }

  void insertAtIndexInQuestionRound(int _index, String _value) {
    _questionRound.insert(_index, _value);
  }

  String _entitlementID = 'Premium';
  String get entitlementID => _entitlementID;
  set entitlementID(String _value) {
    _entitlementID = _value;
    prefs.setString('ff_entitlementID', _value);
  }

  int _dailyNotificationID = 0;
  int get dailyNotificationID => _dailyNotificationID;
  set dailyNotificationID(int _value) {
    _dailyNotificationID = _value;
    prefs.setInt('ff_dailyNotificationID', _value);
  }

  DateTime? _lastloginTime;
  DateTime? get lastloginTime => _lastloginTime;
  set lastloginTime(DateTime? _value) {
    _lastloginTime = _value;
    _value != null
        ? prefs.setInt('ff_lastloginTime', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastloginTime');
  }

  int _lastLoginNotificationID = 0;
  int get lastLoginNotificationID => _lastLoginNotificationID;
  set lastLoginNotificationID(int _value) {
    _lastLoginNotificationID = _value;
    prefs.setInt('ff_lastLoginNotificationID', _value);
  }

  bool _IslastLoginHappened = false;
  bool get IslastLoginHappened => _IslastLoginHappened;
  set IslastLoginHappened(bool _value) {
    _IslastLoginHappened = _value;
    prefs.setBool('ff_IslastLoginHappened', _value);
  }

  List<ImprovementItemStruct> _improvementList = [
    ImprovementItemStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Interview Process Awareness 💡\",\"description\":\" \",\"sort\":\"1\"}')),
    ImprovementItemStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Get out from feeling of stuck 🤝 \",\"description\":\" \",\"sort\":\"3\"}')),
    ImprovementItemStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Get more Confidence 🍀\",\"description\":\" \",\"sort\":\"3\"}')),
    ImprovementItemStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Interview Questions 💬\",\"description\":\"Many failed because they did not know what to expect. We aim to change that!\",\"sort\":\"4\"}'))
  ];
  List<ImprovementItemStruct> get improvementList => _improvementList;
  set improvementList(List<ImprovementItemStruct> _value) {
    _improvementList = _value;
    prefs.setStringList(
        'ff_improvementList', _value.map((x) => x.serialize()).toList());
  }

  void addToImprovementList(ImprovementItemStruct _value) {
    _improvementList.add(_value);
    prefs.setStringList('ff_improvementList',
        _improvementList.map((x) => x.serialize()).toList());
  }

  void removeFromImprovementList(ImprovementItemStruct _value) {
    _improvementList.remove(_value);
    prefs.setStringList('ff_improvementList',
        _improvementList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromImprovementList(int _index) {
    _improvementList.removeAt(_index);
    prefs.setStringList('ff_improvementList',
        _improvementList.map((x) => x.serialize()).toList());
  }

  void updateImprovementListAtIndex(
    int _index,
    ImprovementItemStruct Function(ImprovementItemStruct) updateFn,
  ) {
    _improvementList[_index] = updateFn(_improvementList[_index]);
    prefs.setStringList('ff_improvementList',
        _improvementList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInImprovementList(
      int _index, ImprovementItemStruct _value) {
    _improvementList.insert(_index, _value);
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
