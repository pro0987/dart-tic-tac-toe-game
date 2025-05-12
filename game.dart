import 'player.dart';

class Game {
  int turn = 0;
  String activePlayer = 'X';
  bool gameOver = false;
  String winner = '';
  List<List> oddsWinning = [
    //row
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    //col
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    //diameter
    [1, 5, 9],
    [3, 5, 7],
  ];

  void takeTurn(int index) {
    if (invalidMove(index)) return;

    updatePlayerMove(index);
    turn++;

    cheakGameOver();

    switchPlayer();
  }

  bool isWinner(String activePlayer) {
    List<int> positions = activePlayer == 'X' ? Player.playerX : Player.playerO;
    for (var odds in oddsWinning) {
      if (odds.every((e) => positions.contains(e))) {
        return true;
      }
    }
    return false;
  }

  void switchPlayer() {
    activePlayer = activePlayer == 'X' ? 'O' : 'X';
  }

  void playAgain() {
    Player.playerO.clear();
    Player.playerX.clear();
    activePlayer = 'X';
    turn = 0;
    winner = '';
    gameOver = false;
    print('Replay the game >_< \n');
  }

  void updatePlayerMove(int index) {
    if (this.activePlayer == 'X')
      Player.playerX.add(index);
    else
      Player.playerO.add(index);
  }

  bool invalidMove(int index) {
    if (gameOver) {
      print('The game is already over and the winner is $winner');
      return true;
    } else if (Player.playerX.contains(index) ||
        Player.playerO.contains(index)) {
      print('It has already been used!! try again');
      return true;
    }
    return false;
  }

  void cheakGameOver() {
    if (isWinner(activePlayer)) {
      winner = activePlayer;
      gameOver = true;
      print('player $winner has win :)\n ');
      return;
    } else if (turn == 9) {
      winner = 'Draw';
      gameOver = true;
      print('The game ended in a draw -_- \n');
      return;
    }
  }
}
