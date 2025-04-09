import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/domain/model/VisitorResponse.dart';
import 'package:cfc_main/presintation/visitor/visitor_bloc.dart';
import 'package:cfc_main/presintation/visitor/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Visitorscreen extends StatelessWidget {
   Visitorscreen({super.key});
  static const routename='/visitor';
  List<VisitorResponse> listOne=[];
  List<VisitorResponse> listTwo=[];
  List<VisitorResponse> listThree=[];
  bool isOpend=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background2,
      ),
        backgroundColor: AppColors.background2,
        body: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16),
          child: BlocBuilder<VisitorBloc, VisitorState>(
  builder: (context, state) {

    if (state is VisitorSuccess) {
      return ListView(
        children: [
    Image.asset("assets/images/helpLarge.png",width: 100,height: 100,),
    SizedBox(height: MediaQuery.of(context).size.height*0.1,),
    CustomContainer(withImage: true,name: 'الاستثمار', icon: Icons.arrow_drop_down,image: 'assets/images/handshake.png',nameColor: AppColors.blue,backGroundColor: AppColors.whiteBox,iconColor: AppColors.blue,data: state.typeOne,index: state.typeOne.length),
    const SizedBox(height: 15,),
    CustomContainer(withImage: true,name: 'التمويل', icon: Icons.arrow_drop_down,image: 'assets/images/index2_visitor.png',nameColor: AppColors.white,backGroundColor: AppColors.blue,iconColor: AppColors.white,data: state.typeTwo,index: state.typeTwo.length),
    const SizedBox(height: 15,),
    CustomContainer(withImage: true,name: 'القانونية', icon: Icons.arrow_drop_down,image: 'assets/images/index3_visitor.png',nameColor: AppColors.white,backGroundColor: AppColors.blue,iconColor: AppColors.white,data: state.typeThree,index: state.typeThree.length),
    const SizedBox(height: 15,),
    CustomContainer(withImage: true,name: 'التنافسية المالية', icon: Icons.arrow_drop_down,image: 'assets/images/index4_visitor.png',nameColor: AppColors.white,backGroundColor: AppColors.blue,iconColor: AppColors.white,data: state.typeFour,index: state.typeFour.length),


        ],
      );
    } else{

      return const Center(child: CircularProgressIndicator());
    }

  },
),
        )
      );
  }
}
