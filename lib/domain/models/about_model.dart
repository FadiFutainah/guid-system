import 'contact_model.dart';

class AboutModel {
  String gender;
  String birthDate;
  String graduateDate;
  String email;
  String address;
  List<ContactModel> contacts;

  AboutModel({
    required this.gender,
    required this.birthDate,
    required this.graduateDate,
    required this.email,
    required this.address,
    required this.contacts,
  });

  int calculateAge() {
    int days = DateTime.now().difference(DateTime.parse(birthDate)).inDays;
    int age = days ~/ 365;
    if (days % 365 > 160) ++age;
    return age;
  }

  String getGender() {
    if (gender == 'M') {
      return 'male';
    }
    return 'female';
  }

  String getGraduateDate() {
    if (graduateDate == '') {
      return 'uncertain';
    }
    return graduateDate;
  }
}
