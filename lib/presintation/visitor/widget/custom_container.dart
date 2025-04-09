import 'package:cfc_main/core/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart' as html_parser;

import '../../../domain/model/VisitorResponse.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer(
      {super.key,
      required this.name,
       this.icon,
        this.image="",
         this.withImage=true,
      required this.nameColor,
      required this.backGroundColor,
      required this.iconColor,
       this.data,
        this.opp,
      required this.index});

  String? name;
  String image;
  IconData? icon;
  bool withImage;
  Color nameColor;
  Color backGroundColor;
  Color iconColor;
  List<VisitorResponse>? data;
  List<dynamic>? opp;
  int? index;
  VoidCallback? onPressed;
  bool isOpend = false;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.isOpend
        ? Card(
      shadowColor:AppColors.shadowBlack.withOpacity(0.5),
          elevation: 4,
          child: GestureDetector(
            onTap: (){
              widget.isOpend == false
                  ? widget.isOpend = true
                  : widget.isOpend = false;
              setState(() {});
            },
            child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    color: AppColors.whiteBox,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 14, right: 14,top: 10,bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.07,
                      decoration: const BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/Iconup.png',color: AppColors.white,),
                          Text(
                            widget.name!,
                            style: TextStyle(color: widget.isOpend? AppColors.white:widget.nameColor, fontSize: 20),
                          ),
                          widget.withImage?Image.asset(
                            widget.image!,
                            color: widget.iconColor,
                          ):const SizedBox()
                      ]),
                    ),
                    const Divider(
                      color: AppColors.shadowBlack,
                      height: 0.1,
                      thickness: 0.4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: widget.index,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                GestureDetector(
                                  onTap: (){
                                     widget.data==null?const SizedBox()
                                        :showModalBottomSheet(context: context,
                                         barrierColor: Colors.black.withOpacity(0.7),
                                         builder: (BuildContext context){
                                   return Padding(
                                     padding: const EdgeInsets.all(24.0),
                                     child: ListView(
                                         children: [
                                           Text(removeHtmlTags(widget.data![index].description??""))
                                         ],
                                       ),
                                   );

                                    });
                                  },
                                  child:widget.data ==null?  widget.index==0? const Text("لا يوجد بيانات",style: TextStyle(
                                      color: AppColors.blue, fontSize: 20),):Text(
                                    widget.opp![index].tagline!,
                                    style: const TextStyle(
                                        color: AppColors.blue, fontSize: 20),
                                  ):Text(
                            widget.data![index].title!,
                            style: const TextStyle(
                            color: AppColors.blue, fontSize: 20),
                            )
                                ),
                              index == widget.index!-1 ?const SizedBox(): const Divider(height: 0.5,)
                              ]),
                            );
                          }),
                    ),
                  ],
                ),
              ),
          ),
        )
        : Card(
      elevation: 5,
      shadowColor:AppColors.shadowBlack.withOpacity(0.5),
          child: GestureDetector(
            onTap: (){
              widget.isOpend == false
                  ? widget.isOpend = true
                  : widget.isOpend = false;
              setState(() {});
            },
            child: Container(
                padding: const EdgeInsets.only(left: 14, right: 14),
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    color: widget.backGroundColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/Iconup.png',color: widget.isOpend?AppColors.blue:widget.iconColor),
                    Text(
                      widget.name!,
                      style: TextStyle(color: widget.nameColor, fontSize: 20),
                    ),
                    widget.withImage?Image.asset(
                      widget.image!,
                      color: widget.iconColor,
                    ):const SizedBox()
                  ],
                ),
              ),
          ),
        );
  }

  String removeHtmlTags(String htmlString) {
    final document = html_parser.parse(htmlString);
    final String parsedString = document.body?.text ?? '';
    return parsedString;
  }
}

