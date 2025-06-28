import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../domain/model/wallet/paymentGetWayModel.dart';

class PaymentWebViewPage extends StatefulWidget {
  final PaymentGetWayModel model;

  const PaymentWebViewPage({super.key, required this.model});

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewPageState();
}

class _PaymentWebViewPageState extends State<PaymentWebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    _loadPaymentForm(widget.model);
  }

  String buildHtmlFromPaymentModel(PaymentGetWayModel model) {
    final Map<String, dynamic> params = model.toJson();
    print(params);
    final redirectUrl = model.redirectURL ?? '';

    final buffer = StringBuffer();
    buffer.writeln('<!DOCTYPE html>');
    buffer.writeln('<html><head><meta charset="UTF-8"><title>Redirecting</title></head>');
    buffer.writeln('<body onload="document.forms[0].submit()">');
    buffer.writeln('<p>Redirecting to payment gateway...</p>');
    buffer.writeln('<form action="$redirectUrl" method="POST">');

    params.forEach((key, value) {
      if (key != 'RedirectURL' && value != null) {
        buffer.writeln('<input type="hidden" name="$key" value="$value" />');
      }
    });

    buffer.writeln('</form></body></html>');
    print(buffer);
    return buffer.toString();
  }
  Future<void> _loadPaymentForm(PaymentGetWayModel payment) async {
    final html = buildHtmlFromPaymentModel(payment);
    _controller.loadHtmlString(html);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Processing Payment")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
