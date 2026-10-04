import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xoassig/board_btn.dart';

import 'app_colors.dart';
import 'board_arguments.dart';

class BordScreen extends StatefulWidget {
  static const String routeName = '/BordScreen';

  @override
  State<BordScreen> createState() => _BordScreenState();
}

class _BordScreenState extends State<BordScreen> {
  String message = "Player 1’s Turn";
  int scoreplayer1 = 0;
  int scoreplayer2 = 0;

  List<String> board = ["", "", "", "", "", "", "", "", ""];
  late String selectedPlayer;

  @override
  Widget build(BuildContext context) {
    BoardArguments args =
        ModalRoute.of(context)!.settings.arguments as BoardArguments;

    selectedPlayer = args.selectedPlayer;

    return Container(
      decoration: const BoxDecoration(
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            args.player1,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Text(scoreplayer1.toString()),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            args.player2,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Text(scoreplayer2.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 24),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(44),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              BoardBtn(
                                title: board[0],
                                onClick: onBoardButtonclick,
                                index: 0,
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                              BoardBtn(
                                title: board[1],
                                onClick: onBoardButtonclick,
                                index: 1,
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                              BoardBtn(
                                title: board[2],
                                onClick: onBoardButtonclick,

                                index: 2,
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2, color: Colors.black, height: 0),
                        Expanded(
                          child: Row(
                            children: [
                              BoardBtn(
                                title: board[3],
                                onClick: onBoardButtonclick,
                                index: 3,
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                              BoardBtn(
                                title: board[4],
                                onClick: onBoardButtonclick,
                                index: 4,
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                              BoardBtn(
                                title: board[5],
                                onClick: onBoardButtonclick,
                                index: 5,
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 2, color: Colors.black, height: 0),
                        Expanded(
                          child: Row(
                            children: [
                              BoardBtn(
                                title: board[6],
                                onClick: onBoardButtonclick,
                                index: 6,
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                              BoardBtn(
                                title: board[7],
                                onClick: onBoardButtonclick,
                                index: 7,
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                              BoardBtn(
                                title: board[8],
                                onClick: onBoardButtonclick,
                                index: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    board = ["", "", "", "", "", "", "", "", ""];
                    setState(() {});
                  },
                  child: Text(
                    "play again",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onBoardButtonclick(int index) {
    if (message == "Player 1’s Turn") {
      board[index].isEmpty ? message = "Player 2’s Turn" : null;
      board[index].isEmpty ? board[index] = selectedPlayer : null;
      winners(selectedPlayer) ? resetGame("player one won") : null;
      setState(() {});
    } else if (message == "Player 2’s Turn") {
      String char =selectedPlayer == "o" ? "x":"o";
      board[index].isEmpty ? message = "Player 1’s Turn" : null;
      board[index].isEmpty
          ? board[index] = char
          : null;
      winners(char) ? resetGame("player 2 won") : null;

    }

    setState(() {});
  }

  bool winners(String char) {
    if (board[0].isNotEmpty && board[0] == board[1] && board[1] == board[2]&& board[0]==char) {
      return true;
    } else if (board[3].isNotEmpty &&
        board[3] == board[4] &&
        board[4] == board[5]&& board[3]==char) {
      return true;
    } else if (board[6].isNotEmpty &&
        board[6] == board[7] &&
        board[7] == board[8] &&
        board[6]==char) {
      return true;
    } else if (board[0].isNotEmpty &&
        board[0] == board[3] &&
        board[3] == board[6] &&
        board[0]==char) {
      return true;
    } else if (board[1].isNotEmpty &&
        board[1] == board[4] &&
        board[4] == board[7] &&
        board[1]==char) {
      return true;
    } else if (board[2].isNotEmpty &&
        board[2] == board[5] &&
        board[5] == board[8] &&
        board[2]==char) {
      return true;
    } else if (board[0].isNotEmpty &&
        board[0] == board[4] &&
        board[4] == board[8] &&
        board[0]==char) {
      return true;
    } else if (board[2].isNotEmpty &&
        board[2] == board[4] &&
        board[4] == board[6] &&
        board[2]==char) {
      return true;
    } else {
      return false;
    }
  }

  resetGame(String text) async {
    message = text;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    board = ["", "", "", "", "", "", "", "", ""];
    message = "Player 1’s Turn";
    if (text == "player one won") {
      scoreplayer1 += 10;
    } else {
      scoreplayer2 += 10;
    }
  }

}
//player 1 ==> shape
//player ==> shape
//player 2 =>
// 0 1 2
// 3 4 5
// 6 7 8
