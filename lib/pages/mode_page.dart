import 'package:flutter/material.dart';
import 'package:untitled1/services/pref_service.dart';
class ModePage extends StatefulWidget {
  const ModePage({Key? key}) : super(key: key);

  @override
  State<ModePage> createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {

  String lang = "";

  @override
  initState() {
    super.initState();
    getLang();
  }

  void getLang() async {
    var res = PrefService.readData(StorageKey.lang) ?? "";
    lang = res as String;
    setState(() {});
  }

  void setLang(String result) async {
    await PrefService.setData(StorageKey.lang, result);
    getLang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(lang, style: TextStyle(fontSize: 30),),
          SizedBox(height: 20,),
          TextField(
            decoration: const InputDecoration(
              hintText: "Enter Language",
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
            onSubmitted: setLang,
          ),
        ],
      ),
    );
  }
}
