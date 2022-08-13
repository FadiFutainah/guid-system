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
}
