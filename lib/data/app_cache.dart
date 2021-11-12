import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const kUser = "user";
  static const kisTeacher = "isTeacher";
  static const kisStudent = "isStudent";
  static const kisParent = "isParent";
  static const kOnBoarding = "onBoarding";
  static const kUserID = "userID";
  static const kSchoolID = "schoolID";


  late SharedPreferences _prefs;

  AppCache() {
    initialiseSharedPreferences();
  }

  initialiseSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  setUserLoggedIn() async {
    await _prefs.setBool(kUser, true);
  }

  completeOnBoarding() async {
    await _prefs.setBool(kOnBoarding, true);
  }

  setTeacherLogIn()async{
    await _prefs.setBool(kisTeacher, true);
  }

  setParentLogIn()async{
    await _prefs.setBool(kisParent, true);
  }

  setStudentLogIn()async{
    await _prefs.setBool(kisStudent, true);
  }


  setUserID(String userId)async{
    await _prefs.setString(kUserID, userId.trim());
  }

  setSchoolId(String schoolId)async{
    await _prefs.setString(kSchoolID,schoolId.trim());
  }

  getUserId(){
    return _prefs.getString(kUserID)??"";
  }

  getSchoolId(){
    return _prefs.getString(kSchoolID)??"";
  }

  isStudentLogin(){
    return _prefs.getBool(kisStudent)??false;
  }

  isTeacherLogin(){
    return _prefs.getBool(kisTeacher)??false;
  }

  isParentLogin(){
    return _prefs.getBool(kisParent)??false;
  }

  isUserLoggedIn() {
    return _prefs.getBool(kUser) ?? false;
  }

  didCompleteOnBoarding() async{
    return _prefs.getBool(kOnBoarding) ?? false;
  }

  clearCache(){
    _prefs.setBool(kUser, false);
    _prefs.setBool(kOnBoarding, false);
    _prefs.setBool(kisParent, false);
    _prefs.setBool(kisTeacher, false);
    _prefs.setBool(kisStudent, false);
    _prefs.clear();
  }
}
