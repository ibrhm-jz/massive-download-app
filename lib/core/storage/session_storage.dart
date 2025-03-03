import 'package:shared_preferences/shared_preferences.dart';

class SessionStorage {
  static const String _insertedBookCount = 'inserted_books_count';
  static const String _lastDownloadedPage = 'last_downloaded_page';
  static const String _downloadComplete = 'download_complete';
  static Future<void> saveProgress(
    int insertedBooksCount,
    int lastDownloadedPage,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_insertedBookCount, insertedBooksCount);
    await prefs.setInt(_lastDownloadedPage, lastDownloadedPage);
  }

  static Future<void> saveComplete(bool complete) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_downloadComplete, complete);
  }

  static Future<int> getInsertedBookCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_insertedBookCount) ?? 0;
  }

  static Future<bool> getDownloadComplete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_downloadComplete) ?? false;
  }

  static Future<int> getLastDownloadedPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_lastDownloadedPage) ?? 1;
  }

  static Future<void> clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
