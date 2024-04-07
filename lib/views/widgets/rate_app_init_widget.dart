import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateAppInitWidget extends StatefulWidget {
  final Widget Function(RateMyApp) builder;

  const RateAppInitWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  _RateAppInitWidgetState createState() => _RateAppInitWidgetState();
}

class _RateAppInitWidgetState extends State<RateAppInitWidget> {
  RateMyApp? rateMyApp;

  static const playStoreId = 'com.android.chrome';
  static const appstoreId = 'com.apple.mobilesafari';

  @override
  Widget build(BuildContext context) => RateMyAppBuilder(
        rateMyApp: RateMyApp(
          googlePlayIdentifier: playStoreId,
          appStoreIdentifier: appstoreId,
          minDays: 0,
          minLaunches: 0,
          remindDays: 0,
          remindLaunches: 0,
        ),
        onInitialized: (context, rateMyApp) {
          setState(() => this.rateMyApp = rateMyApp);
          print('Should Open Dialog: ${rateMyApp.reset()}');
          print(
              'Should Open Dialog: ${rateMyApp.conditions[0].isMet},${rateMyApp.conditions[1].isMet},${rateMyApp.conditions[2].isMet}');
          if (rateMyApp.shouldOpenDialog) {
            rateMyApp.showStarRateDialog(
              context,
              title: 'Rate this app',
              message: 'You like this app ?',
              actionsBuilder: (context, stars) => [
                TextButton(
                  onPressed: () async {
                    stars = stars ?? 0;

                    if (stars! < 4) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop<RateMyAppDialogButton>(
                          context, RateMyAppDialogButton.rate);
                      await rateMyApp
                          .callEvent(RateMyAppEventType.rateButtonPressed);

                      if ((await rateMyApp.isNativeReviewDialogSupported) ??
                          false) {
                        await rateMyApp.launchNativeReviewDialog();
                      }
                      rateMyApp.launchStore();
                    }
                  },
                  child: const Text('OK'),
                ),
              ],
              ignoreNativeDialog: true,
              dialogStyle: const DialogStyle(
                titleAlign: TextAlign.center,
                messageAlign: TextAlign.center,
                messagePadding: EdgeInsets.only(bottom: 20),
              ),
              starRatingOptions: const StarRatingOptions(),
              onDismissed: () =>
                  rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
            );
          }
        },
        builder: (context) => rateMyApp == null
            ? Center(child: CircularProgressIndicator())
            : widget.builder(rateMyApp!),
      );
}
