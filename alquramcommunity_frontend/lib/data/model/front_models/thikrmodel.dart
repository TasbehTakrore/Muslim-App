class Athkar {
  List<Thikr>? thikr;

  Athkar({this.thikr});

  Athkar.fromJson(Map<String, dynamic> json) {
    if (json['Thikr'] != null) {
      thikr = <Thikr>[];
      json['Thikr'].forEach((v) {
        thikr!.add(new Thikr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thikr != null) {
      data['Thikr'] = this.thikr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Thikr {
  int? iD;
  String? tITLE;
  String? aUDIOURL;
  List<TEXT>? tEXT;

  Thikr({this.iD, this.tITLE, this.aUDIOURL, this.tEXT});

  Thikr.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tITLE = json['TITLE'];
    aUDIOURL = json['AUDIO_URL'];
    if (json['TEXT'] != null) {
      tEXT = <TEXT>[];
      json['TEXT'].forEach((v) {
        tEXT!.add(new TEXT.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['TITLE'] = this.tITLE;
    data['AUDIO_URL'] = this.aUDIOURL;
    if (this.tEXT != null) {
      data['TEXT'] = this.tEXT!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TEXT {
  int? iD;
  String? aRABICTEXT;
  String? lANGUAGEARABICTRANSLATEDTEXT;
  String? tRANSLATEDTEXT;
  int? rEPEAT;
  String? aUDIO;
  String? text;

  TEXT(
      {this.iD,
      this.aRABICTEXT,
      this.lANGUAGEARABICTRANSLATEDTEXT,
      this.tRANSLATEDTEXT,
      this.rEPEAT,
      this.aUDIO,
      this.text});

  TEXT.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    aRABICTEXT = json['ARABIC_TEXT'];
    lANGUAGEARABICTRANSLATEDTEXT = json['LANGUAGE_ARABIC_TRANSLATED_TEXT'];
    tRANSLATEDTEXT = json['TRANSLATED_TEXT'];
    rEPEAT = json['REPEAT'];
    aUDIO = json['AUDIO'];
    text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ARABIC_TEXT'] = this.aRABICTEXT;
    data['LANGUAGE_ARABIC_TRANSLATED_TEXT'] = this.lANGUAGEARABICTRANSLATEDTEXT;
    data['TRANSLATED_TEXT'] = this.tRANSLATEDTEXT;
    data['REPEAT'] = this.rEPEAT;
    data['AUDIO'] = this.aUDIO;
    data['Text'] = this.text;
    return data;
  }
}
