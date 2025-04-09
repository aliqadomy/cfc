part of 'modefiy_kyc_bloc.dart';

@immutable
abstract class ModefiyKycEvent {}

class ModefiyKycEvents extends ModefiyKycEvent {
  ModefiyKycEvents({
    required this.email,
    required this.mobileNumber,
    required this.matiralStatus,
    required this.familyNumber,
    required this.gender,
    required this.region,
    required this.jobStatus,
    required this.nationalityLocation,
    required this.identityType,
    required this.nationality,
    required this.bank,
    required this.date,
    required this.idNumber,
    required this.iban,
    required this.income,
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
    required this.six,
    required this.seven,
    required this.eight,
    required this.wkaleh,
    required this.selectedAnswer,
    required this.englishName,
    required this.arabicName,
    required this.education,
  });

  final String email;
  final String mobileNumber;
  final String matiralStatus;
  final String familyNumber;
  final String gender;
  final String education;
  final String region;
  final String jobStatus;
  final String nationalityLocation;
  final String identityType;
  final String nationality;
  final String bank;
  final String date;
  final String idNumber;
  final String iban;
  final bool income;
  final bool one;
  final bool two;
  final bool three;
  final bool four;
  final bool five;
  final bool six;
  final bool seven;
  final bool eight;
  final bool wkaleh;
  final bool selectedAnswer;
  final String arabicName;
  final String englishName;
}
