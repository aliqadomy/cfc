import 'package:flutter/material.dart';

import '../../../../core/appColor.dart';
import '../../../commonWidget/appBar.dart';

class NotificationScreen extends StatefulWidget {
  static const routename='/Notification';
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final List<Map<String, String>> notifications = [
    {
      'title': 'New Message',
      'body': 'You have a new message from John.',
      'date': '2025-03-14 12:45',
    },
    {
      'title': 'Account Update',
      'body': 'Your account has been successfully updated.',
      'date': '2025-03-13 08:30',
    },
    {
      'title': 'Reminder',
      'body': 'Don\'t forget to check the upcoming event.',
      'date': '2025-03-12 14:20',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(backIcon: true,),
      backgroundColor: AppColors.background2,
      body: Column(
        children: [

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height-200,
          //   child: ListView.builder(
          //     itemCount: notifications.length,
          //     itemBuilder: (context, index) {
          //       final notification = notifications[index];
          //       final title = notification['title']!;
          //       final body = notification['body']!;
          //       final date = notification['date']!;
          //
          //       return GestureDetector(
          //         onTap: (){
          //           showDialog(
          //             barrierDismissible: false,
          //             context: context,
          //             builder: (BuildContext context) {
          //               return AlertDialog(
          //                 title: Text(title),
          //                 content: SingleChildScrollView(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(body),
          //                       SizedBox(height: 8),
          //                       Text(
          //                         'Date: $date',
          //                         style: TextStyle(color: Colors.grey),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 actions: [
          //                   TextButton(
          //                     onPressed: () {
          //                       Navigator.of(context).pop(); // Close the dialog
          //                     },
          //                     child: Text('Close'),
          //                   ),
          //                 ],
          //               );
          //             },
          //           );
          //         },
          //         child: Card(
          //           margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          //           child: ListTile(
          //             contentPadding: const EdgeInsets.all(16),
          //             title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          //             subtitle: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(body),
          //                 const SizedBox(height: 4),
          //                 Text(
          //                   date,
          //                   style: const TextStyle(color: Colors.grey, fontSize: 12),
          //                 ),
          //               ],
          //             ),
          //             trailing: const Icon(Icons.notifications),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          //   ),
          // )
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height-200,
                child: const Center(child: Text("There are currently no notifications available"),)
            ),
          )
        ],
      ),
    );
  }
}
