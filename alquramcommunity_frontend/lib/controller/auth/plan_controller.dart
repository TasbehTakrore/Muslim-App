import 'package:get/get.dart';

class PlanController extends GetxController {
  Rx<bool> mainPrayCheckValue = false.obs;
  Rx<bool> fivePrayCheckValue = false.obs;
  Rx<bool> fivePrayVisibleValue = false.obs;
  Rx<bool> duhaCheckValue = false.obs;
  Rx<bool> duhaVisibleValue = false.obs;
  Rx<bool> qeiamCheckValue = false.obs;
  Rx<bool> qeiamVisibleValue = false.obs;
  Rx<bool> addFivePray = false.obs;
  Rx<bool> addDuha = false.obs;
  Rx<bool> addQeiam = false.obs;

  int prayPalnCount = 0;
  int prayPalnCheckCount = 0;
  addFivePrayFunc(bool val) {
    addFivePray.value = val;
    fivePrayVisibleValue.value = val;
    if (val == true)
      prayPalnCount++;
    else {
      prayPalnCount--;
      if (prayPalnCount == 0) mainPrayCheckValue.value = false;
    }
    update();
  }

  addDuhaFunc(bool val) {
    addDuha.value = val;
    duhaVisibleValue.value = val;
    if (val == true)
      prayPalnCount++;
    else {
      prayPalnCount--;
      if (prayPalnCount == 0) mainPrayCheckValue.value = false;
    }
    update();
  }

  addQeiamFunc(bool val) {
    addQeiam.value = val;
    qeiamVisibleValue.value = val;
    if (val == true)
      prayPalnCount++;
    else {
      prayPalnCount--;
      if (prayPalnCount == 0) mainPrayCheckValue.value = false;
    }
    update();
  }

  changeMainPrayCheck(bool val) {
    if (prayPalnCount > 0) {
      mainPrayCheckValue.value = val;
      fivePrayCheckValue.value = val;
      duhaCheckValue.value = val;
      qeiamCheckValue.value = val;
    }
    update();
  }

  changeFivePrayCheck(bool val) {
    fivePrayCheckValue.value = val;
    // if (val == true)
    //   prayPalnCheckCount++;
    // else
    //   prayPalnCheckCount--;
    // if (prayPalnCount > prayPalnCheckCount) mainPrayCheckValue.value = false;

    update();
  }

  changeDuhaCheck(bool val) {
    duhaCheckValue.value = val;
    update();
  }

  changeQeiamCheck(bool val) {
    qeiamCheckValue.value = val;
    update();
  }

  Rx<bool> mainThikrCheckValue = false.obs;
  Rx<bool> sapahThikrCheckValue = false.obs;
  Rx<bool> sapahThikrVisibleValue = false.obs;
  Rx<bool> addSapahThikr = false.obs;
  Rx<bool> masaThikrCheckValue = false.obs;
  Rx<bool> masaThikrVisibleValue = false.obs;
  Rx<bool> addmasaThikr = false.obs;
  Rx<bool> wakeUpCheckValue = false.obs;
  Rx<bool> wakeUpVisibleValue = false.obs;
  Rx<bool> addwakeUp = false.obs;

  Rx<bool> sleepCheckValue = false.obs;
  Rx<bool> sleepVisibleValue = false.obs;
  Rx<bool> addsleep = false.obs;

  // Rx<bool> duhaCheckValue = false.obs;
  // Rx<bool> duhaVisibleValue = false.obs;
  // Rx<bool> qeiamCheckValue = false.obs;
  // Rx<bool> qeiamVisibleValue = false.obs;
  // Rx<bool> addDuha = false.obs;
  // Rx<bool> addQeiam = false.obs;

  int thikrPalnCount = 0;

  changeMainThikrCheck(bool val) {
    print(thikrPalnCount);
    if (thikrPalnCount > 0) {
      mainThikrCheckValue.value = val;
      masaThikrCheckValue.value = val;
      sapahThikrCheckValue.value = val;
      wakeUpCheckValue.value = val;
      sleepCheckValue.value = val;
      adhanCheckValue.value = val;
      wodooCheckValue.value = val;
      salahThikrCheckValue.value = val;
      // qeiamCheckValue.value = val;
    }
    update();
  }

  addSapahThikeFunc(bool val) {
    addSapahThikr.value = val;
    sapahThikrVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
      // else if (thikrPalnCount < 7) mainPrayCheckValue.value = false;
    }
    update();
  }

  changeSapahThikrCheck(bool val) {
    sapahThikrCheckValue.value = val;
    update();
  }

  addmasaThikeFunc(bool val) {
    addmasaThikr.value = val;
    masaThikrVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changemasaThikrCheck(bool val) {
    masaThikrCheckValue.value = val;
    update();
  }

  addwakeUpFunc(bool val) {
    addwakeUp.value = val;
    wakeUpVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changewakeUpCheck(bool val) {
    wakeUpCheckValue.value = val;
    update();
  }

  addsleepFunc(bool val) {
    addsleep.value = val;
    sleepVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changesleepCheck(bool val) {
    sleepCheckValue.value = val;
    update();
  }

  Rx<bool> adhanCheckValue = false.obs;
  Rx<bool> adhanVisibleValue = false.obs;
  Rx<bool> addadhan = false.obs;

  addadhanFunc(bool val) {
    addadhan.value = val;
    adhanVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changeadhanCheck(bool val) {
    adhanCheckValue.value = val;
    update();
  }

  Rx<bool> wodooCheckValue = false.obs;
  Rx<bool> wodooVisibleValue = false.obs;
  Rx<bool> addwodoo = false.obs;

  addwodooFunc(bool val) {
    addwodoo.value = val;
    wodooVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changewodooCheck(bool val) {
    wodooCheckValue.value = val;
    update();
  }

  Rx<bool> salahThikrCheckValue = false.obs;
  Rx<bool> salahThikrVisibleValue = false.obs;
  Rx<bool> addsalahThikr = false.obs;

  addsalahThikrFunc(bool val) {
    addsalahThikr.value = val;
    salahThikrVisibleValue.value = val;
    if (val == true)
      thikrPalnCount++;
    else {
      thikrPalnCount--;
      if (thikrPalnCount == 0) mainThikrCheckValue.value = false;
    }
    update();
  }

  changesalahThikrCheck(bool val) {
    salahThikrCheckValue.value = val;
    update();
  }
}