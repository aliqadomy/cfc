import 'package:cfc_main/core/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../commonWidget/CutsomButton.dart';
import '../../../commonWidget/appBar.dart';
import '../../../commonWidget/flag_nearest_date.dart';
import 'opporunityDetailsAndAttachment.dart';

class OpportunityDetails extends StatelessWidget {
  static const routename = '/oppourinutyDetails';
  final dynamic allOpportunityModel;

   const OpportunityDetails({super.key,required this.allOpportunityModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background2,
      appBar: CustomAppBar(backIcon: true,),
      body:   Padding(
        padding: EdgeInsetsDirectional.only(start:24,end:30,top: MediaQuery.of(context).size.height*0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(allOpportunityModel!.tagline!,style: const TextStyle(color: AppColors.green,fontSize: 20,fontWeight: FontWeight.w600),),
            const SizedBox(height: 44,),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width ,
                child: Card(
                  shadowColor: AppColors.shadowBlack.withOpacity(0.5),
                  elevation: 100,
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
                        child:  Center(
                          child: Text(
                            AppLocalizations.of(context)!.oppInfo,
                            style: const TextStyle(
                                color: AppColors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20),
                        height: MediaQuery.of(context).size.height * 0.46,
                        child: ListView(
                            children: [
                          NearestDateFlag(
                            nearestDateModel:AppLocalizations.of(context)!.murSuk,
                            title: AppLocalizations.of(context)!.product,
                          ),
                          NearestDateFlag(
                            // add percntage
                            nearestDateModel:
                            allOpportunityModel!.apr,
                            title: AppLocalizations.of(context)!.annRtu,
                          ),
                          NearestDateFlag(
                            nearestDateModel:
                            allOpportunityModel!.totalValuation,
                            title: AppLocalizations.of(context)!.totVal,
                          ),
                          NearestDateFlag(
                            nearestDateModel: allOpportunityModel!.openDate,
                            title: AppLocalizations.of(context)!.stDat,
                          ),
                          NearestDateFlag(
                            nearestDateModel: allOpportunityModel!.closeDate,
                            title: AppLocalizations.of(context)!.clDat,
                          ),

                              NearestDateFlag(
                                nearestDateModel: calculateDateDifference(allOpportunityModel!.openDate,allOpportunityModel!.closeDate),
                                title: AppLocalizations.of(context)!.duration,
                              ),

                        ]),
                      )
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 22,),
            CustomButton(colors: AppColors.green, title: AppLocalizations.of(context)!.preview, onTap:(){
              Navigator.pushNamed(context,OpportunitydetailsAndattachment.routename,arguments:  allOpportunityModel);
            })

          ],
        ),
      )

    );
  }
  int calculateDateDifference(String startDateStr, String endDateStr) {
    DateTime startDate = DateTime.parse(startDateStr);
    DateTime endDate = DateTime.parse(endDateStr);

    Duration difference = endDate.difference(startDate);

    return difference.inDays;
  }
}
