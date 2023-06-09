import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController textEditingController = TextEditingController(
      text: GetIt.I.get<SharedPreferences>().getString("username"));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8, left: 18, right: 12, bottom: 18),
            child: Text(
              "Settings",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontFamily: "Cartoonist",
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: InkWell(
                    onTap: () {
                      showGeneralDialog(
                          barrierLabel: "",
                          barrierDismissible: true,
                          transitionDuration: Duration(milliseconds: 250),
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            Tween<Offset> tween;
                            tween = Tween(
                                begin: const Offset(0, 1), end: Offset.zero);
                            return SlideTransition(
                              position: tween.animate(
                                CurvedAnimation(
                                    parent: animation, curve: Curves.easeInOut),
                              ),
                              child: child,
                            );
                          },
                          context: context,
                          pageBuilder: (ctx, _, __) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.12,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.12,
                                  left: 50,
                                  right: 50),
                              height: 300,
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Username",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 60, 42, 4),
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                          decoration: InputDecoration(
                                              hintText: "",
                                              border: OutlineInputBorder(),
                                              focusedBorder:
                                                  OutlineInputBorder(),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Icon(
                                                    Icons.account_circle_sharp),
                                              )),
                                          controller: textEditingController,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (textEditingController.text
                                              .trim()
                                              .isNotEmpty) {
                                            GetIt.I
                                                .get<SharedPreferences>()
                                                .setString(
                                                    "username",
                                                    textEditingController.text
                                                        .trim());
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Center(
                                                      child: Text(
                                                          "Username changed"),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 800)));
                                          }
                                        },
                                        child: Text(
                                          "Enter",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Coffee Crafts"),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          elevation: 30.0,
                                          backgroundColor: Colors.brown,
                                          shadowColor: Colors.amber,
                                          foregroundColor: Colors.amber,
                                        ),
                                      )
                                    ]),
                              ),
                            );
                          }).then((value) {
                        textEditingController.text = GetIt.I
                                .get<SharedPreferences>()
                                .getString("username") ??
                            "Name";
                      });
                    },
                    child: SizedBox(
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.account_circle_sharp,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Change Username",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontFamily: "Cartoonist",
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                              SizedBox(
                                width: 14,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/orders");
                    },
                    child: SizedBox(
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.assignment,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Order History",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontFamily: "Cartoonist",
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                              SizedBox(
                                width: 14,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Are you sure?'),
                            content: Text(
                                'If you delete your account, all your data will be lost.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.brown),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.brown),
                                ),
                                onPressed: () {
                                  GetIt.I.get<SharedPreferences>().clear();
                                  Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .pushReplacementNamed("/getstarted");
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.delete_forever,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Delete Account",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontFamily: "Cartoonist",
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                              SizedBox(
                                width: 14,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  child: SizedBox(
                    height: 60,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 22,
                              child: Image.asset(
                                "assets/veganicon.png",
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Show Only Vegan",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontFamily: "Cartoonist",
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Switch(
                                activeColor: Colors.brown,
                                value: GetIt.I
                                        .get<SharedPreferences>()
                                        .getBool("onlyvegan") ??
                                    false,
                                onChanged: (val) {
                                  setState(() {
                                    GetIt.I
                                        .get<SharedPreferences>()
                                        .setBool("onlyvegan", val);
                                  });
                                }),
                            SizedBox(
                              width: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
