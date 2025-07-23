import 'package:cfc_main/domain/model/InvestorDashBoardModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/appColor.dart';
import '../../../domain/model/nearestDateModel.dart';
import '../../commonWidget/appBar.dart';
import '../../commonWidget/flag.dart';
import '../../commonWidget/flag_nearest_date.dart';
import 'InvestorBloc/dash_board_bloc.dart';
import 'accountNumberBloc/account_number_bloc.dart';
import 'nearestDate/nearest_date_bloc.dart';

class Dashboardscreen extends StatefulWidget {
  Dashboardscreen({Key? key}) : super(key: key);
  static const routename = '/dashboard';

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  InvestorDashBoardModel? investorDashed;
  NearestDateModel? nearestDateModel;
  bool isLoading = true;
  @override
  void initState() {
    BlocProvider.of<DashBoardBloc>(context).add(investordashboardEvent());
    BlocProvider.of<AccountNumberBloc>(context).add(accountNumberEvent());
    BlocProvider.of<NearestDateBloc>(context).add(NearestDateEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background2,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25,top: 25),
        child: BlocListener<NearestDateBloc, NearestDateState>(
            listener: (BuildContext context, NearestDateState state) {
              if (state is NearestDateSuccess) {
           setState(() {
             isLoading = false;
         });
              } else if (state is NearestDateFailed) {
                setState(() {
                  isLoading = false;
                });
              } else {
                setState(() {
                  isLoading = true;
                });
              }
            },
            child: isLoading == true
                ?  Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: AppColors.blue,
                      size: 100,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlocBuilder<DashBoardBloc, DashBoardState>(
                          builder: (context, state) {
                            if (state is InvestordashboardSuccess) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlagCard(
                                      signValue: true,
                                      index: 0,
                                      titleOne: state
                                          .investorDashBoardModel.totalProfit
                                          .toString(),
                                      titleTwo: AppLocalizations.of(context)!
                                          .grossProfit,
                                    ),
                                    FlagCard(
                                      signValue: true,
                                      index: 1,
                                      titleOne: state.investorDashBoardModel
                                          .totalInvestment
                                          .toString(),
                                      titleTwo: AppLocalizations.of(context)!
                                          .totalAmountsInvested,
                                    ),
                                    FlagCard(
                                      signValue: false,
                                      index: 2,
                                      titleOne: state.investorDashBoardModel
                                          .numberOfInvestment
                                          .toString(),
                                      titleTwo: AppLocalizations.of(context)!
                                          .numberOfInvestments,
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    FlagCard(
                                      signValue: true,
                                      index: 0,
                                      titleOne: "0",
                                      titleTwo: AppLocalizations.of(context)!
                                          .grossProfit,
                                    ),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    FlagCard(
                                      signValue: true,
                                      index: 1,
                                      titleOne: "0",
                                      titleTwo: AppLocalizations.of(context)!
                                          .totalAmountsInvested,
                                    ),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    FlagCard(
                                      signValue: false,
                                      index: 2,
                                      titleOne: "0",
                                      titleTwo: AppLocalizations.of(context)!
                                          .numberOfInvestments,
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocBuilder<AccountNumberBloc, AccountNumberState>(
                          builder: (context, state) {
                            if (state is AccountNumberSuccess) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/card.png"),
                                        fit: BoxFit.fill)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                          start: 20,
                                          top: 25,
                                        ),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .accountNumber,
                                          style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 20),
                                        )),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        start: 20,
                                        top: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/images/arabBank.png'),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.60,
                                            height: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: AppColors.white),
                                            child: Center(
                                              child: SelectableText(
                                                "${state.accountNumberModel.accountNumber}",
                                                style: const TextStyle(
                                                  color: AppColors.accountNumber,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/card.png"),
                                        fit: BoxFit.fill)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                                start: 25, top: 20),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .accountNumber,
                                          style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 20),
                                        )),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                        start: 20,
                                        top: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/images/arabBank.png'),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.60,
                                            height: 33,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: AppColors.white),
                                            child: const Center(
                                                child: Text(
                                              "no account number yet",
                                              style: TextStyle(
                                                  color:
                                                      AppColors.accountNumber,
                                                  fontSize: 12),
                                            )),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        BlocBuilder<NearestDateBloc, NearestDateState>(
                          builder: (context, state) {
                            if (state is NearestDateSuccess) {
                              nearestDateModel = state.nearestDateModel;
                              return Card(
                                shadowColor:
                                    AppColors.shadowBlack.withOpacity(0.5),
                                elevation: 4,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(16),
                                            topLeft: Radius.circular(16)),
                                        color: AppColors.blue,
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .theClosest,
                                          style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.27,
                                      child: ListView(
                                          children: [
                                           const SizedBox(height: 10,),
                                        NearestDateFlag(
                                          nearestDateModel:
                                              nearestDateModel!.principle,
                                          title: AppLocalizations.of(context)!
                                              .amoPaid,
                                          haveSign: true,
                                        ),
                                        NearestDateFlag(
                                          nearestDateModel:
                                              nearestDateModel!.profit,
                                          title: AppLocalizations.of(context)!
                                              .income,
                                          haveSign: nearestDateModel?.profit==null?false:true,
                                        ),
                                        NearestDateFlag(
                                            nearestDateModel:
                                                nearestDateModel!.fees,
                                            haveSign: nearestDateModel==null?false:true,
                                            title: AppLocalizations.of(context)!
                                                .fees),
                                        NearestDateFlag(
                                            nearestDateModel:
                                                nearestDateModel!.total,
                                            haveSign: nearestDateModel==null?false:true,
                                            title: AppLocalizations.of(context)!
                                                .total),
                                        NearestDateFlag(
                                            nearestDateModel:
                                                nearestDateModel!.date,
                                            haveSign: false,
                                            title: AppLocalizations.of(context)!
                                                .date),
                                      ]),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Card(
                                shadowColor:
                                AppColors.shadowBlack.withOpacity(0.5),
                                elevation: 4,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.07,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(16),
                                            topLeft: Radius.circular(16)),
                                        color: AppColors.blue,
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .theClosest,
                                          style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.27,
                                      child: ListView(
                                          children: [
                                            const SizedBox(height: 10,),
                                            NearestDateFlag(
                                              nearestDateModel: null,
                                              title: AppLocalizations.of(context)!.id,
                                              haveSign: true,
                                            ),
                                            NearestDateFlag(
                                              nearestDateModel: null,
                                              title: AppLocalizations.of(context)!.opiNum,
                                              haveSign: true,
                                            ),
                                            NearestDateFlag(
                                              nearestDateModel: null,
                                              title: AppLocalizations.of(context)!.invNum,
                                              haveSign: true,
                                            ),
                                            NearestDateFlag(
                                              nearestDateModel: null,
                                              title: AppLocalizations.of(context)!.amoPaid,
                                              haveSign: true,
                                            ),
                                            NearestDateFlag(
                                              nearestDateModel: null,
                                              title: AppLocalizations.of(context)!.income,
                                              haveSign: true,
                                            ),
                                            NearestDateFlag(
                                              nearestDateModel: null,
                                              title: AppLocalizations.of(context)!.tax,
                                              haveSign: true,
                                            ),
                                            NearestDateFlag(
                                              nearestDateModel: null,
                                              title: AppLocalizations.of(context)!.fees,
                                              haveSign: true,
                                            ),
                                            NearestDateFlag(
                                              nearestDateModel: null,
                                              title: AppLocalizations.of(context)!.total,
                                              haveSign: true,
                                            ),
                                            NearestDateFlag(
                                              nearestDateModel: null,
                                              title: AppLocalizations.of(context)!.date,
                                              haveSign: true,
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}
