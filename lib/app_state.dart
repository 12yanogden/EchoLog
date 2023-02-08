import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _emotions = prefs.getStringList('ff_emotions')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _emotions;
    _entries = prefs.getStringList('ff_entries')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _entries;
    _dailySummaries = prefs.getStringList('ff_dailySummaries')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _dailySummaries;
    _emotionsMaxCount =
        prefs.getInt('ff_emotionsMaxCount') ?? _emotionsMaxCount;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _emotions = [
    jsonDecode(
        '{\"name\":\"Positive\",\"color\":\"#FFFF00\",\"icon\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/echo-log-higss2/assets/71gxpodczcef/positive.png\"}'),
    jsonDecode(
        '{\"name\":\"Slightly Embarrassed\",\"color\":\"#00FFFF\",\"icon\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/echo-log-higss2/assets/3nea6crd8awe/slightly_embarrassed.png\"}'),
    jsonDecode(
        '{\"name\":\"Super Embarrassed\",\"color\":\"#FF00FF\",\"icon\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/echo-log-higss2/assets/aomvnaovc8jo/super_embarrassed.png\"}'),
    jsonDecode(
        '{\"name\":\"Put Off\",\"color\":\"#CCCCCC\",\"icon\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/echo-log-higss2/assets/g2xjmlyi8mvf/put_off.png\"}')
  ];
  List<dynamic> get emotions => _emotions;
  set emotions(List<dynamic> _value) {
    _emotions = _value;
    prefs.setStringList(
        'ff_emotions', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToEmotions(dynamic _value) {
    _emotions.add(_value);
    prefs.setStringList(
        'ff_emotions', _emotions.map((x) => jsonEncode(x)).toList());
  }

  void removeFromEmotions(dynamic _value) {
    _emotions.remove(_value);
    prefs.setStringList(
        'ff_emotions', _emotions.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _entries = [];
  List<dynamic> get entries => _entries;
  set entries(List<dynamic> _value) {
    _entries = _value;
    prefs.setStringList(
        'ff_entries', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToEntries(dynamic _value) {
    _entries.add(_value);
    prefs.setStringList(
        'ff_entries', _entries.map((x) => jsonEncode(x)).toList());
  }

  void removeFromEntries(dynamic _value) {
    _entries.remove(_value);
    prefs.setStringList(
        'ff_entries', _entries.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _dailySummaries = [];
  List<dynamic> get dailySummaries => _dailySummaries;
  set dailySummaries(List<dynamic> _value) {
    _dailySummaries = _value;
    prefs.setStringList(
        'ff_dailySummaries', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToDailySummaries(dynamic _value) {
    _dailySummaries.add(_value);
    prefs.setStringList('ff_dailySummaries',
        _dailySummaries.map((x) => jsonEncode(x)).toList());
  }

  void removeFromDailySummaries(dynamic _value) {
    _dailySummaries.remove(_value);
    prefs.setStringList('ff_dailySummaries',
        _dailySummaries.map((x) => jsonEncode(x)).toList());
  }

  int _emotionsMaxCount = 5;
  int get emotionsMaxCount => _emotionsMaxCount;
  set emotionsMaxCount(int _value) {
    _emotionsMaxCount = _value;
    prefs.setInt('ff_emotionsMaxCount', _value);
  }

  String _micState = 'NOT_RECORDING';
  String get micState => _micState;
  set micState(String _value) {
    _micState = _value;
  }

  DateTime? _today;
  DateTime? get today => _today;
  set today(DateTime? _value) {
    _today = _value;
  }

  bool _showDarkScreen = false;
  bool get showDarkScreen => _showDarkScreen;
  set showDarkScreen(bool _value) {
    _showDarkScreen = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
