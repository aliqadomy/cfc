import 'package:flutter/material.dart';

import '../../../../core/appColor.dart';
import '../../../../domain/model/wallet/finicialStatmentModel.dart';
import '../../../commonWidget/flag_nearest_date.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class FinicialDetails extends StatelessWidget {
   FinicialDetails({Key? key,required this.data}) : super(key: key);
  static const routename = '/finicalDetails';
  WalletData? data;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background2,
      appBar:AppBar(
        elevation: 0,
        backgroundColor: AppColors.background2,
        actions: [
          Padding(
              padding: const EdgeInsets.only(left: 12,right: 12),
              child: Image.asset(
                'assets/images/new logo.png',
                width: 111,
                height: 50,
              ))
        ],
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.only(
              top: 100, left: 20, right: 20),
          height: MediaQuery.of(context).size.height * 0.60,
          child: Card(
            color: AppColors.white.withOpacity(0.9),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                  children: [
                NearestDateFlag(
                  nearestDateModel: data!.refNum,
                  title: AppLocalizations.of(context)!.refNum,
                ),



                NearestDateFlag(
                  nearestDateModel:
                  data!.debitAmount==0?AppLocalizations.of(context)!.deposit:AppLocalizations.of(context)!.withdraw,
                  title: AppLocalizations.of(context)!.typeOfMov,

                ),
                NearestDateFlag(
                  nearestDateModel: data!.creditAmount,
                  title: AppLocalizations.of(context)!.deposit,
                  haveSign: true,
                ),
                NearestDateFlag(
                  nearestDateModel: data!.debitAmount,
                  title: AppLocalizations.of(context)!.withdraw,
                  haveSign: true,
                ),
                NearestDateFlag(
                  nearestDateModel: data!.walletAfter,
                  title: AppLocalizations.of(context)!.balanceAfMov,
                  haveSign: true,
                ),
                NearestDateFlag(
                  nearestDateModel:data!.createdAt!.substring(0,10),
                  title:AppLocalizations.of(context)!.dateOfMov,
                ),

              ]),
            ),
          ),
        )
      ],),
    );
  }
}
