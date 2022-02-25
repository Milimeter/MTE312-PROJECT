import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mteiot/const/firebase.dart';
import 'package:mteiot/routes/app_pages.dart';
import 'package:mteiot/utils/size-config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await initialization;
 //FirebaseApp firebaseApp = await Firebase.initializeApp();
  await GetStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().int(constraints);
      return GetMaterialApp(
        title: "MTEDOOR",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.SPLASHSCREEN,
        getPages: AppPages.routes,
        theme: ThemeData(fontFamily: 'Poppins'),
      );
    });
  }
}
