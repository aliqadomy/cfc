import 'package:cfc_main/domain/model/MeModel.dart';
import 'package:cfc_main/domain/model/kyc/ShowKyc.dart';
import 'package:cfc_main/domain/model/wallet/banks.dart';
import 'package:cfc_main/presintation/home/MyOpportunities/watheqBloc/watheq_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../core/appColor.dart';
import '../../commonWidget/CutsomButton.dart';
import '../../commonWidget/appBar.dart';
import '../../commonWidget/customTextInput.dart';
import '../../me/me_bloc.dart';
import 'WebViewPage.dart';
import 'all_opportuinity_bloc/all_opportunity_bloc.dart';
import 'card.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'mdefiyKyc/modefiy_kyc_bloc.dart';

class Myopportunitiesscreen extends StatefulWidget {
  const Myopportunitiesscreen({super.key});

  @override
  State<Myopportunitiesscreen> createState() => _MyopportunitiesscreenState();
}

class _MyopportunitiesscreenState extends State<Myopportunitiesscreen> {
  int status = 0;
  @override
  void initState() {
    BlocProvider.of<ModefiyKycBloc>(context).add(ShowModefiyKycEvent());
    BlocProvider.of<MeBloc>(context).add(MeEvents());
    BlocProvider.of<AllOpportunityBloc>(context).add(AllOpportuintyEvents());
    // BlocProvider.of<MyOpportunityBloc>(context).add(MyOpportunityEvents());
    super.initState();
  }

  final info_ind_key = GlobalKey<FormState>();
  final personal_Info_key = GlobalKey<FormState>();
  final yaqInfoKey = GlobalKey<FormState>();
  final person_info_fini = GlobalKey<FormState>();
  final quest_form = GlobalKey<FormState>();
  final wkalehKey = GlobalKey<FormState>();

  //person_info_fini

  MeModel? responseUser;
  bool isLoading = false;
  int currentStep = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController martialStatusController = TextEditingController();
  TextEditingController familyNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController educationGradeController = TextEditingController();
  TextEditingController jobStatusController = TextEditingController();
  TextEditingController nationalityLocationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController ibanController = TextEditingController();
  TextEditingController icomeController = TextEditingController();
  bool? selectedAnswerIncome = true;
  bool? selectedAnswerOne = true;
  bool? selectedAnswerTwo = true;
  bool? selectedAnswerThree = true;
  bool? selectedAnswerFour = true;
  bool? selectedAnswerFive = true;
  bool? selectedAnswerSix = true;
  bool? selectedAnswerSeven = true;
  bool? selectedAnswerEight = true;
  bool? selectedAnswerWkaleh = true;
  String arabicName = "";
  String englishName = "";
  bool watheqLoading=false;

  void mapKycDataToFields(List<ShowKyc> response) {

    for (var section in response) {
      section.infoType?.forEach((info) {
        info.detail?.forEach((detail) {
          final title = detail.title;
          final value = detail.value;
          switch (title) {
            case 'البريد الالكتروني':
            case 'Email Address':
              emailController.text = value ?? "";
              break;
            case 'رقم الجوال':
            case 'Mobile Number':
              mobileController.text = value ?? "";
              break;

            case 'الحالة الاجتماعية':
            case 'Marital status':
              _selectedMaritalStatus = (int.parse(value!) - 1).toString();
              break;

            case 'عدد افراد الاسرة':
            case 'Family members':
              familyNumberController.text = value ?? "";
              break;

            case 'الجنس':
            case 'Gender':
              _genderStatus = (int.parse(value!) - 1).toString();
              break;

            case 'التحصيل الاكاديمي':
            case 'Education':
              _educationStatus = (int.parse(value!)).toString();
              break;

            case 'الحالة الوظيفية':
            case 'Job Status':
              _jobStatus = (int.parse(value!) - 1).toString();
              break;

            case 'العنوان الوطني':
            case 'National Address':
              nationalityLocationController.text = value ?? "";
              break;

            case 'المنطقة':
            case 'Region':

            _selectedRegion= _dropdownRegions[int.tryParse(value!)!-1];
              break;

            case 'نوع الهوية':
            case 'Individual  Identity Type':
              _individualIdentityInt = (int.tryParse(value!)! - 1);
              break;

            case 'رقم الهوية':
            case 'Id Number':
              idNumberController.text = value ?? "";
              break;

            case 'تاريخ الولادة':
            case 'DOB':
              dateController.text = value ?? "";
              break;

            case 'الاسم بالعربية':
            case 'Arabic Name':
              arabicName = value ?? "";
              break;

            case 'الاسم بالانجليزي':
            case 'English Name':
              englishName = value ?? "";
              break;

            case 'رقم الحساب البنكي-الايبان':
            case 'IBAN Bank Account':
              ibanController.text = value ?? "";
              break;

            case 'Bank Name':

              _bankIndex = (int.parse(value!));
              _bank= Banks.banks[(_bankIndex!-1)]['nameAr'];


              break;

            case 'الدخل السنوي اكبر من 100,000 ريال':
            case 'Annual Income > 100,000 SAR':
              selectedAnswerIncome = value == "1";
              break;

            case 'هل سبق لك العمل في القطاع المالي خلال السنوات الخمس الماضية ؟':
              selectedAnswerOne = value == "1";
              break;

            case 'هل لديك أي خبرات عملية أخرى ذات الصة بالقطاع المالي ؟':
              selectedAnswerTwo = value == "1";
              break;

            case 'هل انت عضو مجلس ادارة او لجنة مراجعة او احد كبار التنفيذيين في شركة مدرجة؟':
              selectedAnswerThree = value == "1";
              break;

            case 'هل انت ذو علاقة بعضو مجلس ادارة او لجنة مراجعة او احد كبار التنفيذيين في شركة مدرجة؟':
              selectedAnswerFour = value == "1";
              break;

            case 'هل انت مكلف مهمات عليا في المملكة او دولة اجنبية او مناصب ادارة عليا او وظيفة في المنظمات الدولية؟':
              selectedAnswerFive = value == "1";
              break;

            case 'هل لديك صلة قرابة برابطة الدم او الزواج وصولا الى الدرجة الثانية او مقربا من شخص مكلف بمهمات عليا في المملكة او دولة اجنبية او مناصب ادارة عليا او وظيفة في المنظمات الدولية؟':
              selectedAnswerSix = value == "1";
              break;

            case 'هل انت المستفيد الحقيقي من الحساب الاستثماري؟':
              selectedAnswerSeven = value == "1";
              break;

            case 'هل لديك شهادة التعامل بالأوراق المالية  CME-1 ?':
              selectedAnswerEight = value == "1";
              break;

            case 'الموافقة على اتفاقية الوكالة بالاستثمار':
            case 'Consent to the Investment Mandate Agreement':
              selectedAnswerWkaleh = value == "1";
              break;
          }
        });
      });
    }
  }

  final List<String> _dropdownMartialStatus = ['متزوج', 'اعزب', 'مطلق', 'ارمل'];
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
  final List<String> _dropdownGender = ["ذكر", "انثى"];

  int? _selectedMaritalStatusIndex;
  String? _selectedMaritalStatus;

  int? _selectedRegionIndex;
  String? _selectedRegion;

  int? _educationStatusInt;
  String? _educationStatus;

  int? _bankIndex;
  String? _bank;

  int? _jobStatusIndex;
  String? _jobStatus;

  int? _genderStatusIndex;
  String? _genderStatus;

  int? _individualIdentityInt;
  int? _individualIdentityStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: AppColors.background2,
        body: BlocListener<MeBloc, MeState>(
          listener: (context, state) {
            if (state is MeSuccess) {
              setState(() {
                isLoading = true;
              });
            } else if (state is MeFailed) {
              setState(() {
                isLoading = true;
              });
            }
          },
          child: BlocBuilder<MeBloc, MeState>(
            builder: (context, state) {
              if (state is MeSuccess) {
                return state.user!.kycApprovedStatus == 1
                    ? Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 20, end: 14),
                        child: isLoading
                            ? ListView(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                  ),
                                  BlocBuilder<AllOpportunityBloc,
                                      AllOpportunityState>(
                                    builder: (context, state) {
                                      if (state is AllOpportunitySuccess) {
                                        return CustomCardOpp(
                                          withImage: true,
                                          image: "assets/images/all_oppo.png",
                                          name: AppLocalizations.of(context)!
                                              .allOpp,
                                          icon: Icons.arrow_drop_down,
                                          nameColor: AppColors.white,
                                          backGroundColor: AppColors.blue,
                                          iconColor: AppColors.white,
                                          opp: state
                                              .allOpportunityModel.openDate,
                                          index: state.allOpportunityModel
                                              .openDate?.length,
                                        );
                                      } else if (state
                                          is AllOpportunityFailed) {
                                        return CustomCardOpp(
                                          withImage: true,
                                          image: "assets/images/all_oppo.png",
                                          name: AppLocalizations.of(context)!
                                              .allOpp,
                                          icon: Icons.arrow_drop_down,
                                          nameColor: AppColors.white,
                                          backGroundColor: AppColors.blue,
                                          iconColor: AppColors.white,
                                          opp: const [],
                                          index: 0,
                                        );
                                      }
                                      return CustomCardOpp(
                                        withImage: true,
                                        image: "assets/images/all_oppo.png",
                                        name: AppLocalizations.of(context)!
                                            .allOpp,
                                        icon: Icons.arrow_drop_down,
                                        nameColor: AppColors.white,
                                        backGroundColor: AppColors.blue,
                                        iconColor: AppColors.white,
                                        opp: const [],
                                        index: 0,
                                      );
                                    },
                                  ),
                                  BlocBuilder<AllOpportunityBloc,
                                      AllOpportunityState>(
                                    builder: (context, state) {
                                      if (state is AllOpportunitySuccess) {
                                        return CustomCardOpp(
                                          withImage: true,
                                          image: "assets/images/all_oppo.png",
                                          name:
                                              AppLocalizations.of(context)!.mos,
                                          icon: Icons.arrow_drop_down,
                                          nameColor: AppColors.white,
                                          backGroundColor: AppColors.blue,
                                          iconColor: AppColors.white,
                                          opp: state.allOpportunityModel
                                              .myOpportunity,
                                          index: state.allOpportunityModel
                                              .myOpportunity?.length,
                                        );
                                      } else if (state
                                          is AllOpportunityFailed) {
                                        return CustomCardOpp(
                                          withImage: true,
                                          image: "assets/images/all_oppo.png",
                                          name: AppLocalizations.of(context)!
                                              .allOpp,
                                          icon: Icons.arrow_drop_down,
                                          nameColor: AppColors.white,
                                          backGroundColor: AppColors.blue,
                                          iconColor: AppColors.white,
                                          opp: const [],
                                          index: 0,
                                        );
                                      }
                                      return CustomCardOpp(
                                        withImage: true,
                                        image: "assets/images/all_oppo.png",
                                        name: AppLocalizations.of(context)!
                                            .allOpp,
                                        icon: Icons.arrow_drop_down,
                                        nameColor: AppColors.white,
                                        backGroundColor: AppColors.blue,
                                        iconColor: AppColors.white,
                                        opp: const [],
                                        index: 0,
                                      );
                                    },
                                  ),
                                  BlocBuilder<AllOpportunityBloc,
                                      AllOpportunityState>(
                                    builder: (context, state) {
                                      if (state is AllOpportunitySuccess) {
                                        return CustomCardOpp(
                                          withImage: true,
                                          image:
                                              "assets/images/closed_oppo.png",
                                          name: AppLocalizations.of(context)!
                                              .closedOpp,
                                          icon: Icons.arrow_drop_down,
                                          nameColor: AppColors.white,
                                          backGroundColor: AppColors.blue,
                                          iconColor: AppColors.white,
                                          opp: state
                                              .allOpportunityModel.closeDate,
                                          index: state.allOpportunityModel
                                              .closeDate?.length,
                                        );
                                      } else {
                                        return CustomCardOpp(
                                          withImage: true,
                                          image:
                                              "assets/images/closed_oppo.png",
                                          name: AppLocalizations.of(context)!
                                              .closedOpp,
                                          icon: Icons.arrow_drop_down,
                                          nameColor: AppColors.white,
                                          backGroundColor: AppColors.blue,
                                          iconColor: AppColors.white,
                                          opp: const [],
                                          index: 0,
                                        );
                                      }
                                    },
                                  ),
                                  BlocBuilder<AllOpportunityBloc,
                                      AllOpportunityState>(
                                    builder: (context, state) {
                                      if (state is AllOpportunitySuccess) {
                                        return CustomCardOpp(
                                          withImage: true,
                                          image:
                                              "assets/images/closed_oppo.png",
                                          name: AppLocalizations.of(context)!
                                              .comSoon,
                                          icon: Icons.arrow_drop_down,
                                          nameColor: AppColors.white,
                                          backGroundColor: AppColors.blue,
                                          iconColor: AppColors.white,
                                          opp: state
                                              .allOpportunityModel.commingSoon,
                                          index: state.allOpportunityModel
                                              .commingSoon?.length,
                                        );
                                      } else {
                                        return CustomCardOpp(
                                          withImage: true,
                                          image:
                                              "assets/images/closed_oppo.png",
                                          name: AppLocalizations.of(context)!
                                              .closedOpp,
                                          icon: Icons.arrow_drop_down,
                                          nameColor: AppColors.white,
                                          backGroundColor: AppColors.blue,
                                          iconColor: AppColors.white,
                                          opp: const [],
                                          index: 0,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              )
                            : const Center(child: CircularProgressIndicator()))
                    : (state.user!.kycApprovedStatus == 2 ||
                            state.user!.kycApprovedStatus == 0)
                        ? BlocListener<ModefiyKycBloc, ModefiyKycState>(
                            listener: (context, state) {
                              if (state is ShowKycSuccess) {
                            print(state);
                                mapKycDataToFields(state.showKyc);
                              }
                            },
                            child:
                                BlocListener<ModefiyKycBloc, ModefiyKycState>(
                              listener: (context, state) {
                                if (state is ModefiyKycSuccess) {
                                  ShowToastWidget.showToast(
                                      message: state.modefiyKyc.message!);
                                } else if (state is ModefiyKycFailed) {
                                  ShowToastWidget.showToast(
                                      message: state.errMsg);
                                } else {
                                  const SizedBox();
                                }
                              },
                              child: Stepper(
                                  type: StepperType.vertical,
                                  currentStep: currentStep,
                                  onStepTapped: (int index) {
                                    if (currentStep == 0) {
                                      if (personal_Info_key.currentState!
                                          .validate()) {
                                        setState(() {
                                          currentStep +=
                                              1; // Move to next step if valid
                                        });
                                      }
                                    } else if (currentStep == 1) {
                                      if (info_ind_key.currentState!
                                          .validate()) {
                                        setState(() {
                                          currentStep +=
                                              1; // Move to next step if valid
                                        });
                                      }
                                    } else if (currentStep == 2) {
                                      if (person_info_fini.currentState!
                                          .validate()) {
                                        setState(() {
                                          currentStep +=
                                              1; // Move to next step if valid
                                        });
                                      }
                                    } else if (currentStep == 3) {
                                      if (yaqInfoKey.currentState!.validate()) {
                                        setState(() {
                                          currentStep += 1;
                                        });
                                      }
                                    } else if (currentStep == 4) {
                                      setState(() {
                                        currentStep += 1;
                                      });
                                    }
                                    return;
                                  },
                                  controlsBuilder: (BuildContext context,
                                      ControlsDetails details) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            if (currentStep > 0) {
                                              setState(() {
                                                currentStep -=
                                                    1; // Go back to the previous step
                                              });
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 12,
                                                bottom: 12,
                                                left: 7,
                                                right: 7),
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16)),
                                              color: AppColors.green,
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .back,
                                                style: const TextStyle(
                                                    color: AppColors.white,
                                                    fontFamily: 'almarai',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        // Custom Next/Continue button
                                        if (currentStep !=
                                            5) // Show 'Next' button for steps other than 4
                                          GestureDetector(
                                              onTap: () {
                                                // Custom continue logic based on current step
                                                if (currentStep == 0 &&
                                                    personal_Info_key
                                                        .currentState!
                                                        .validate()) {
                                                  setState(() {
                                                    currentStep += 1;
                                                  });
                                                } else if (currentStep == 1 &&
                                                    info_ind_key.currentState!
                                                        .validate()) {
                                                  setState(() {
                                                    currentStep += 1;
                                                  });
                                                } else if (currentStep == 2 &&
                                                    yaqInfoKey.currentState!
                                                        .validate()) {
                                                  setState(() {
                                                    currentStep += 1;
                                                  });
                                                } else if (currentStep == 3 &&
                                                    person_info_fini
                                                        .currentState!
                                                        .validate()) {
                                                  setState(() {
                                                    currentStep += 1;
                                                  });
                                                } else if (currentStep == 4) {
                                                  setState(() {
                                                    currentStep += 1;
                                                  });
                                                }
                                              },
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12,
                                                          bottom: 12,
                                                          left: 7,
                                                          right: 7),
                                                  alignment: Alignment.center,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                16)),
                                                    color: AppColors.green,
                                                  ),
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .continues,
                                                    style: const TextStyle(
                                                        color: AppColors.white,
                                                        fontFamily: 'almarai',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))),
                                        if (currentStep == 5)
                                          selectedAnswerWkaleh == false
                                              ? const SizedBox()
                                              : GestureDetector(
                                                  onTap: () {
                                                    print("jooooood ${dateController.text}");
                                                    BlocProvider.of<ModefiyKycBloc>(context).add(ModefiyKycEvents(
                                                        email: emailController
                                                            .text,
                                                        mobileNumber:
                                                            mobileController
                                                                .text,
                                                        matiralStatus: (int.tryParse(_selectedMaritalStatus!)!+1).toString(),
                                                        familyNumber:
                                                            familyNumberController
                                                                .text,
                                                        gender: (int.tryParse(_genderStatus!)! + 1)
                                                            .toString(),
                                                        region: (_selectedRegionIndex! + 1)
                                                            .toString(),
                                                        jobStatus:
                                                            (int.tryParse(_jobStatus!)! + 1)
                                                                .toString(),
                                                        nationalityLocation:
                                                            nationalityLocationController
                                                                .text,
                                                        identityType:
                                                            (_individualIdentityInt! + 1)
                                                                .toString(),
                                                        nationality: nationalityLocationController.text,
                                                        bank: (_bankIndex!).toString(),
                                                        date: dateController.text,
                                                        idNumber: idNumberController.text,
                                                        iban: ibanController.text,
                                                        income: selectedAnswerIncome!,
                                                        one: selectedAnswerOne!,
                                                        two: selectedAnswerTwo!,
                                                        three: selectedAnswerThree!,
                                                        four: selectedAnswerFour!,
                                                        five: selectedAnswerFive!,
                                                        six: selectedAnswerSix!,
                                                        seven: selectedAnswerSeven!,
                                                        eight: selectedAnswerEight!,
                                                        wkaleh: selectedAnswerWkaleh!,
                                                        selectedAnswer: true,
                                                        englishName: englishName,
                                                        arabicName: arabicName,
                                                        education: (int.tryParse(_educationStatus!)!).toString()));
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12,
                                                            bottom: 12,
                                                            left: 7,
                                                            right: 7),
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  16)),
                                                      color: AppColors.green,
                                                    ),
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .save,
                                                      style: const TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontFamily: 'almarai',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                        // Custom Exit button
                                      ],
                                    );
                                  },
                                  steps: [
                                    Step(
                                        isActive: currentStep == 0,
                                        title: Text(
                                            AppLocalizations.of(context)!
                                                .accInfoKyc),
                                        content: Form(
                                          key: personal_Info_key,
                                          child: SizedBox(
                                              height: 220,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 110,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .email),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Customtextinput(
                                                          hintText:
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .email,
                                                          controller:
                                                              emailController,
                                                          secure: false,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'This Filed Required';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 110,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .mobNum),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Customtextinput(
                                                            hintText:
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .mobNum,
                                                            controller:
                                                                mobileController,
                                                            secure: false,
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'This Filed Required';
                                                              }
                                                              if (!value
                                                                  .startsWith(
                                                                      '05')) {
                                                                return 'Mobile number must start with 05********';
                                                              }
                                                              if (value
                                                                      .length !=
                                                                  10) {
                                                                return 'Mobile number must be 10 digits long';
                                                              }
                                                              return null;
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        )),
                                    Step(
                                        isActive: currentStep == 1,
                                        title: Text(
                                          AppLocalizations.of(context)
                                                      ?.personalInfoKyc !=
                                                  null
                                              ? AppLocalizations.of(context)!
                                                  .personalInfoKyc
                                              : "",
                                        ),
                                        content: Form(
                                          key: info_ind_key,
                                          child: SizedBox(
                                              height: MediaQuery.of(context).size.height*0.78,
                                              child: Column(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                        context)
                                                                    ?.jobStatus !=
                                                                null
                                                            ? AppLocalizations
                                                                    .of(context)!
                                                                .jobStatus
                                                            : "",
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      DropdownButtonFormField<
                                                          String>(
                                                        isExpanded: true,
                                                        value: _jobStatus ==
                                                                null
                                                            ? null
                                                            : _dropdownJobStatus[
                                                                int.tryParse(
                                                                    _jobStatus!)!],
                                                        hint: Text(
                                                          _jobStatus == null
                                                              ? 'Select Job'
                                                              : _dropdownJobStatus[int
                                                                      .tryParse(
                                                                          _jobStatus!) ??
                                                                  0], // Use tryParse to safely handle invalid numbers
                                                        ),
                                                        onChanged:
                                                            (String? newValue) {
                                                          setState(() {
                                                            _jobStatusIndex =
                                                                _dropdownJobStatus
                                                                    .indexOf(
                                                                        newValue!);
                                                            _jobStatus =
                                                                _jobStatusIndex
                                                                    .toString();
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please select an option';
                                                          }
                                                          return null;
                                                        },
                                                        items: _dropdownJobStatus
                                                            .map<
                                                                DropdownMenuItem<
                                                                    String>>(
                                                          (String value) {
                                                            return DropdownMenuItem<
                                                                    String>(
                                                                value: value,
                                                                child: Text(
                                                                  value,
                                                                  textScaleFactor: MediaQuery.of(
                                                                          context)
                                                                      .textScaleFactor
                                                                      .clamp(
                                                                          1.0,
                                                                          1.2),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                ));
                                                          },
                                                        ).toList(),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                             height: MediaQuery.of(context).size.height*0.1,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          AppLocalizations.of(
                                                                          context)
                                                                      ?.educationStatus !=
                                                                  null
                                                              ? AppLocalizations
                                                                      .of(context)!
                                                                  .educationStatus
                                                              : "",
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        DropdownButtonFormField<String>(
                                                          isExpanded: true,
                                                          value: (_educationStatus != null &&
                                                              int.tryParse(_educationStatus!) != null &&
                                                              int.parse(_educationStatus!) > 0 &&
                                                              int.parse(_educationStatus!) <= _dropdownEducation.length)
                                                              ? _dropdownEducation[int.parse(_educationStatus!) - 1]
                                                              : null,
                                                          hint: const Text('Select Education'),
                                                          onChanged: (String? newValue) {
                                                            final selectedIndex = _dropdownEducation.indexOf(newValue!);
                                                            if (selectedIndex != -1) {
                                                              setState(() {
                                                                _educationStatusInt = selectedIndex;
                                                                _educationStatus = (selectedIndex + 1).toString(); // 1-based index
                                                              });
                                                            }
                                                          },
                                                          validator: (value) {
                                                            if (value == null || value.isEmpty) {
                                                              return 'Please select an option';
                                                            }
                                                            return null;
                                                          },
                                                          items: _dropdownEducation.map<DropdownMenuItem<String>>((String value) {
                                                            return DropdownMenuItem<String>(
                                                              value: value,
                                                              child: Text(
                                                                value,
                                                                textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2),
                                                                style: const TextStyle(fontSize: 16),
                                                              ),
                                                            );
                                                          }).toList(),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: MediaQuery.of(context).size.height*0.1,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          AppLocalizations.of(
                                                                          context)
                                                                      ?.gender !=
                                                                  null
                                                              ? AppLocalizations
                                                                      .of(context)!
                                                                  .gender
                                                              : "",
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        DropdownButtonFormField<
                                                            String>(
                                                          isExpanded: true,
                                                          value: _genderStatus ==
                                                                  null
                                                              ? null
                                                              : _dropdownGender[
                                                                  int.tryParse(
                                                                      _genderStatus!)!],
                                                          hint: Text(
                                                            _genderStatus ==
                                                                    null
                                                                ? 'Gender'
                                                                : _dropdownGender[
                                                                    int.tryParse(
                                                                            _genderStatus!) ??
                                                                        0], // Use tryParse here too
                                                          ),
                                                          onChanged: (String?
                                                              newValue) {
                                                            setState(() {
                                                              _genderStatusIndex =
                                                                  _dropdownGender
                                                                      .indexOf(
                                                                          newValue!);
                                                              _genderStatus =
                                                                  (_genderStatusIndex)
                                                                      .toString();
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please select an option';
                                                            }
                                                            return null;
                                                          },
                                                          items: _dropdownGender
                                                              .map<
                                                                  DropdownMenuItem<
                                                                      String>>(
                                                            (String value) {
                                                              return DropdownMenuItem<
                                                                      String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    textScaleFactor: MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor
                                                                        .clamp(
                                                                            1.0,
                                                                            1.2),
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            16),
                                                                  ));
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .maritalStatus,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      DropdownButtonFormField<
                                                          String>(
                                                        value: _selectedMaritalStatus ==
                                                                null
                                                            ? null
                                                            : _dropdownMartialStatus[
                                                                int.tryParse(
                                                                    _selectedMaritalStatus!)!],
                                                        isExpanded: true,
                                                        onChanged:
                                                            (String? newValue) {
                                                              setState(() {
                                                                _selectedMaritalStatusIndex =
                                                                    _dropdownMartialStatus.indexOf(newValue!);
                                                                _selectedMaritalStatus = _selectedMaritalStatusIndex!.toString();
                                                                print("ooooooo $_selectedMaritalStatus");
                                                              });
                                                        },
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please select an option';
                                                          }
                                                          return null;
                                                        },
                                                        items: _dropdownMartialStatus
                                                            .map<
                                                                DropdownMenuItem<
                                                                    String>>(
                                                          (String value) {
                                                            return DropdownMenuItem<
                                                                    String>(
                                                                value: value,
                                                                child: Text(
                                                                  value,
                                                                  textScaleFactor: MediaQuery.of(
                                                                          context)
                                                                      .textScaleFactor
                                                                      .clamp(
                                                                          1.0,
                                                                          1.2),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                ));
                                                          },
                                                        ).toList(),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .region,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      DropdownButtonFormField<String>(
                                                        value: _selectedRegion,
                                                        isExpanded: true,
                                                        hint: const Text("Select Region"),
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            _selectedRegion = newValue;
                                                            _selectedRegionIndex = _dropdownRegions.indexOf(newValue!);
                                                          });
                                                        },
                                                        validator: (value) {
                                                          if (value == null || value.isEmpty) {
                                                            return 'Please select an option';
                                                          }
                                                          return null;
                                                        },
                                                        items: _dropdownRegions.map<DropdownMenuItem<String>>((String value) {
                                                          return DropdownMenuItem<String>(
                                                            value: value,
                                                            child: Text(
                                                              value,
                                                              textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2),
                                                              style: const TextStyle(fontSize: 16),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),


                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 25,
                                                  ),
                                                  SizedBox(
                                                    height: 110,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .familyMem),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Customtextinput(
                                                          hintText:
                                                              'Family members',
                                                          controller:
                                                              familyNumberController,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          secure: false,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'This field is required';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 110,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .natAddress),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Customtextinput(

                                                          hintText:
                                                              'National Address',
                                                          controller:
                                                              nationalityLocationController, // Ensure this controller is initialized
                                                          secure: false,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'This field is required'; // Fix "Filed" to "Field"
                                                            }
                                                            if (value.length > 8) {
                                                              return 'Max 8 characters';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        )),
                                    Step(
                                        isActive: currentStep == 2,
                                        title: Text(
                                            AppLocalizations.of(context)!
                                                .personalInfoYaq),
                                        content: Form(
                                          key: yaqInfoKey,
                                          child: SizedBox(
                                              height: 650,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                      height: 121,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(AppLocalizations
                                                                  .of(context)!
                                                              .identityType),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          SizedBox(
                                                            height: 60,
                                                            child:
                                                                DropdownButtonFormField(
                                                              value: _individualIdentityInt ==
                                                                      null
                                                                  ? null
                                                                  : _dropdownIndividualIdentityType[
                                                                      _individualIdentityInt!],
                                                              hint: Text(AppLocalizations
                                                                      .of(context)!
                                                                  .identityType),
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        null ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return 'Please select an option';
                                                                }
                                                                return null;
                                                              },
                                                              onChanged:
                                                                  (newValue) {
                                                                setState(() {
                                                                  _individualIdentityInt =
                                                                      _dropdownIndividualIdentityType
                                                                          .indexOf(
                                                                              newValue!);
                                                                  _individualIdentityStatus =
                                                                      _individualIdentityInt;
                                                                  print(
                                                                      _individualIdentityStatus);
                                                                });
                                                              },
                                                              items: _dropdownIndividualIdentityType
                                                                  .map<DropdownMenuItem>(
                                                                      (value) {
                                                                return DropdownMenuItem<
                                                                        String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                      value,
                                                                      textScaleFactor: MediaQuery.of(
                                                                              context)
                                                                          .textScaleFactor
                                                                          .clamp(
                                                                              1.0,
                                                                              1.2),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              16),
                                                                    ));
                                                              }).toList(),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                  SizedBox(
                                                    height: 121,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .bthDate),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Customtextinput(
                                                          hintText: 'DOB',
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'This Filed Required';
                                                            }
                                                            return null;
                                                          },
                                                          readOnly: true,
                                                          controller:
                                                              dateController, // Pass the controller here
                                                          secure: false,
                                                          onPress: _selectDate,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: 121,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(AppLocalizations
                                                                  .of(context)!
                                                              .nationalId),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Customtextinput(
                                                            hintText:
                                                                'Id Number',
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'This Filed Required';
                                                              }
                                                              return null;
                                                            },
                                                            controller:
                                                                idNumberController,
                                                            secure: false,
                                                          ),
                                                        ],
                                                      )),
                                                  watheqLoading
                                                      ? const SizedBox(
                                                    height: 50,
                                                    width: 150,
                                                    child: Center(child: CircularProgressIndicator())):SizedBox(
                                                    height: 50,
                                                    width: 150,
                                                    child: CustomButton(
                                                      colors: AppColors.green,
                                                      title:
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .checkData,
                                                      onTap: () {
                                                        setState(() {
                                                          watheqLoading=true;
                                                        });
                                                        if (_individualIdentityStatus ==
                                                            0) {
                                                          String inputDate =
                                                              dateController
                                                                  .text;
                                                          DateFormat
                                                              inputFormat =
                                                              DateFormat(
                                                                  'd/M/yyyy');

                                                          DateTime parsedDate =
                                                              inputFormat.parse(
                                                                  inputDate);

                                                          String outputDate =
                                                              "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}";

                                                          BlocProvider.of<
                                                                      WatheqBloc>(
                                                                  context)
                                                              .add(WatheqSaudi(
                                                                  date:
                                                                      outputDate,
                                                                  iqama:
                                                                      idNumberController
                                                                          .text));

                                                        } else {
                                                          String inputDate =
                                                              dateController
                                                                  .text;

                                                          // Define the input date format
                                                          DateFormat
                                                              inputFormat =
                                                              DateFormat(
                                                                  'd-M-yyyy');

                                                          DateTime parsedDate =
                                                              inputFormat.parse(
                                                                  inputDate);

                                                          String outputDate =
                                                              "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}";

                                                          BlocProvider.of<
                                                                      WatheqBloc>(
                                                                  context)
                                                              .add(WatheqIqama(
                                                                  date:
                                                                      outputDate,
                                                                  iqama:
                                                                      idNumberController
                                                                          .text));

                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  BlocListener<WatheqBloc,
                                                      WatheqState>(
                                                    listener: (context, state) {
                                                      if (state
                                                          is WatheqStateSuccess) {
                                                        setState(() {});
                                                        arabicName =
                                                            "${state.watheqModel!.personBasicInfo!.firstName!} ${state.watheqModel!.personBasicInfo!.fatherName!} ${state.watheqModel!.personBasicInfo!.grandFatherName!} ${state.watheqModel!.personBasicInfo!.familyName!}";
                                                        englishName =
                                                            "${state.watheqModel!.personBasicInfo!.firstNameT!} ${state.watheqModel!.personBasicInfo!.fatherNameT!} ${state.watheqModel!.personBasicInfo!.grandFatherNameT!} ${state.watheqModel!.personBasicInfo!.familyNameT!}";

                                                          watheqLoading = false;

                                                    }else if (state is WatheqStateFailed){
              setState(() {
              watheqLoading = false;
              });}},

                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: MediaQuery.of(context).size.height*0.12,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(AppLocalizations
                                                                      .of(context)!
                                                                  .nameE),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Customtextinput(
                                                                hintText:
                                                                    arabicName,
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
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(AppLocalizations.of(
                                                                        context)!
                                                                    .nameA),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Customtextinput(
                                                                  hintText:
                                                                      englishName,
                                                                  secure: false,
                                                                  readOnly:
                                                                      true,
                                                                ),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )),
                                        )),
                                    Step(
                                        isActive: currentStep == 3,
                                        title: Text(
                                            AppLocalizations.of(context)!
                                                .personalInfoFinc),
                                        content: Form(
                                          key: person_info_fini,
                                          child: SizedBox(
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
                                                        DropdownButtonFormField<
                                                            String>(
                                                          isExpanded: true,
                                                          value: _bankIndex != null
                                                              ? Banks.banks[(_bankIndex!-1)]
                                                          ['nameAr']
                                                              : null,
                                                          hint: const Text(
                                                              "Bank Name"),
                                                          onChanged:
                                                              (newValue) {
                                                            final index = Banks.banks.indexWhere((bank) =>
                                                            bank['nameAr'] == newValue || bank['nameEn'] == newValue);
                                                            setState(() {
                                                              _bankIndex = index +1 ;
                                                              print("zzzzzzzzeeeee ${_bankIndex}");
                                                              _bank = newValue;
                                                            });
                                                          },
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please select an option';
                                                            }
                                                            return null;
                                                          },
                                                          items: Banks.banks.map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                                  (Map<String,
                                                                  String>
                                                              bank) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: bank[
                                                                  'nameAr'],
                                                                  child: Text(bank[
                                                                  'nameAr']!),
                                                                );
                                                              }).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: MediaQuery.of(context).size.height*0.12,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .bankNum),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Customtextinput(
                                                          hintText:
                                                              'IBAN Bank Account',
                                                          controller:
                                                              ibanController,
                                                          secure: false,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'This Filed Required';
                                                            }
                                                            if (!value
                                                                    .startsWith(
                                                                        'SA') ||
                                                                value.length !=
                                                                    24) {
                                                              return 'Value must start with "SA" and be 22 characters long';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                             height: MediaQuery.of(context).size.height*0.1,
                                                    child: radioButtonIncome(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .annuIncme,
                                                      selectedAnswerIncome!, // This should be a bool
                                                      (bool? value) {
                                                        setState(() {
                                                          selectedAnswerIncome =
                                                              value ??
                                                                  false; // Default to false if value is null
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        )),
                                    Step(
                                      isActive: currentStep == 3,
                                      title: Text(
                                          AppLocalizations.of(context)!.quest),
                                      content: Form(
                                        key: quest_form,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              // First Question
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.16,
                                                child: radioButtonIncome(
                                                  "هل سبق لكم العمل في القطاع المالي خلال السنوات الخمس الماضيه ؟",
                                                  selectedAnswerOne!,
                                                  (bool? value) {
                                                    setState(() {
                                                      selectedAnswerOne = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              // Second Question
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.16,
                                                child: radioButtonIncome(
                                                  "هل لديك اي خبرات عملية اخرى ذات صلة بالقطاع المالي ؟",
                                                  selectedAnswerTwo!,
                                                  (bool? value) {
                                                    setState(() {
                                                      selectedAnswerTwo = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              // Third Question
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.20,
                                                child: radioButtonIncome(
                                                  "هل انت عضو في مجلس ادارة او لجنه مراجعة او احد الكبار التنفيذين في شركة مدرجة ؟",
                                                  selectedAnswerThree!,
                                                  (bool? value) {
                                                    setState(() {
                                                      selectedAnswerThree =
                                                          value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              // Fourth Question
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.20,
                                                child: radioButtonIncome(
                                                  "هل انت ذو علاقة بعضو مجلس ادارة او لجنة مراجهة او احد الكبار التنفيذين في شركة مدرجة ؟",
                                                  selectedAnswerFour!,
                                                  (bool? value) {
                                                    setState(() {
                                                      selectedAnswerFour =
                                                          value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              // Fifth Question
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.20,
                                                child: radioButtonIncome(
                                                  "هل انت مكلف مهمات عليا في المملكة او دولة اجنبية او مناصب ادارية عليا او وظيفة في المنظمات الدولية ؟",
                                                  selectedAnswerFive!,
                                                  (bool? value) {
                                                    setState(() {
                                                      selectedAnswerFive =
                                                          value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              // Sixth Question
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.27,
                                                child: radioButtonIncome(
                                                  "هل لديك صلة قرابة بدابطة الدم او الزواج وصولا الي الدرجة الثانية او مقربا من شخص مكلف بمهمات عليا في المملكة او دولة اجنبية او مناصب اداة عليا او في وظيفة في المنظمات الدولية ؟",
                                                  selectedAnswerSix!,
                                                  (bool? value) {
                                                    setState(() {
                                                      selectedAnswerSix = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              // Seventh Question
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.16,
                                                child: radioButtonIncome(
                                                  "هل لديك شهادة التعامل بالاوراق المالية ؟",
                                                  selectedAnswerSeven!,
                                                  (bool? value) {
                                                    setState(() {
                                                      selectedAnswerSeven =
                                                          value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Step(
                                      isActive: currentStep == 4,
                                      title: Text(
                                          AppLocalizations.of(context)!.wkaleh),
                                      content: Form(
                                        key: wkalehKey,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  String date = dateController
                                                      .text
                                                      .replaceAll('/', '-');
                                                  String idNumber =
                                                      idNumberController.text;
                                                  String email =
                                                      emailController.text;
                                                  String location =
                                                      nationalityLocationController
                                                          .text;
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          WebViewPage(
                                                        url:
                                                            "https://staging.cfc.sa/#/investorAgreement/$date/$idNumber/$email/$location", // Your URL
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .wkaleh,
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context).size.height*0.14,
                                                child: radioButtonIncome(
                                                  "الموافقة على اتفاقية الوكالة بالاستثمار",
                                                  selectedAnswerWkaleh!,
                                                  (bool? value) {
                                                    setState(() {
                                                      selectedAnswerWkaleh =
                                                          value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          )
                        : const CircularProgressIndicator(color: AppColors.green,);
              } else if (state is MeFailed) {
                return const Center(
                    child: Text("There is SomeThing Wrong ....."));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }

  Widget radioButtonIncome(
    String questionText,
    bool selectedAnswer, // Use a bool for selectedAnswer
    ValueChanged<bool> onChanged, // The callback expects a bool now
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          questionText, //
          style: const TextStyle(fontSize: 16),
          textScaleFactor:
              MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio<bool>(
              value: true,
              groupValue: selectedAnswer,
              onChanged: (bool? value) {
                if (value != null) {
                  onChanged(value); // Update the selected answer
                }
              },
            ),
            Text(
              AppLocalizations.of(context)!.yes,
              textScaleFactor:
                  MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2),
            ),
            Radio<bool>(
              value: false, // Represents "No"
              groupValue: selectedAnswer,
              onChanged: (bool? value) {
                if (value != null) {
                  onChanged(value); // Update the selected answer
                }
              },
            ),
            Text(
              AppLocalizations.of(context)!.no,
              textScaleFactor:
                  MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    if (_individualIdentityStatus == 0) {
      // If the identity status is "سعودي", use the Hijri calendar
      await _selectHijriDate();
    } else {
      // Otherwise, use the Gregorian date picker
      await _selectGregorianDate();
    }
  }

  Future<void> _selectHijriDate() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Hijri Date"),
          content: SizedBox(
            width: 300,
            height: 400,
            child: SfHijriDateRangePicker(
              view: HijriDatePickerView.month, // Month view to select a day
              onSelectionChanged: (args) {
                final selectedDate = args.value;
                if (selectedDate != null) {
                  String formattedHijriDate =
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                  setState(() {
                    dateController.text =
                        formattedHijriDate;
                    print(dateController.text);// Display Hijri date
                  });
                }
                Navigator.pop(context); // Close the dialog after selection
              },
            ),
          ),
        );
      },
    );
  }

  // Function to select Gregorian date
  Future<void> _selectGregorianDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      // If a Gregorian date is selected, format it and update the text field
      String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
      setState(() {
        dateController.text = formattedDate;
      });
    }
  }
}
