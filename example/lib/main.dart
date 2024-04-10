import "package:flutter/material.dart";
import "package:vibration/vibration.dart";

void main() => runApp(const VibratingApp());

class VibratingApp extends StatelessWidget {
  const VibratingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Vibration Plugin example app"),
          ),
          body: Builder(
            builder: (BuildContext context) => Center(
              child: Column(
                children: <Widget>[
                  const ElevatedButton(
                    onPressed: Vibration.vibrate,
                    child: Text("Vibrate for default 500ms"),
                  ),
                  ElevatedButton(
                    child: const Text("Vibrate for 1000ms"),
                    onPressed: () async {
                      await Vibration.vibrate(duration: 1000);
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Vibrate with pattern"),
                    onPressed: () async {
                      const SnackBar snackBar = SnackBar(
                        content: Text(
                          "Pattern: wait 0.5s, vibrate 1s, wait 0.5s, vibrate "
                          "2s, wait 0.5s, vibrate 3s, wait 0.5s, vibrate 0.5s",
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      await Vibration.vibrate(
                        pattern: <int>[
                          500,
                          1000,
                          500,
                          2000,
                          500,
                          3000,
                          500,
                          500,
                        ],
                      );
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Vibrate with pattern and amplitude"),
                    onPressed: () async {
                      const SnackBar snackBar = SnackBar(
                        content: Text(
                          "Pattern: wait 0.5s, vibrate 1s, wait 0.5s, vibrate "
                          "2s, wait 0.5s, vibrate 3s, wait 0.5s, vibrate 0.5s",
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      await Vibration.vibrate(
                        pattern: <int>[
                          500,
                          1000,
                          500,
                          2000,
                          500,
                          3000,
                          500,
                          500,
                        ],
                        intensities: <int>[0, 128, 0, 255, 0, 64, 0, 255],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
