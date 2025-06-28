import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/infrastructure/data_soruce/my_wallet/myWalletProvider.dart';
import 'package:cfc_main/infrastructure/repository/my_wallet_repo/my_wallet_repo.dart';
import 'package:cfc_main/presintation/home/wallet/paymentWebViewWidget.dart';
import 'package:cfc_main/presintation/home/wallet/payone/pay_one_bloc.dart';
import 'package:cfc_main/presintation/home/wallet/withdraw_bloc/withdraw_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../domain/model/wallet/UserKycModel.dart';
import '../../../domain/model/wallet/WalletResponseModel.dart';
import '../../../domain/model/wallet/banks.dart';
import '../../commonWidget/CutsomButton.dart';
import '../../commonWidget/appBar.dart';
import '../../commonWidget/customTextInput.dart';
import 'balanceBloc/balance_bloc.dart';
import 'finicalDetails/finicalDetails.dart';
import 'finincialStatment/finicial_statment_bloc.dart';

class Walletscreen extends StatefulWidget {
  const Walletscreen({Key? key}) : super(key: key);

  @override
  State<Walletscreen> createState() => _WalletscreenState();
}

class _WalletscreenState extends State<Walletscreen> {
  late WalletResponseModel walletResponse;
  TextEditingController balanceText = TextEditingController();
  TextEditingController amountAdded = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  UserKycModel? userKyc;
  bool showData = false;
  String? bic;
  String? withdrawMsg;
  bool isLoading = true;

  bool paymentGetWayLoading=false;

  @override
  void initState() {
    BlocProvider.of<BalanceBloc>(context).add(BalanceGet());
    BlocProvider.of<FinicialStatmentBloc>(context)
        .add(FinicalStatemtEvents(role_type: 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background2,
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 26,
              ),
              BlocListener<WithdrawBloc, WithdrawState>(
                listener: (context, state) {
                  if (state is UserKycStateSuccess) {
                    setState(() {
                      userKyc = state.userKyc;
                      isLoading = true;
                    });
                  } else if (state is UserKycStateFaield) {
                    setState(() {
                      isLoading = false; // Show error message on failure
                    });
                  }
                },
                child: BlocBuilder<BalanceBloc, BalanceState>(
                  builder: (context, state) {
                    if (state is BalanceSuccess) {
                      walletResponse = state.walletResponse;
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.14,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/card.png"),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.balance,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.walletResponse.walletBalance.toString(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                  ),
                                ),
                                AppColors.saudiSign(Colors.white,
                                    opc: 1.0, width: 25, height: 25)
                              ],
                            )
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.14,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/card.png"),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.balance,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                  ),
                                ),
                                AppColors.saudiSign(AppColors.black)
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      colors: AppColors.green,
                      title: AppLocalizations.of(context)!.balanceWithdrawal,
                      onTap: () {
                        BlocProvider.of<WithdrawBloc>(context)
                            .add(WithdrawEvents());
                        Future.delayed(const Duration(milliseconds: 500), () {
                          showModalBottomSheet<void>(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return BlocProvider(
                                create: (context) => WithdrawBloc(
                                  myWalletRepo: MyWalletRepo(
                                      myWalletprovider: Mywalletprovider()),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: StatefulBuilder(
                                    builder: (innerContext, setState) {
                                      return BlocListener<WithdrawBloc,
                                          WithdrawState>(
                                        listener: (context, state) {
                                          if (state
                                              is WithdrawBalanceStateSuccess) {
                                            withdrawMsg =
                                                state.withDrawBalance.status;
                                            ShowToastWidget.showToast(message: withdrawMsg!
                                                );
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              Navigator.pop(
                                                  context); // Close bottom sheet
                                            });
                                          } else if (state
                                              is WithdrawBalanceStateFaield) {
                                            withdrawMsg = state.errMsg;
                                            ShowToastWidget.showToast(
                                                message: withdrawMsg!);
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              Navigator.pop(
                                                  context); // Close bottom sheet
                                            });
                                          }
                                        },
                                        child:
                                            userKyc?.infoType?[1].detail?[0]
                                                        .value ==
                                                    null
                                                ? Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.33,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: const Text(
                                                        "No Wallet Available"))
                                                : Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.33,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .balanceWithdrawal,
                                                                style: const TextStyle(
                                                                    color:
                                                                        AppColors
                                                                            .blue,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              // Handle null cases gracefully
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '${AppLocalizations.of(context)!.maximum} : ${walletResponse.walletBalance.toString()}',
                                                                  ),
                                                                  AppColors
                                                                      .saudiSign(
                                                                          Colors
                                                                              .white)
                                                                ],
                                                              ),
                                                              userKyc
                                                                          ?.infoType?[
                                                                              1]
                                                                          .detail?[
                                                                              0]
                                                                          .value ==
                                                                      null
                                                                  ? SizedBox()
                                                                  : Text(
                                                                      '${AppLocalizations.of(context)!.accNum} : ${userKyc!.infoType![1].detail![0].value!}',
                                                                    ),
                                                              userKyc
                                                                          ?.infoType?[
                                                                              1]
                                                                          .detail?[
                                                                              1]
                                                                          .value ==
                                                                      null
                                                                  ? SizedBox()
                                                                  : Text(
                                                                      '${AppLocalizations.of(context)?.bank ?? ""} : ${Banks.getBankAtIndex(int.parse(userKyc!.infoType![1].detail![1].value!) - 1) }',
                                                                    ),
                                                              Form(
                                                                key: _formKey,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Customtextinput(
                                                                      hintText:
                                                                          AppLocalizations.of(context)
                                                                              ?.withdrawAmount,
                                                                      controller:
                                                                          balanceText,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      secure:
                                                                          false,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value
                                                                                .isEmpty) {
                                                                          return AppLocalizations.of(context)!
                                                                              .required;
                                                                        } else if (double.tryParse(value) ==
                                                                                null ||
                                                                            double.parse(value) >
                                                                                walletResponse.walletBalance!.toDouble()) {
                                                                          return '${AppLocalizations.of(context)!.accNum} ${walletResponse.walletBalance.toString()}';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      icon:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            12.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/saudi_sign.png',
                                                                          width:
                                                                              10,
                                                                          height:
                                                                              10,
                                                                        ),
                                                                      ),
                                                                      showPrefixIcon:
                                                                          true,
                                                                    ),
                                                                    CustomButton(
                                                                      colors: AppColors
                                                                          .green,
                                                                      title:
                                                                          "${AppLocalizations.of(innerContext)?.withdraw}",
                                                                      onTap:
                                                                          () {
                                                                        if (_formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                          setState(
                                                                              () {
                                                                            isLoading =
                                                                                false;
                                                                          });
                                                                          BlocProvider.of<WithdrawBloc>(innerContext)
                                                                              .add(
                                                                            WithdrawBalance(
                                                                              amount: balanceText.text,
                                                                              creditAccount: userKyc!.infoType![1].detail![0].value.toString(),
                                                                              bic: Banks.getBankAtIndex(int.parse(userKyc!.infoType![1].detail![1].value!) - 1),
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          print(
                                                                              "Validation Failed");
                                                                        }
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ).then((value) {
                            balanceText.clear();
                            BlocProvider.of<BalanceBloc>(context)
                                .add(BalanceGet());
                            BlocProvider.of<FinicialStatmentBloc>(context)
                                .add(FinicalStatemtEvents(role_type: 2));
                          });
                        });
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                      colors: AppColors.green,
                      title: AppLocalizations.of(context)!.depositInWallet,
                      onTap: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: BlocProvider(
                                create: (context) => PayOneBloc(
                                    myWalletRepo: MyWalletRepo(
                                        myWalletprovider: Mywalletprovider())),
                                child: StatefulBuilder(
                                  builder: (innerContext, setState) {
                                    return BlocListener<PayOneBloc,
                                        PayOneState>(
                                      listener: (context, state) {
                                        if(state is PayOneSuccess)
                                          {
                                            print("now 1");
                                            setState(() => paymentGetWayLoading = false);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => PaymentWebViewPage(model: state.paymentGetWayModel),
                                              ),
                                            );

                                          }else if(state is PayOneFailed)
                                            {
                                              print("now 2");
                                              Navigator.pop(context);
                                              ShowToastWidget.showToast(message:state.msg);
                                              setState((){
                                                paymentGetWayLoading=true;
                                              });
                                            }else
                                              {
                                                print("now 3");
                                                setState((){
                                                  paymentGetWayLoading=true;
                                                });
                                              }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.30,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "ايداع في المحفظه",
                                                    style: TextStyle(
                                                        color: AppColors.blue,
                                                        fontSize: 20),
                                                  ),
                                                  Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Customtextinput(
                                                          icon: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12.0),
                                                            child: Image.asset(
                                                              'assets/images/saudi_sign.png',
                                                              width: 10,
                                                              height: 10,
                                                            ),
                                                          ),
                                                          showPrefixIcon: true,
                                                          hintText: AppLocalizations
                                                                  .of(context)!
                                                              .depositInWalletHint,
                                                          controller:
                                                              amountAdded,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          secure: false,
                                                          validator: (value) {
                                                            if (double.tryParse(
                                                                        value!) ==
                                                                    null ||
                                                                double.parse(
                                                                        value) <=
                                                                    0.0) {
                                                              return AppLocalizations
                                                                      .of(context)!
                                                                  .withdrawAmountValidate;
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                        !paymentGetWayLoading?CustomButton(
                                                          colors:
                                                              AppColors.green,
                                                          title:
                                                              "${AppLocalizations.of(innerContext)?.submit}",
                                                          onTap: () async {
                                                            if (_formKey
                                                                .currentState!
                                                                .validate()) {

                                                              BlocProvider.of<
                                                                          PayOneBloc>(
                                                                      innerContext)
                                                                  .add(AddBalance(
                                                                      amount: int.tryParse(amountAdded.text)!
                                                                          ));
                                                            }
                                                          },
                                                        ):const CircularProgressIndicator(color: AppColors.green,)
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ).then((_) {
                          amountAdded.clear();
                          setState((){
                            paymentGetWayLoading=false;
                          });
                        });
                      }),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('للأيداع بمحفظتك الاستثمارية'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '1- التحويل المباشر من حسابك البنكي لحساب محفظتك الاستثمارية'),
                              SizedBox(height: 8),
                              Text(
                                  'بعد اجراء عمليات التحقق من بياناتك كمستثمر(KYC) وتعديل حالة ملفك ل (معتمد) اتبع الخطوات التالية لشحن محفظتك :'),
                              SizedBox(height: 8),
                              Text(
                                  '* من خلال (لوحة المعلومات) احصل على الآيبان الخاص بمحفظتك .'),
                              Text(
                                  '* من خلال تطبيق البنك الخاص بحسابك الشخصي يمكنك ايداع المبلغ المراد شحن المحفظة الاستثمارية الخاص بك.'),
                              Text(
                                  'ادخل حساب الآيبان الخاص بمحفظتك الاستثمارية واختر إسم البنك (البنك العربي الوطني) والمبلغ .'),
                              Text(
                                  '* للتأكد من رصيد المحفظة الاستثمارية من خلال منصة التنافسية او تطبيق التنافسية اختر أيقونة (محفظتي )وتعرف على رصيد المحفظة.'),
                              SizedBox(height: 16),
                              Text(
                                  '2- التحويل من خلال قنوات الدفع (بطاقات الأئتمان،ApplePay,STC Pay,Sadad):'),
                              SizedBox(height: 8),
                              Text(
                                  '* من خلال أيقونة (قنوات الدفع) بصفحة محفظتي يمكنك اختيار طريقة الدفع للإيداع بمحفظتك الاستثمارية.'),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text(AppLocalizations.of(context)!.ok),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.inWallet,
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14,
                      color: Colors.red),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<FinicialStatmentBloc, FinicialStatmentState>(
                builder: (context, state) {
                  if (state is FinicalStatmentSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.40,
                      child: Card(
                        shadowColor: AppColors.shadowBlack.withOpacity(0.5),
                        elevation: 4,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    topLeft: Radius.circular(16)),
                                color: AppColors.blue,
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .monetaryMovements,
                                  style: const TextStyle(
                                      color: AppColors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              height: MediaQuery.of(context).size.height * 0.31,
                              child: ListView.builder(
                                  reverse: true,
                                  itemCount: state.walletData.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(state.walletData[index].createdAt!
                                            .substring(0, 10)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15, bottom: 15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: AppColors.softWhite,
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () async {
                                                          await Navigator.pushNamed(
                                                              context,
                                                              FinicialDetails
                                                                  .routename,
                                                              arguments: state
                                                                      .walletData[
                                                                  index]);
                                                        },
                                                        icon: const Icon(Icons
                                                            .arrow_back_ios_new)),
                                                    state.walletData[index]
                                                                .type ==
                                                            1
                                                        ? Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .deposit)
                                                        : Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .withdraw),
                                                  ],
                                                ),
                                                state.walletData[index].type ==
                                                        1
                                                    ? Row(
                                                        children: [
                                                          Text(
                                                              "${state.walletData[index].creditAmount}"),
                                                          AppColors.saudiSign(
                                                              AppColors.black)
                                                        ],
                                                      )
                                                    : Row(
                                                        children: [
                                                          Text(
                                                              "${state.walletData[index].debitAmount}"),
                                                          AppColors.saudiSign(
                                                              AppColors.black)
                                                        ],
                                                      )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Card(
                      shadowColor: AppColors.shadowBlack.withOpacity(0.5),
                      elevation: 4,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  topLeft: Radius.circular(16)),
                              color: AppColors.blue,
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.monetaryMovements,
                                style: const TextStyle(
                                    color: AppColors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              height: MediaQuery.of(context).size.height * 0.23,
                              child: const Text("you haven't data"))
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }

}
