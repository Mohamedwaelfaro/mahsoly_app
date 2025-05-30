import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymobPaymentScreen extends StatelessWidget {
  final String paymentToken;

  const PaymobPaymentScreen({super.key, required this.paymentToken});

  @override
  Widget build(BuildContext context) {
    final String iframeUrl =
        'https://accept.paymob.com/api/acceptance/iframes/926704?payment_token=$paymentToken';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إتمام الدفع'),
          backgroundColor: Colors.green,
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(iframeUrl)),
          onLoadStart: (controller, url) {
            debugPrint("Started loading: $url");
          },
          onLoadStop: (controller, url) {
            debugPrint("Finished loading: $url");
          },
          onLoadError: (controller, url, code, message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('حدث خطأ أثناء تحميل صفحة الدفع')),
            );
          },
        ),
      ),
    );
  }
}
