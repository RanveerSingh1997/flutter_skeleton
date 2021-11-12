import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/data/app_state_manager.dart';
import 'package:flutter_skeleton/navigation/app_pages.dart';
import 'package:provider/provider.dart';

class NetworkStatus extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: ApplicationPages.networkPage,
      key: ValueKey(ApplicationPages.networkPage),
      child: const NetworkStatus(),
    );
  }

  const NetworkStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appStatus = Provider.of<AppStateManager>(context);
    return Material(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(appStatus.connectionStatus),
            SizedBox(
              height: 40,
            ),
            Icon(
              Icons.network_check_sharp,
              size: 90,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              "Please check your connection again\nor connect with Wi-Fi",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Go to Settings'),
            )
          ],
        ),
      ),
    );
  }
}
