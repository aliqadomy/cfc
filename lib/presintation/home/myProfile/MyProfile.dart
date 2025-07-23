import 'package:cfc_main/core/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../domain/model/wallet/banks.dart';
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

  final List<String> _dropdownMartialStatus =
  ['متزوج', 'اعزب', 'مطلق', 'ارمل'];
  final List<String> _dropdownRegions = [
    'الرياض',
    'المنطقة الشرقية',
    'مكة المكرمة',
    'المدينة المنورة',
    'القصيم',
    'عسير',
    'تبوك',
    'حائل',
    'الحدود الشمالية',
    'جازان',
    'نجران',
    'الباحة',
    'الجوف',
  ];
  final List<String> _dropdownIndividualIdentityType = [
    'سعودي',
    'مقيم',
    'مجلس التعاون الخليجي',
  ];
  final List<String> _dropdownJobStatus = [
    'موظف',
    'غير موظف',
    'طالب علم',
    'رجل اعمال',
    'متقاعد'
  ];
  final List<String> _dropdownEducation = [
    'دكتوراة',
    'ماجستير',
    'بكالوريس',
    'دبلوم',
    'ثانوية عامة',
    'اخرى'
  ];
  final List<String> _dropdownGender = [
    "ذكر",
    "انثى"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background2,
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(shrinkWrap: true, children: [
              BlocBuilder<KycBloc, KycState>(builder: (context, state) {
                if (state is KycStateSuccess) {
                  // print(state.list[1].infoType[3].detail[0].value);
                  return state.list[1].infoType![0].detail![5].value == null
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 100),
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.2),
                              Text(
                                AppLocalizations.of(context)!.applyNow,
                                style: const TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        )
                      : Stepper(
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
                                  title: Text(
                                      AppLocalizations.of(context)!.accInfoKyc),
                                  content: SizedBox(
                                    height: MediaQuery.of(context).size.height*0.27,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.13,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .email),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: state
                                                      .list[0]
                                                      .infoType?[1]
                                                      .detail?[0]
                                                      .value,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .mobNum),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: state
                                                      .list[0]
                                                      .infoType?[1]
                                                      .detail?[1]
                                                      .value,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ))),
                              Step(
                                  isActive: currentStep == 1,
                                  title: Text(AppLocalizations.of(context)!
                                      .personalInfoKyc),
                                  content: SizedBox(
                                     height: MediaQuery.of(context).size.height*0.87,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .gender),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: _dropdownGender[
                                                      int.tryParse(state
                                                              .list[1]
                                                              .infoType![0]
                                                              .detail![2]
                                                              .value!)!-1],
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .maritalStatus),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText:
                                                      _dropdownMartialStatus[
                                                          int.tryParse(state
                                                                  .list[1]
                                                                  .infoType![0]
                                                                  .detail![0]
                                                                  .value!)! -
                                                              1],
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .educationStatus),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  hintText: _dropdownEducation[
                                                      int.tryParse(state
                                                          .list[1]
                                                          .infoType![0]
                                                          .detail![3]
                                                          .value!)!-1],
                                                  secure: false,
                                                  readOnly: true,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .jobStatus),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  hintText: _dropdownJobStatus[
                                                      int.tryParse(state
                                                          .list[1]
                                                          .infoType![0]
                                                          .detail![4]
                                                          .value!)!-1],
                                                  secure: false,
                                                  readOnly: true,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .familyMem),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  hintText: (int.tryParse(state
                                                              .list[1]
                                                              .infoType![0]
                                                              .detail![1]
                                                              .value!)!)
                                                      .toString(),
                                                  secure: false,
                                                  readOnly: true,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .natAddress),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: state
                                                      .list[1]
                                                      .infoType![0]
                                                      .detail![5]
                                                      .value!,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .region),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: _dropdownRegions[
                                                  int.tryParse(state
                                                      .list[1]
                                                      .infoType![0]
                                                      .detail![6]
                                                      .value!)!-1
                                                  ],
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))),
                              Step(
                                  isActive: currentStep == 2,
                                  title: Text(AppLocalizations.of(context)!
                                      .personalInfoYaq),
                                  content: SizedBox(
                                      height: MediaQuery.of(context).size.height*0.6,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .nationalId),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: state
                                                      .list[2]
                                                      .infoType![1]
                                                      .detail![1]
                                                      .value,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .identityType),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: _dropdownIndividualIdentityType[int.tryParse(state.list[2].infoType![1]
                                                      .detail![0].value!)!-1]
                                                  ,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .bthDate),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: state
                                                                  .list[2]
                                                                  .infoType![1]
                                                                  .detail![5]
                                                                  .value ==
                                                              "" ||
                                                          state
                                                                  .list[2]
                                                                  .infoType![1]
                                                                  .detail![5]
                                                                  .value ==
                                                              null
                                                      ? "${state.list[2].infoType![1].detail![4].value}-${state.list[2].infoType![1].detail![3].value}-${state.list[2].infoType![1].detail![2].value}"
                                                      : state
                                                          .list[2]
                                                          .infoType![1]
                                                          .detail![5]
                                                          .value,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .nameE),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: state
                                                      .list[2]
                                                      .infoType![1]
                                                      .detail![6]
                                                      .value,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .nameA),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: state
                                                      .list[2]
                                                      .infoType![1]
                                                      .detail![7]
                                                      .value,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))),
                              Step(
                                  isActive: currentStep == 3,
                                  title: Text(AppLocalizations.of(context)!
                                      .personalInfoFinc),
                                  content: SizedBox(
                                      height: MediaQuery.of(context).size.height*0.35,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.12,
                                            width:
                                            MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(AppLocalizations.of(context)!.bank),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText:Banks.banks[int.tryParse(state.list[3].infoType![1]
                                                      .detail![1].value!)!-1]
                                                  ['nameAr'] ,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                                     height: MediaQuery.of(context).size.height*0.12,
                                            child: Column(
                                              children: [
                                                Text(AppLocalizations.of(
                                                        context)!
                                                    .bankNum),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Customtextinput(
                                                  readOnly: true,
                                                  hintText: state
                                                      .list[3]
                                                      .infoType![1]
                                                      .detail![0]
                                                      .value,
                                                  secure: false,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context).size.height*0.11,
                                              child: radioButton(
                                                  state.list[3].infoType![1]
                                                      .detail![2].value!,
                                                  AppLocalizations.of(context)!
                                                      .annuIncme)),
                                        ],
                                      ))),
                              Step(
                                  isActive: currentStep == 3,
                                  title:
                                      Text(AppLocalizations.of(context)!.quest),
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
                                                  "هل لديك صلة قرابة برابطة الدم او الزواج وصولا الي الدرجة الثانية او مقربا من شخص مكلف بمهمات عليا في المملكة او دولة اجنبية او مناصب اداة عليا او في وظيفة في المنظمات الدولية ؟ ")),
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
    } else if (type == "11") {
      return "نجران";
    } else if (type == "12") {
      return "الباحة";
    } else if (type == "13") {
      return "الجوف";
    } else {
      return "غير ذلك";
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
      return "غير ذلك";
    }
  }

  radioButton(String selectedAnswer, String text) {
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
            Text(AppLocalizations.of(context)!.yes),
            Radio<String>(
              value: "0", // Represents "No"
              groupValue: selectedAnswer,
              onChanged: null, // Disable interaction
            ),
            Text(AppLocalizations.of(context)!.no)
          ],
        ),
      ],
    );
  }
}
