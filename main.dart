import 'dart:io';

import 'board.dart';
import 'game.dart';

void main() {
  bool again = true;
  while (again) {
    Game game = Game();
    Board board = Board();
    print('| 1 , 2 , 3 |\n| 4 , 5 , 6 |\n| 7 , 8 , 9 |');

    while (game.turn != 9 && !game.gameOver) {
      //Display gameplay to the user
      print('Current turn: ${game.turn}');
      print('Active Player: ${game.activePlayer}');
      print('\nEnter the box number [1 -> 9]:');

      //Input
      String? input = stdin.readLineSync();
      if (isValid(input)) {
        game.takeTurn(int.parse(input!));
        board.board();
        print('----------');
      } else
        print('Wrong entry!!! , Must enter  1 -> 9\n\n----------\n');
    }
    print('Do you want to play again ? (y/n)');
    String? reply = stdin.readLineSync();
    if (reply == 'y') {
      game.playAgain();
      again = true;
    } else if (reply == 'n') {
      again = false;
    } else {
      print('Wrong entry !!! , Must enter (y/n)');
    }
  }
}

bool isValid(String? input) {
  if (input == null) return false;
  int? processedInput = int.tryParse(input);
  return processedInput != null && processedInput >= 1 && processedInput <= 9;
}
