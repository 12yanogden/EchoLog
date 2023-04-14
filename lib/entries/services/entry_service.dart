import 'package:echolog/emotion_ratings/models/emotion_rating.dart';
import 'package:echolog/entries/models/entry.dart';
import 'package:echolog/factories/entry_factory.dart';

class EntryService {
  static final EntryService _instance = EntryService._internal();
  final EntryFactory entryFactory = EntryFactory();
  List<Entry> entries = [];

  EntryService._internal();

  factory EntryService() {
    return _instance;
  }

  void lazyLoadEntries() {
    if (entries.isEmpty) entries = entryFactory.makeEntries();
  }

  void addEntry(Entry entry) {
    entries.add(entry);
  }

  List<Entry> getAllEntries() {
    lazyLoadEntries();

    return entries;
  }
}
