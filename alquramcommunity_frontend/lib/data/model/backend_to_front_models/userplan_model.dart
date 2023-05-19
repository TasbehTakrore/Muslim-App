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
     this.athanthikr,
     this.readplan,
     this.readAmount,
     this.tadaburplan,
     this.tadaburAmount,
     this.memorizingplan,
     this.memorizingAmount,
     this.fivepraysF,
     this.DuhaF,
     this.qiyamF,
     this.traweehF,
     this.morningF,
     this.eveningF,
     this.sleepingF,
     this.wakingupF,
     this.wuduF,
     this.praythikrF,
     this.athanthikrF,
     this.read_amountCount,
     this.tadabur_amountCount,
     this.memorizing_amountCount,
     this.plan_id,
  });

   bool? fiveprays;
   bool? Duha;
   bool? qiyam;
   bool? traweeh;
   bool? morning;
   bool? evening;
   bool? sleeping;
   bool? wakingup;
   bool? wudu;
   bool? praythikr;
   bool? athanthikr;
   String? readplan;
   int ? readAmount;
   String ? tadaburplan;
   int ?tadaburAmount;
   bool? memorizingplan;
   int ?memorizingAmount;
   bool? fivepraysF;
   bool? DuhaF;
   bool? qiyamF;
   bool? traweehF;
   bool ?morningF;
   bool? eveningF;
   bool? sleepingF;
   bool? wakingupF;
   bool? wuduF;
   bool? praythikrF;
   bool? athanthikrF;
   int? read_amountCount;
   int? tadabur_amountCount;
   int ?memorizing_amountCount;
   int?plan_id;

  UserPlan.fromJson(Map<String, dynamic> json) {
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
  athanthikr = json['athanthikr'];
  readplan = json['readplan'];
  readAmount = json['read_amount'];
  tadaburplan = json['tadaburplan'];
  tadaburAmount = json['tadabur_amount'];
  memorizingplan = json['memorizingplan'];
  memorizingAmount = json['memorizing_amount'];
  fivepraysF = json['fivepraysF'];
  DuhaF = json['DuhaF'];
  qiyamF = json['qiyamF'];
  traweehF = json['traweehF'];
  morningF = json['morningF'];
  eveningF = json['eveningF'];
  sleepingF = json['sleepingF'];
  wakingupF = json['wakingupF'];
  wuduF = json['wuduF'];
  praythikrF = json['praythikrF'];
  athanthikrF = json['athanthikrF'];
  read_amountCount = json['read_amountCount'];
  tadabur_amountCount = json['tadabur_amountCount'];
  memorizing_amountCount = json['memorizing_amountCount'];
  plan_id = json['plan_id'];

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
  data['athanthikr'] = athanthikr;
  data['readplan'] = readplan;
  data['read_amount'] = readAmount;
  data['tadaburplan'] = tadaburplan;
  data['tadabur_amount'] = tadaburAmount;
  data['memorizingplan'] = memorizingplan;
  data['memorizing_amount'] = memorizingAmount;
  data['fivepraysF'] = fivepraysF;
  data['DuhaF'] = DuhaF;
  data['qiyamF'] = qiyamF;
  data['traweehF'] = traweehF;
  data['morningF'] = morningF;
  data['eveningF'] = eveningF;
  data['sleepingF'] = sleepingF;
  data['wakingupF'] = wakingupF;
  data['wuduF'] = wuduF;
  data['praythikrF'] = praythikrF;
  data['athanthikrF'] = athanthikrF;
  data['read_amountCount'] = read_amountCount;
  data['tadabur_amountCount'] = tadabur_amountCount;
  data['memorizing_amountCount'] = memorizing_amountCount;
  data['plan_id']=plan_id;
  return data;
}

}