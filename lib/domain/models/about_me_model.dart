class AboutMeModel {
  String preferences;
  String services;
  AboutMeModel({
    required this.preferences,
    required this.services,
  });

  bool isEmpty() {
    return preferences == '' && services == '';
  }
}
