import 'package:cfc_main/core/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../commonWidget/customTextInput.dart';
import 'kycBloc/kyc_bloc.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  String? username;
  String? mobileNumber;
  int currentStep = 0;
  getData() async {
    final storage = await SharedPreferences.getInstance();
    username = storage.getString('name');
    mobileNumber = storage.getString('mobile');
    setState(() {});
  }

  @override
  void initState() {
    getData();
    BlocProvider.of<KycBloc>(context).add(KycEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background2,
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(shrinkWrap: true, children: [
              BlocBuilder<KycBloc, KycState>(builder: (context, state) {
                if (state is KycStateSuccess) {
                  return Stepper(
                      physics: const ClampingScrollPhysics(),
                      type: StepperType.vertical,
                      currentStep: currentStep,
                      onStepTapped: (int index) {
                        setState(() {
                          currentStep =
                              index; // Directly set currentStep to tapped index
                        });
                      },
                      onStepContinue: () {
                        // Check if we are not on the last step, then increment the currentStep
                        if (currentStep < 4) {
                          // Since we have 5 steps (0 to 4)
                          setState(() {
                            currentStep += 1;
                          });
                        }
                      },
                      onStepCancel: () {
                        // Check if we're not already on the first step, then decrement the currentStep
                        if (currentStep > 0) {
                          setState(() {
                            currentStep -= 1;
                          });
                        }
                      },
                      steps: [
                        Step(
                            isActive: currentStep == 0,
                            title:
                                Text(AppLocalizations.of(context)!.accInfoKyc),
                            content: SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .email),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[0].infoType?[1]
                                                .detail?[0].value,
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .mobNum),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[0].infoType?[1]
                                                .detail?[1].value,
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ))),
                        Step(
                            isActive: currentStep == 1,
                            title: Text(
                                AppLocalizations.of(context)!.personalInfoKyc),
                            content: SizedBox(
                                height: 700,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .gender),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[1].infoType?[0]
                                                        .detail?[0].value ==
                                                    "2"
                                                ? "ذكر"
                                                : "انثى",
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .maritalStatus),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[1].infoType?[0]
                                                        .detail?[1].value ==
                                                    "1"
                                                ? "اعزب"
                                                : state.list[1].infoType?[0]
                                                            .detail?[1].value ==
                                                        "2"
                                                    ? "متزوج"
                                                    : state
                                                                .list[1]
                                                                .infoType?[0]
                                                                .detail?[1]
                                                                .value ==
                                                            "3"
                                                        ? "مطلق"
                                                        : "غير ذالك",
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .educationStatus),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            hintText: state.list[1].infoType?[0]
                                                        .detail?[2].value ==
                                                    "1"
                                                ? "دكتوراة"
                                                : state.list[1].infoType?[0]
                                                            .detail?[1].value ==
                                                        "2"
                                                    ? "ماجستير"
                                                    : state
                                                                .list[1]
                                                                .infoType?[0]
                                                                .detail?[1]
                                                                .value ==
                                                            "3"
                                                        ? "دبلوم"
                                                        : state
                                                                    .list[1]
                                                                    .infoType?[
                                                                        0]
                                                                    .detail?[1]
                                                                    .value ==
                                                                "4"
                                                            ? "ثانوية عامه"
                                                            : "اخرى",
                                            secure: false,
                                            readOnly: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .jobStatus),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            hintText: state.list[1].infoType?[0]
                                                        .detail?[3].value ==
                                                    "1"
                                                ? "موظف"
                                                : state.list[1].infoType?[0]
                                                            .detail?[1].value ==
                                                        "2"
                                                    ? "غير موظف"
                                                    : state
                                                                .list[1]
                                                                .infoType?[0]
                                                                .detail?[1]
                                                                .value ==
                                                            "3"
                                                        ? "طالب علم"
                                                        : state
                                                                    .list[1]
                                                                    .infoType?[
                                                                        0]
                                                                    .detail?[1]
                                                                    .value ==
                                                                "4"
                                                            ? "رجل اعمال"
                                                            : "متقاعد",
                                            secure: false,
                                            readOnly: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .familyMem),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            hintText: state.list[1].infoType?[0]
                                                .detail?[4].value,
                                            secure: false,
                                            readOnly: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .natAddress),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[1].infoType![0]
                                                .detail![5].value!,
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .region),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: getNational(state
                                                .list[1]
                                                .infoType![0]
                                                .detail![6]
                                                .value!),
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))),
                        Step(
                            isActive: currentStep == 2,
                            title: Text(
                                AppLocalizations.of(context)!.personalInfoYaq),
                            content: SizedBox(
                                height: 500,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .nationalId),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[2].infoType![1]
                                                .detail![1].value,
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .identityType),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: getNationalType(state
                                                .list[2]
                                                .infoType![1]
                                                .detail![4]
                                                .value),
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .bthDate),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[2].infoType![1]
                                                            .detail![5].value ==
                                                        "" ||
                                                    state.list[2].infoType![1]
                                                            .detail![5].value ==
                                                        null
                                                ? "${state.list[2].infoType![1].detail![4].value}-${state.list[2].infoType![1].detail![3].value}-${state.list[2].infoType![1].detail![2].value}"
                                                : state.list[2].infoType![1]
                                                    .detail![5].value,
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .nameE),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[2].infoType![1]
                                                .detail![6].value,
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .nameA),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[2].infoType![1]
                                                .detail![7].value,
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))),
                        Step(
                            isActive: currentStep == 3,
                            title: Text(
                                AppLocalizations.of(context)!.personalInfoFinc),
                            content: SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .bankNum),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Customtextinput(
                                            readOnly: true,
                                            hintText: state.list[3].infoType![1]
                                                .detail![0].value,
                                            secure: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height: 100,
                                        child: radioButton(
                                            state.list[3].infoType![1]
                                                .detail![2].value!,
                                            AppLocalizations.of(context)!
                                                .annuIncme)),
                                  ],
                                ))),
                        Step(
                            isActive: currentStep == 3,
                            title: Text(AppLocalizations.of(context)!.quest),
                            content: SizedBox(
                                height: 970,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 130,
                                        child: radioButton(
                                            state.list[4].infoType![0]
                                                .detail![0].value!,
                                            "هل سبق لكم العمل في القطاع المالي خلال السنوات الخمس الماضيه ؟")),
                                    SizedBox(
                                        height: 130,
                                        child: radioButton(
                                            state.list[4].infoType![0]
                                                .detail![1].value!,
                                            " ؟ هل لديك اي خبرات عملية اخرى ذات صلة بالقطاع المالي")),
                                    SizedBox(
                                        height: 130,
                                        child: radioButton(
                                            state.list[4].infoType![0]
                                                .detail![2].value!,
                                            "هل انت عضو في مجلس ادارة او لجنه مراجعة او احد الكبار التنفيذين في شركة مدرجة ")),
                                    SizedBox(
                                        height: 130,
                                        child: radioButton(
                                            state.list[4].infoType![0]
                                                .detail![3].value!,
                                            "هل انت ذو علاقة بعضو مجلس ادارة او لجنة مراجهة او احد الكبار التنفيذين في شركة مدرجة؟ ")),
                                    SizedBox(
                                        height: 130,
                                        child: radioButton(
                                            state.list[4].infoType![0]
                                                .detail![4].value!,
                                            "هل انت مكلف مهمات عليا في المملكة او دولة اجنبية او مناصب ادارية عليا او وظيفة في المنظمات الدولية ؟ ")),
                                    SizedBox(
                                        height: 170,
                                        child: radioButton(
                                            state.list[4].infoType![0]
                                                .detail![5].value!,
                                            "هل لديك صلة قرابة بدابطة الدم او الزواج وصولا الي الدرجة الثانية او مقربا من شخص مكلف بمهمات عليا في المملكة او دولة اجنبية او مناصب اداة عليا او في وظيفة في المنظمات الدولية ؟ ")),
                                    SizedBox(
                                        height: 140,
                                        child: radioButton(
                                            state.list[4].infoType![0]
                                                .detail![7].value!,
                                            "هل لديك شهادة التعامل بالاوراق المالية ؟ ")),
                                  ],
                                ))),
                      ]);
                } else if (state is KycStateFailed) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 70,
                          child: Icon(
                            Icons.person,
                            size: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Customtextinput(
                          hintText: username,
                          secure: false,
                          readOnly: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Customtextinput(
                          hintText: mobileNumber,
                          secure: false,
                          readOnly: true,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3),
                        Text(
                          AppLocalizations.of(context)!.applyNow,
                          style: const TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
            ])));
  }

  getNational(String? type) {
    if (type == "1") {
      return "الرياض";
    } else if (type == "2") {
      return "المنطق{ الشرقيه";
    } else if (type == "3") {
      return "مكة المكرمة";
    } else if (type == "4") {
      return "المدينة المنورة";
    } else if (type == "5") {
      return "القصيم";
    } else if (type == "6") {
      return "عسير";
    } else if (type == "7") {
      return "تبوك";
    } else if (type == "8") {
      return "حائل";
    } else if (type == "9") {
      return "الحدود الشمالية";
    } else if (type == "10") {
      return "جازان";
    } else if (type == "10") {
      return "نجران";
    } else if (type == "10") {
      return "الباحة";
    } else if (type == "10") {
      return "الجوف";
    } else {
      return "غير ذالك";
    }
  }

  getNationalType(String? type) {
    if (type == "1") {
      return "سعودي";
    } else if (type == "2") {
      return "مقيم";
    } else if (type == "3") {
      return "مجلس التعاون الخليجي";
    } else {
      return "غير ذالك";
    }
  }

  radioButton(String selectedAnswer, String text) {
    String displayValue = selectedAnswer == "1" ? 'Yes' : 'No';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: const TextStyle(fontSize: 16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio<String>(
              value: "1", // Represents "Yes"
              groupValue: selectedAnswer,
              onChanged: null, // Disable interaction
            ),
            const Text('Yes'),
            Radio<String>(
              value: "0", // Represents "No"
              groupValue: selectedAnswer,
              onChanged: null, // Disable interaction
            ),
            const Text('No'),
          ],
        ),
      ],
    );
  }
}
