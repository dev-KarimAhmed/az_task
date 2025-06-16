import 'package:az_task/core/services/pref_key.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);
  
   bool get isDarkMode => state;

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(SharedPrefKeys.mode) ?? false;
    emit(isDarkMode);
  }

  Future<void> toggleTheme() async {
    final newState = !state;
    emit(newState);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPrefKeys.mode, newState);
  }
}
