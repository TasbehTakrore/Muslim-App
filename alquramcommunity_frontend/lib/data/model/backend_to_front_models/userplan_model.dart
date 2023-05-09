class UserPlan {
  UserPlan({
     this.fiveprays,
     this.Duha,
     this.qiyam,
     this.traweeh,
     this.morning,
     this.evening,
     this.sleeping,
     this.wakingup,
     this.wudu,
     this.praythikr,
     this.readplan,
     this.readAmount,
     this.tadaburplan,
     this.tadaburAmount,
     this.memorizingplan,
     this.memorizingAmount,
  });
  bool?  fiveprays;
  bool?  Duha;
  bool?  qiyam;
  bool?  traweeh;
  bool?  morning;
  bool?  evening;
  bool?  sleeping;
  bool?  wakingup;
  bool?  wudu;
  bool?  praythikr;
  bool?  athanthikr;
  String ?  readplan;
  int ? readAmount;
  String?  tadaburplan;
  int ? tadaburAmount;
  bool?  memorizingplan;
  int ? memorizingAmount;
  
  UserPlan.fromJson(Map<String, dynamic> json){
    fiveprays = json['fiveprays'];
    Duha = json['Duha'];
    qiyam = json['qiyam'];
    traweeh = json['traweeh'];
    morning = json['morning'];
    evening = json['evening'];
    sleeping = json['sleeping'];
    wakingup = json['wakingup'];
    wudu = json['wudu'];
    praythikr = json['praythikr'];
    athanthikr=json['athanthikr'];
    readplan = json['readplan'];
    readAmount = json['read_amount'];
    tadaburplan = json['tadaburplan'];
    tadaburAmount = json['tadabur_amount'];
    memorizingplan = json['memorizingplan'];
    memorizingAmount = json['memorizing_amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fiveprays'] = fiveprays;
    data['Duha'] = Duha;
    data['qiyam'] = qiyam;
    data['traweeh'] = traweeh;
    data['morning'] = morning;
    data['evening'] = evening;
    data['sleeping'] = sleeping;
    data['wakingup'] = wakingup;
    data['wudu'] = wudu;
    data['praythikr'] = praythikr;
    data['athanthikr']=athanthikr;
    data['readplan'] = readplan;
    data['read_amount'] = readAmount;
    data['tadaburplan'] = tadaburplan;
    data['tadabur_amount'] = tadaburAmount;
    data['memorizingplan'] = memorizingplan;
    data['memorizing_amount'] = memorizingAmount;
    return data;
  }
}