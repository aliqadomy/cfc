import 'dart:io';

import 'package:cfc_main/core/appColor.dart';
import 'package:cfc_main/domain/model/opportunity/Attachment.dart';
import 'package:cfc_main/domain/model/opportunity/Team.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:path_provider/path_provider.dart';

import '../../../domain/model/opportunity/all_opportunity_model.dart';
import 'opportunityDetails/opportunityDetails.dart';

class CustomCardOpp extends StatefulWidget {
  CustomCardOpp({
    super.key,
    required this.name,
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

class _CustomCardOpp extends State<CustomCardOpp> with SingleTickerProviderStateMixin {
  FlutterDownloader file = FlutterDownloader();
  final _flutterMediaDownloaderPlugin = MediaDownload();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isOpend = !widget.isOpend;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color:AppColors.background2, // Fixed: Body background stays white
          borderRadius: widget.isOpend
              ? const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
              : BorderRadius.zero,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: AppColors.blue, // Header remains blue
                borderRadius: widget.isOpend
                    ? const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.isOpend?
              Image.asset('assets/images/Icondown.png', color: AppColors.white)
                      :
                  Image.asset('assets/images/Iconup.png', color: AppColors.white),
                  Text(
                    widget.name ?? '',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                    ),
                  ),
                  widget.withImage
                      ? Image.asset(widget.image, color: widget.iconColor)
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState:
              widget.isOpend ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.index,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: widget.oppDetails == null
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.opp == null
                              ? widget.index == 0
                              ? const Text(
                            "لا يوجد بيانات",
                            style: TextStyle(color: AppColors.blue, fontSize: 20),
                          )
                              : GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    var uri = widget.attachment![index].attachment!;
                                    var encoded = Uri.encodeFull(uri);
                                    _flutterMediaDownloaderPlugin.downloadMedia(context, encoded);
                                  },
                                  icon: const Icon(Icons.download, color: Colors.green),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  widget.attachment![index].attachment!.substring(39),
                                  style: const TextStyle(color: AppColors.green, fontSize: 12),
                                ),
                              ],
                            ),
                          )
                              : widget.index == 0
                              ? const Text(
                            "لا يوجد بيانات",
                            style: TextStyle(color: AppColors.blue, fontSize: 20),
                          )
                              : GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                OpportunityDetails.routename,
                                arguments: widget.opp![index],
                              );
                            },
                            child: Text(
                              widget.opp![index].tagline ?? "",
                              style:
                              const TextStyle(color: AppColors.blue, fontSize: 20),
                            ),
                          ),
                          if (index != widget.index! - 1)
                            const Divider(height: 0.5),
                        ],
                      )
                          : Column(
                        children: [
                          widget.index == 0
                              ? const Text(
                            "لا يوجد بيانات",
                            style: TextStyle(color: AppColors.blue, fontSize: 20),
                          )
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                widget.oppDetails![index].name!,
                                style:
                                const TextStyle(color: AppColors.blue, fontSize: 20),
                              ),
                              Text(
                                widget.oppDetails![index].designation!,
                                style:
                                const TextStyle(color: AppColors.blue, fontSize: 20),
                              ),
                            ],
                          ),
                          if (index != widget.index! - 1)
                            const Divider(height: 0.5),
                        ],
                      ),
                    );
                  },
                ),
              ),
              secondChild: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> downloadAndSavePdf(String url, String fileName) async {
    try {
      Dio dio = Dio();
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/$fileName';

      Response response = await dio.download(url, filePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          print("Download progress: \${(received / total * 100).toStringAsFixed(0)}%");
        }
      });

      if (response.statusCode == 200) {
        print("File downloaded and saved at: \$filePath");
      } else {
        print("Failed to download file: \${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred while downloading file: \$e");
    }
  }

  String removeHtmlTags(String htmlString) {
    final document = html_parser.parse(htmlString);
    return document.body?.text ?? '';
  }
}
