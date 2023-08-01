import 'package:flutter/material.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:gleap_unexpected_opening/secrets.dart';
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Gleap.initialize(
    token: GLEAP_TOKEN,
  );
  await Gleap.setLanguage(language: 'de');
  await Gleap.showFeedbackButton(false);
  await Gleap.setDisableInAppNotifications(disable: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: () async {
            try {
              final picker = ImagePicker();
              final XFile? pickedFile = await picker.pickImage(
                source: ImageSource.camera,
                maxHeight: 480,
                maxWidth: 640,
              );
              if (pickedFile != null) {
                print('Image picked');
              }
            } catch (e) {
              print(e.toString());
            }
          },
          child: const Text(
            'Pick image',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
