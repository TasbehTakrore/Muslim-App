class MistakeModel {
  String? userEmail;
  int? mistakeType;
  int? weight;
  int? surahId;
  int? ayahId;
  int? juzId;
  int? pageId;

  MistakeModel(
      {this.userEmail,
      this.mistakeType,
      this.weight,
      this.surahId,
      this.ayahId,
      this.juzId,
      this.pageId});

  MistakeModel.fromJson(Map<String, dynamic> json) {
    userEmail = json['userEmail'];
    mistakeType = json['mistakeType'];
    weight = json['weight'];
    surahId = json['surahId'];
    ayahId = json['ayahId'];
    juzId = json['juzId'];
    pageId = json['pageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userEmail'] = this.userEmail;
    data['mistakeType'] = this.mistakeType;
    data['weight'] = this.weight;
    data['surahId'] = this.surahId;
    data['ayahId'] = this.ayahId;
    data['juzId'] = this.juzId;
    data['pageId'] = this.pageId;
    return data;
  }
}
