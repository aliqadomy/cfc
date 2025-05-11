
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/appColor.dart';
import '../../../commonWidget/CutsomButton.dart';
import '../../../commonWidget/appBar.dart';
import '../../../commonWidget/customTextInput.dart';

import '../card.dart';
import 'campgainAttachmentBloc/attachment_bloc.dart';
import 'investBloc/invest_bloc.dart';
import 'oppourtintyDataDetailsBloc/oppourtunity_data_details_bloc.dart';

@immutable
class OpportunitydetailsAndattachment extends StatefulWidget {
  static const routename = '/oppourinutyDetailsAndAttachment';
  OpportunitydetailsAndattachment({super.key, required this.allOpportunityModel});
  dynamic allOpportunityModel;

  @override
  State<OpportunitydetailsAndattachment> createState() =>
      _OpportunitydetailsAndattachmentState();
}

class _OpportunitydetailsAndattachmentState
    extends State<OpportunitydetailsAndattachment> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  DateTime? closeDate; // Parse to DateTime
  DateTime now = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  TextEditingController investAmount = TextEditingController();
  bool isLoading=false;

  @override
  void initState() {
    BlocProvider.of<AttachmentBloc>(context).add(OpportunityAttachmentsEvent(
        id: widget.allOpportunityModel.id!.toInt()));
    BlocProvider.of<OppourtunityDataDetailsBloc>(context).add(
        OppourtinityDataDetailsEvents(
            id: widget.allOpportunityModel.id!.toInt()));
    print(widget.allOpportunityModel.closeDate!);
    closeDate = DateTime.parse(widget.allOpportunityModel.closeDate!);
    print(now);
    print("zzxzxzxzxz${closeDate!.isBefore(now)}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background2,
      appBar: CustomAppBar(backIcon: true,),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
        child: ListView(
          children: [
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.82,
                height: MediaQuery.of(context).size.height * 0.34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${widget.allOpportunityModel.tagline}",
                              style: const TextStyle(
                                  fontSize: 20, color: AppColors.white),
                            ),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: DashedCircularProgressBar.aspectRatio(
                                aspectRatio: 1, // width ÷ height
                                progress: (widget.allOpportunityModel
                                            .totalValuation! /
                                        widget.allOpportunityModel
                                            .maxInvestment!) *
                                    100,
                                maxProgress: 100,
                                corners: StrokeCap.butt,
                                foregroundColor: Colors.red,
                                backgroundColor: const Color(0xffeeeeee),
                                foregroundStrokeWidth: 10,
                                backgroundStrokeWidth: 10,
                                animation: true,
                                child: Center(
                                  child: ValueListenableBuilder(
                                    valueListenable: _valueNotifier,
                                    builder: (_, double value, __) => Text(
                                      '${((widget.allOpportunityModel.totalValuation! / widget.allOpportunityModel.maxInvestment!) * 100).toStringAsFixed(2)}%',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14),
                                    ),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${AppLocalizations.of(context)!.sukValue} : ${widget.allOpportunityModel.sharePrice}",
                                  style: const TextStyle(
                                      color: AppColors.white, fontSize: 16),
                                ),
                                const SizedBox(width: 5,),
                               AppColors.saudiSign(Colors.white)
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${AppLocalizations.of(context)!.totVal} : ${widget.allOpportunityModel.totalValuation}",
                                  style: const TextStyle(
                                      color: AppColors.white, fontSize: 16),
                                ),
                                const SizedBox(width: 5,),
                                AppColors.saudiSign(Colors.white)                              ],
                            ),

                            Text(
                              "${AppLocalizations.of(context)!.rR} : ${widget.allOpportunityModel.apr}%",
                              style: const TextStyle(
                                  color: AppColors.white, fontSize: 16),
                            ),
                          ],
                        ),
                         SizedBox(
                          height: MediaQuery.of(context).size.height*0.07,
                        ),
                        closeDate!.isBefore(now)
                            ? const SizedBox()
                            : CustomButton(
                          w: 0.50,
                                colors: AppColors.green,
                                title: AppLocalizations.of(
                                    context)!
                                    .investBtn,
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (innerContext) {
                                      return
                                     StatefulBuilder(builder:(innerContext, StateSetter setState){
                                      return BlocProvider.value(
                                         value: context.read<InvestBloc>(),
                                         child: BlocListener<InvestBloc,
                                             InvestState>(
                                           listener: (context, state) {
                                             if (state is InvestSuccessful) {
                                               setState(() {
                                                 isLoading = false;
                                               });
                                               ShowToastWidget.showToast("Success Investment");
                                               Future.delayed(const Duration(seconds: 2),(){
                                                 Navigator.pop(context);
                                               });
                                             } else if (state is InvestFailed) {
                                               setState(() {
                                                 isLoading=state.isLoading;
                                               });
                                               ShowToastWidget.showToast(
                                                   state.msg!);
                                             }
                                           },
                                           child: Padding(
                                             padding:
                                             MediaQuery.of(context).viewInsets,
                                             child: SizedBox(
                                                 height: MediaQuery.of(context)
                                                     .size
                                                     .height *
                                                     0.29,
                                                 width: MediaQuery.of(context)
                                                     .size
                                                     .width,
                                                 child: isLoading
                                                     ? const Center(
                                                   child: CircularProgressIndicator(),
                                                 )
                                                     : Padding(
                                                   padding: const EdgeInsetsDirectional.all(16),
                                                   child: Column(
                                                     mainAxisAlignment: MainAxisAlignment.start,
                                                     crossAxisAlignment: CrossAxisAlignment.end,
                                                     children: [
                                                       GestureDetector(
                                                         onTap: () {
                                                           Navigator.pop(context);
                                                         },
                                                         child: Container(
                                                           width: 30,
                                                           height: 30,
                                                           decoration: BoxDecoration(
                                                             color: AppColors.blue,
                                                             borderRadius: BorderRadius.circular(25),
                                                           ),
                                                           child: const Icon(
                                                             Icons.close,
                                                             color: AppColors.white,
                                                           ),
                                                         ),
                                                       ),
                                                       Text(
                                                         AppLocalizations.of(context)!.invest,
                                                         style: const TextStyle(
                                                           color: AppColors.blue,
                                                           fontSize: 20,
                                                         ),
                                                       ),
                                                       Text(
                                                         '${AppLocalizations.of(context)?.maximum} ${widget.allOpportunityModel.totalValuation!.toDouble() - widget.allOpportunityModel.maxInvestment!.toDouble()}',
                                                       ),
                                                       Form(
                                                         key: _formKey,
                                                         child: Column(
                                                           mainAxisAlignment: MainAxisAlignment.start,
                                                           crossAxisAlignment: CrossAxisAlignment.end,
                                                           children: [
                                                             Customtextinput(
                                                               hintText: 'ادخل المبلغ المراد الاستثمار به',
                                                               controller: investAmount,
                                                               keyboardType: TextInputType.number,
                                                               secure: false,
                                                               validator: (value) {
                                                                 if (value == null || value.isEmpty) {
                                                                   return 'هذا الحقل مطلوب';
                                                                 } else if (double.tryParse(value) == null ||
                                                                     double.parse(value) >
                                                                         (widget.allOpportunityModel.totalValuation!.toDouble() -
                                                                             widget.allOpportunityModel.maxInvestment!.toDouble())) {
                                                                   return 'الحد الاقصى المسموح به ${widget.allOpportunityModel.totalValuation!.toDouble() - widget.allOpportunityModel.maxInvestment!.toDouble()} ر.س';
                                                                 }
                                                                 return null;
                                                               },
                                                               icon: const Icon(Icons.swap_vert_outlined),
                                                             ),
                                                             CustomButton(
                                                               colors: AppColors.green,
                                                               title: AppLocalizations.of(context)!.investBtn,
                                                               onTap: () {
                                                                 if (_formKey.currentState!.validate()) {
                                                                   setState(() {
                                                                     isLoading = true; // Show loading spinner
                                                                   });
                                                                   BlocProvider.of<InvestBloc>(context).add(
                                                                     InvestEvents(
                                                                       amount: investAmount.text,
                                                                       campaign: widget.allOpportunityModel.id!.toString(),
                                                                     ),
                                                                   );
                                                                 } else {
                                                                   print("Validation Failed");
                                                                 }
                                                               },
                                                             ),
                                                           ],
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                 )
                                             ),
                                           ),
                                         ),
                                       );
                                     } );
                                    },
                                  ).then((value) {});
                                }),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            closeDate!.isBefore(now)
                ? const SizedBox(): BlocBuilder<AttachmentBloc, AttachmentState>(
              builder: (context, state) {
                if (state is AttachmentSuccess) {
                  return CustomCardOpp(
                    name: AppLocalizations.of(context)!.oppAttach,
                    nameColor: AppColors.white,
                    backGroundColor: AppColors.blue,
                    index: state.list.length,
                    withImage: false,
                    iconColor: AppColors.white,
                    attachment: state.list,
                  );
                }
                return CustomCardOpp(
                  name: AppLocalizations.of(context)!.oppAttach,
                  nameColor: AppColors.white,
                  backGroundColor: AppColors.blue,
                  index: 0,
                  withImage: false,
                  iconColor: AppColors.white,
                );
              },
            ),

            closeDate!.isBefore(now)
                ? const SizedBox(): BlocBuilder<OppourtunityDataDetailsBloc,
                OppourtunityDataDetailsState>(
              builder: (context, state) {
                if (state is OppourtinityDataDetailsSuccess) {
                  return CustomCardOpp(
                    name: AppLocalizations.of(context)!.workTeam,
                    nameColor: AppColors.white,
                    backGroundColor: AppColors.blue,
                    index: state.opportunityDetails.campaign!.team!.length,
                    withImage: false,
                    iconColor: AppColors.white,
                    oppDetails: state.opportunityDetails.campaign!.team,
                  );
                }
                return CustomCardOpp(
                  name: AppLocalizations.of(context)!.workTeam,
                  nameColor: AppColors.white,
                  backGroundColor: AppColors.blue,
                  index: 0,
                  withImage: false,
                  iconColor: AppColors.white,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
