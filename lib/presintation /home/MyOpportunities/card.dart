import 'dart:io';

import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/domain/model/opportunity/Attachment.dart';
import 'package:cfc_main/domain/model/opportunity/Team.dart';
import 'package:cfc_main/presintation%20/home/MyOpportunities/opportunityDetails/opportunityDetails.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:path_provider/path_provider.dart';

import '../../../domain/model/opportunity/all_opportunity_model.dart';


class CustomCardOpp extends StatefulWidget {
  CustomCardOpp(
      {super.key, required this.name,
      this.icon,
      this.image = "",
      this.withImage = true,
      required this.nameColor,
      required this.backGroundColor,
      required this.iconColor,
        this.oppDetails,
      this.opp,

      this.attachment,
      required this.index,
      });

  String? name;
  String image;
  IconData? icon;
  bool withImage;
  Color nameColor;
  Color backGroundColor;
  Color iconColor;
  List<dynamic>? opp;
  List<Attachment>? attachment;
  List<Team>? oppDetails;
  int? index;
  VoidCallback? onPressed;
  bool isOpend = false;

  @override
  State<CustomCardOpp> createState() => _CustomCardOpp();
}

class _CustomCardOpp extends State<CustomCardOpp> {
  FlutterDownloader file = FlutterDownloader();
  final _flutterMediaDownloaderPlugin = MediaDownload();


  @override
  Widget build(BuildContext context) {
    return widget.isOpend
        ? GestureDetector(
      onTap: () {
        widget.isOpend == false
            ? widget.isOpend = true
            : widget.isOpend = false;
        setState(() {});
      },
          child: Card(
              shadowColor: AppColors.shadowBlack.withOpacity(0.5),
              elevation: 4,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 16,right: 16),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.07,
                    decoration: const BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))
                    ),

                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/Iconup.png',
                            color: AppColors.white,
                          ),
                          Text(
                            widget.name!,
                            style: TextStyle(
                                color: widget.isOpend
                                    ? AppColors.white
                                    : widget.nameColor,
                                fontSize: 20),
                          ),
                          widget.withImage
                              ? Image.asset(
                                  widget.image,
                                  color: widget.iconColor,
                                )
                              : const SizedBox()
                        ]),
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
                            child: widget.oppDetails == null
                                ?
                                 Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                        widget.opp == null
                                            ? widget.index == 0
                                                ? const Text(
                                                    "لا يوجد بيانات",
                                                    style: TextStyle(
                                                        color: AppColors.blue,
                                                        fontSize: 20),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {},
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        IconButton(
                                                            onPressed:
                                                                () async {
                                                                  var uri = widget.attachment![index].attachment!;
                                                                  var encoded = Uri.encodeFull(uri);

                                                                  _flutterMediaDownloaderPlugin.downloadMedia(context,
                                                                      encoded);
                                                            },
                                                            icon: const Icon(
                                                              Icons.download,
                                                              color:
                                                                  Colors.green,
                                                            )),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          widget
                                                              .attachment![
                                                                  index]
                                                              .attachment!
                                                              .substring(39),
                                                          style: const TextStyle(
                                                              color: AppColors
                                                                  .green,
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                            : widget.index == 0
                                                ? const Text(
                                                    "لا يوجد بيانات",
                                                    style: TextStyle(
                                                        color: AppColors.blue,
                                                        fontSize: 20),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          OpportunityDetails
                                                              .routename,
                                                          arguments: widget
                                                              .opp![index]);
                                                    },
                                                    child: Text(
                                                      widget
                                                          .opp![index].tagline??"",
                                                      style: const TextStyle(
                                                          color: AppColors.blue,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                        index == widget.index! - 1
                                            ? const SizedBox()
                                            : const Divider(
                                                height: 0.5,
                                              )
                                      ]):
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                widget.index == 0
                                    ? const Text(
                                  "لا يوجد بيانات",
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontSize: 20),
                                )
                                    : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                                      children: [
                                        Text(
                                          widget.oppDetails![index]
                                              .name!,
                                          style: const TextStyle(
                                              color: AppColors.blue,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          widget.oppDetails![index].designation!,
                                          style: const TextStyle(
                                              color: AppColors.blue,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                index == widget.index! - 1
                                    ? const SizedBox()
                                    : const Divider(
                                  height: 0.5,
                                )
                              ])
                          );
                        }),
                  ),
                ],
              ),
            ),
        )
        : GestureDetector(
      onTap: () {
        widget.isOpend == false
            ? widget.isOpend = true
            : widget.isOpend = false;
        setState(() {});
      },
          child: Card(
              elevation: 5,
              shadowColor: AppColors.shadowBlack.withOpacity(0.5),
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
                    Image.asset('assets/images/Iconup.png',
                        color: widget.isOpend
                            ? AppColors.blue
                            : widget.iconColor),
                    Text(
                      widget.name!,
                      style: TextStyle(color: widget.nameColor, fontSize: 20),
                    ),
                    widget.withImage
                        ? Image.asset(
                            widget.image,
                            color: widget.iconColor,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
        );
  }

  Future<void> downloadAndSavePdf(String url, String fileName) async {
    try {
      // Create Dio instance
      Dio dio = Dio();

      // Get the application document directory
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/$fileName';

      // Download the PDF from the provided URL
      Response response = await dio.download(url, filePath,
          onReceiveProgress: (received, total) {
        if (total != -1) {
          print(
              "Download progress: ${(received / total * 100).toStringAsFixed(0)}%");
        }
      });

      if (response.statusCode == 200) {
        print("File downloaded and saved at: $filePath");
      } else {
        print("Failed to download file: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred while downloading file: $e");
    }
  }

  String removeHtmlTags(String htmlString) {
    final document = html_parser.parse(htmlString);
    final String parsedString = document.body?.text ?? '';
    return parsedString;
  }
}
