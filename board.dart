import 'player.dart';

class Board {
  board() {
    List<List<String>> board = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' '],
    ];

    void update() {
      for (int i = 0; i < 9; i++) {
        int row = (i / 3).floor();
        int col = i % 3;

        if (Player.playerX.contains(i + 1)) {
          board[row][col] = 'X';
        } else if (Player.playerO.contains(i + 1)) {
          board[row][col] = 'O';
        }
      }
    }

    void show() {
      board.forEach((row) {
        print('\t\t\t| ${row[0]} | ${row[1]} | ${row[2]} |');
      });
    }

    update();
    show();
  }
}
