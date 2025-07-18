import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/infrastructure/data_soruce/auth/LoginAuthProvider.dart';
import 'package:cfc_main/infrastructure/data_soruce/kyc/KycProvider.dart';
import 'package:cfc_main/infrastructure/data_soruce/my_wallet/myWalletProvider.dart';
import 'package:cfc_main/infrastructure/data_soruce/opportuinity/OpportunityDataProvider.dart';
import 'package:cfc_main/infrastructure/repository/WatheqRepo.dart';
import 'package:cfc_main/infrastructure/repository/kyc/KycRepo.dart';
import 'package:cfc_main/infrastructure/repository/loginRepo.dart';
import 'package:cfc_main/infrastructure/repository/my_wallet_repo/my_wallet_repo.dart';
import 'package:cfc_main/infrastructure/repository/opportunityRepo/opportunityRepo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../me/me_bloc.dart';
import '../MyOpportunities/MyOpportunitiesScreen.dart';
import '../MyOpportunities/all_opportuinity_bloc/all_opportunity_bloc.dart';
import '../MyOpportunities/mdefiyKyc/modefiy_kyc_bloc.dart';
import '../MyOpportunities/watheqBloc/watheq_bloc.dart';
import '../Settings/settings.dart';
import '../dashboard/dashboardScreen.dart';
import '../myProfile/MyProfile.dart';
import '../myProfile/kycBloc/kyc_bloc.dart';
import '../wallet/WalletScreen.dart';
import '../wallet/balanceBloc/balance_bloc.dart';
import '../wallet/finincialStatment/finicial_statment_bloc.dart';
import '../wallet/withdraw_bloc/withdraw_bloc.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  static const routename = '/mainHome';

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int currentPage = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.white,
            bottomNavigationBar: bottomNavigateBar(),
            body: currentPage == 0
                ? Dashboardscreen()
                : currentPage == 1
                ?
            MultiBlocProvider(
                providers: [
                  BlocProvider<BalanceBloc>(
                    create: (context) =>
                        BalanceBloc(myWalletRepo: MyWalletRepo(
                            myWalletprovider: Mywalletprovider())),
                    child: Container(),
                  ),
                  BlocProvider<FinicialStatmentBloc>(
                    create: (context) =>
                        FinicialStatmentBloc(
                            myWalletRepo:
                            MyWalletRepo(myWalletprovider: Mywalletprovider())),
                    child: Container(),

                  ),
                  BlocProvider<WithdrawBloc>(
                    create: (context) =>
                       WithdrawBloc(myWalletRepo: MyWalletRepo(myWalletprovider: Mywalletprovider())),
                    child: Container(),

                  ),

                ]
                , child: const Walletscreen())


                : currentPage == 2
                ? MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ModefiyKycBloc(opportunityRepo: OpportunityRepo(opportunitydataprovider: Opportunitydataprovider())
                  ),
                ),
                BlocProvider(create: (context)=>MeBloc(loginRepo: LoginRepo(loginAuthProvider: LoginAuthProvider(dio: Dio())))),
                BlocProvider(create:(context)=> AllOpportunityBloc(opportunityRepo: OpportunityRepo(opportunitydataprovider: Opportunitydataprovider()))),
                // BlocProvider(create:(context)=> MyOpportunityBloc(opportunityRepo: OpportunityRepo(opportunitydataprovider: Opportunitydataprovider()))),
                BlocProvider(create:(context)=> WatheqBloc(watheqRepo: WatheqRepo(opportunitydataprovider: Opportunitydataprovider()))),

              ],
              child:  BlocProvider(
                  create: (context) => KycBloc(kycRepo: KycRepo(kycprovider: Kycprovider())),
                  child : const Myopportunitiesscreen()),
            )
                : currentPage == 3
                ? MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => KycBloc(kycRepo: KycRepo(kycprovider: Kycprovider()))
              ),
              BlocProvider(
                create: (context) => ModefiyKycBloc(opportunityRepo: OpportunityRepo(opportunitydataprovider: Opportunitydataprovider())
                ),
              ),

            ],  child: const Myprofile(),)

                : const Settings()

        )
    );
  }

  bottomNavigateBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 8,
            offset: const Offset(0, -5), // changes position of shadow
          ),
        ],
      ),
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2, top: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabItem(
              tabName: AppLocalizations.of(context)!.home,
              tabFunction: () {
                setState(() {
                  currentPage = 0;
                });
              },
              iconItem: const Icon(Icons.home_outlined),
              imageUrl: "assets/images/home.png",
              height: 27,
              width: 24, status: currentPage==0?true:false,
            ),
            TabItem(
                tabName: AppLocalizations.of(context)!.myWallet,
                tabFunction: () {
                  setState(() {
                    currentPage = 1;
                  });
                },
                iconItem: const Icon(Icons.task_outlined),
                imageUrl: "assets/images/wallet.png",
                height: 27,
                width: 24, status: currentPage==1?true:false,),

            TabItem(
              tabName: AppLocalizations.of(context)!.myOppo,
              tabFunction: () {
                  setState(() {
                    currentPage = 2;
                  });
                },
                iconItem: const Icon(Icons.apps),
                imageUrl: "assets/images/myopportinuite.png",
                height: 37,
                width: 30, status: currentPage==2?false:false,),

            TabItem(
                tabName: AppLocalizations.of(context)!.profile,
                tabFunction: () {
                  setState(() {
                    currentPage = 3;
                  });
                },
                iconItem: const Icon(Icons.folder_delete_outlined),
                imageUrl: "assets/images/profile.png",
                height: 27,
                width: 24, status: currentPage==3?true:false,),
            TabItem(
                tabName: AppLocalizations.of(context)!.settings,
                tabFunction: () {
                  setState(() {
                    currentPage = 4;
                  });
                },
                iconItem: const Icon(Icons.person_2_outlined),
                imageUrl: "assets/images/settings.png",
                height: 27,
                width: 24, status: currentPage==4?true:false,),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatefulWidget {
  TabItem({ this.tabName="",
    required this.tabFunction,
    required this.iconItem,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.status,
    super.key});

  late String tabName="";
  late VoidCallback tabFunction;
  late Icon iconItem;
  late String imageUrl;
  late double height;
  late double width;
  late bool status;


  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tabFunction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            widget.imageUrl,
            height:      widget.tabName==''?35:45,
            width:    widget.tabName==''?35:45,
            color: widget.status?Colors.green:null,
          ),
          widget.tabName==''?const SizedBox():Text(widget.tabName,
              style: const TextStyle(fontSize: 14,))
        ],
      ),
    );
  }
}

