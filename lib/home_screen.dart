import 'package:flutter/material.dart';
import 'package:xoassig/app_colors.dart';
import 'package:xoassig/bord_Screen.dart';
import 'package:xoassig/custom_field.dart';

import 'board_arguments.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String playerName = "";
  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();
  String selcted = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    // how ti know about sizes oe fonts or the height of kryborad
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.linearGradientLightBlue,
            AppColors.linearGradientDarkBlue,
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/Frame 1.png",
                  height: 0.43 * height,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  "Tix-Tac-Toe",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomField(
                    playerController: player1Controller,
                    hintText: "Player one Name",
                  ),
                  SizedBox(height: 10),
                  CustomField(
                    playerController: player2Controller,
                    hintText: "Player two Name",
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Pick who goes first?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selcted = "x";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(39),
                          decoration: BoxDecoration(
                            color: selcted == "x"
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Image.asset(
                            "assets/images/Vector 1.png",
                            width: 86,
                            height: 86,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selcted = "o";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(39),
                          decoration: BoxDecoration(
                            color: selcted == "o"
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Image.asset(
                            "assets/images/Ellipse 1.png",
                            width: 86,
                            height: 86,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (player1Controller.text.isNotEmpty &&
                          player2Controller.text.isNotEmpty &&
                          selcted.isNotEmpty) {
                        Navigator.pushNamed(
                          context,
                          BordScreen.routeName,
                          arguments: BoardArguments(
                            player1: player1Controller.text,
                            player2: player2Controller.text,
                            selectedPlayer: selcted,
                          ),
                        );
                      }
                    },
                    child: Text("Start Game"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//calculator Done
// magzine Done
// xo game Done
//facebook Done
//spaceapp
//islamy
// evently
// news
