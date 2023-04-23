# chess
</br>




```
   _____   _    _   ______    _____    _____
  / ____| | |  | | |  ____|  / ____|  / ____|
 | |      | |__| | | |__    | (___   | (___
 | |      |  __  | |  __|    \___ \   \___ \
 | |____  | |  | | | |____   ____) |  ____) |
  \_____| |_|  |_| |______| |_____/  |_____/
```
<br />
<div align="center">

<h3 align="center">Terminal Chess in Ruby</h3>

  <p align="center">
    Play chess in your computer terminal programmed with the ruby language. The chess game has a number of features such as single player against the computer, 2 players at the same terminal, or watch the computer play against itself.
    <br />
    ·
    <a href="https://github.com/RaspberryRat/chess/issues">Report Bug</a>
    ·
    <a href="https://github.com/RaspberryRat/chess/issues">Request Feature</a>
  </p>
</div>


## readme-top

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#built-with">Built With</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#starting-the-game">Starting the Game</a></li>
    <li><a href="#game-play">Game Play</a></li>
    <li><a href="#game-rules">Game Rules</a>
     <ul>
        <li>
        <a href="#pawn-movement">Pawn Movement</a>
        </li>
        <li>
        <a href="#rook-movement">Rook Movement</a>
        </li>
        <li>
        <a href="#knight-movement">Knight Movement</a>
        </li>
        <li>
        <a href="#bishop-movement">Bishop Movement</a>
        </li>
        <li>
        <a href="#queen-movement">Queen Movement</a>
        </li>
         <li>
        <a href="#king-movement">King Movement</a>
        </li>
         <li>
        <a href="#check">Check</a>
        </li>
        <li>
        <a href="#checkmate">Checkmate</a>
        </li>
      </ul>
    </li>
    <li><a href="#special-rules">Special Rules</a>
      <ul>
        <li>
        <a href="#promotion">Promotion</a>
        </li>
         <li>
        <a href="#castling">Castling</a>
        </li>
         <li>
        <a href="#en-passant">En Passant</a>
        </li>
      </ul>
    </li>
    <li><a href="#contact">Contact</a></li>

  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

 <p>I programmed this to practice and develop my programming while I am learning.</p>

![Screenshot of gameboard](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_gameboard.png)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Built With -->
## Built With

* ![Ruby](https://www.ruby-lang.org/en/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started
<p>To play go to replit => https://replit.com/@SmellyCosby/chess?v=1</p>


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Starting the Game

<p>The game allows you to start a new game.</p>
<p>Load the game from a save file.</p>
<p>Start a game using fen notation.</p>

![Screen of start of game options](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_new_game.png)

<h3>Option 1 will allow you to start a new game</h3>

![Game type options](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_game_type.png)

</br></br>
<h3>Option 2 will allow you to load a game from a file. To choose this option, you must have saved a game previously.</h3>

<h3>Option 3 will allow you to enter fen notation. </h3>
<p>For details about fen notation check out this website: https://www.chess.com/terms/fen-chess</p>
<p>To begin a game with option 3, the user must enter notation with the following format: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq -'</p>
<p>The first part of the notation represents the game board, with the placement of pieces on each row being marked with a letter and empty spaces with a number.</p>
<p>The letters represent the pieces: R: rook, N: knight, B: Bishop, Q: queen, K: king, and P: pawn.</p>
<p>Capital letters are white game pieces and lowercase letters are black game pieces</p>
<p>The break between rows represented by a /.</p>
<p>A number equals the amount of squares in that row that are empty. For example P7 means the row has a white pawn in the first (leftest most) square followed by 7 empty squares. A second example: r2KQ2r, starting with the left square is a black rook, two empty squares, a white king, a white queen, two empty squares, and a second black rook.</p>
<p>There will be a space following the 8 rows then a lowercase 'w' or 'b'. This represents the current players turn. 'w' means it is the white player's turn and 'b' means it is the black player's turn.</p>
<p> A game can not be loaded this way without all 8 rows represented and a turn indicator ('w' or 'b'). You can also have castling notation and En Passant notation but neither of it is required to load a game with this method.</p>

<p>Following the turn indicator is another space and will have up to the following letters 'KQkq', but also may contain no letters here. This represents if there is a castling option available. 'K' or 'k' represents a kingside castle. 'Q' or 'q' represents the queenside castle for the white and black player resepctively.</p>
<p>The appropriate letter will be removed from the notation if a rook or the king moves during the game, meaning that castling option is no longer available.</p>

<p>The final part of the notation is followed by another space. This is the En Passant notation and is not required to start a game.</p>
<p>This En Passant Notation can be a '-' or 'a3' through 'h3' or 'a6' through 'h6'.</p>
<p>En Passant notation indicates if a pawn made a double move on the previous players turn. If so, that piece can be taken by a pawn.</p>

## Game Play

<h2>Game type</h2>
<p>After choosing how to start the game you will be given three choices:</p>

![Screenshot of gametype](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_gametype.png)

<p>You can play single player, multiplayer or watch the computer duke it out!</p>

<p>If you choose option 1: single player, you will play by yourself against a computer AI opponent on easy. Hard mode coming soon...</p>
<p>If you choose option 2: multiplayer, you will play against another human opponent. Both players must use the same terminal and keyboard to play.</p>
<p>If you choose option 3: simulate game, both players will be computer AIs on easy. Watch the computer take on itself and try to guess who will win!</p>

<p>After choosing option 1 or option 2, the human players choose what colour they will be. White player is always player 1 and goes first. Black player is always player 2 and plays second.</p>

![Screenshot of colour choice](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_colourchoice.png)

<p>Human players can then choose their name which will show up when it is their turn:</p>

![Screenshot of name choice](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_namepicker.png)
<p></p>
<p></p>

![Screenshot of game board showing name](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_name_gameboard.png)
<p></p>
<p></p>



<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- Game Rules -->
## Game Rules

<p>To win the game, you must put your opponent's king in checkmate. This means the opponent has no legal moves available where their king will not be captured on your next turn. Essentially the goal of the game is to capture the opponent's king.</p>

<h2>Piece Movement</h2>
<p>To move a piece, enter the coordinates of a piece on the board using the format column row. For example, to choose a pawn at 'a2' simply enter 'a2'.</p>
<p>After entering a piece that has legal moves, the piece selected will be highlighted in blue and all squares that are legal moves will be highlighted in red.</p>

![Screenshot of piece selection](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_select.png)

<p>Then enter the coordinates of the square you want to move to, legel moves will be listed below the game board. For example in the screenshot above you could choose 'b2', 'c3', 'c5', or 'b6'.</p>

<p>All pieces follow the movement rules for chess.</p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Pawn movement

<p>♙</p>
<p>Pawns can move forward a single space. White pawns can only move in the driection where the row is a higher value (for example, 'a2' to 'a3'). Black pawns can only move in the direciton where rows are a decreasing number (for example, 'a7' to 'a6').</p>
<p>When pawns are at their starting position, row 2 for white pawns and row 7 for black pawns, they can move forward 2 squares for the pawns first move. Example, pawn 'c2' can move to square 'c3' or 'c4'</p>

![Screenshot of pawn initial move](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_pawnmove.png)

<p>Pawns can only capture an opponents piece that is at a diagonal forward direction to the pawn's square. For example pawn at a 'c4', there an opponent piece at locations 'b5', 'c5', and 'd5'. The white pawn can capture the pieces at location 'b5' or 'd5'. The pawn can not capture the piece at location 'c5'.</p>

![Screenshot of pawn capture](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_pawncapture.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Rook movement

<p>♖</p>
<p>A rook can move horizontally or vertically up to as many squares that are empty. Rooks cannot pass through another piece during its movement. It cannot end up on the same square as a piece of the same colour. If a rook ends its movement on a piece of the enemy colour, the player captures that piece and removes it from the gameboard. Rooks cannot move diagonally.</p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Knight movemenet

<p>♘</p>
<p>A knight moves in an 'L' shape. This means it can move 1 square in any direction, say verticlaly, than 2 squares horizontally. Or 1 square horizontal direction, than 2 squares vertically. For example, a knight at 'a4' could move to 'b2', 'c3', 'c5', or 'b6'.</p>

![Screenshot of piece selection](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_select.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Bishop movement

<p>♗</p>
<p>A bishop can move diagonally up to as many squares that are empty, it cannot end pass through a piece during its movement and must end its movement on an empty square or a square with an opponent's piece. If the bishop ends its movement on a square where there is an opponent's piece, it captures that piece and removes it from the gameboard.</p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Queen movement

<p>♕</p>
<p>Queens have all movement options, the queen can move, horizontally, vertically, or diagonally up to as many squares that are empty. The queen cannot end pass through a piece during its movement and must end its movement on an empty square or a square with an opponent's piece. If the queen ends its movement on a square where there is an opponent's piece, it captures that piece and removes it from the gameboard.</p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## King movement

<p>♔</p>
<p>Kings have all movement options, however the king is limited to moving only a single square. The king can move, horizontally, vertically, or diagonally, but cannot ends its movement on a piece of the same colour. If the king ends its movement on a square where there is an opponent's piece, it captures that piece and removes it from the gameboard.</p>

![Screenshot of king move](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_kingmove.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Check

<p>A king is in check when your opponent can capture it on their next turn. When a king is in check, the only moves you can make result with your king no longer in check. This could be by moving either the king that in in check, or another piece that blocks, or captures the piece that is causing the king to be in check. The game will not let you make any other move. Additionally, you cannot make a move that results with your king being in check at the end of the move.</p>

![Screenshot of king check](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_kingcheck.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Checkmate

<p>A king is in checkmate when there are no legal moves available that don't result in the current player's king being out of check. In the screenshot below, the black player's king is in checkmate. The black player has no legal moves where the king is not in check. When a player is in checkmate the other player is the winner and the game ends</p>

![Screenshot of checkmate](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_checkmate.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Special Rules

<p>There are three additional special rules in chess that are important for a player to know. Promotion which effects a pawn that makes it to the other end of the board, castling, which is a special king movememnt, and En Passant, which is a special pawn capture move.</p>

## Promotion

<p>If a pawn moves it to the last square of the opposite side of the board, meaning row 8 for the white player, or row 1 for the black player, the pawn can be promoted to a queen, bishop, knight, or rook. Contrary to popular belief, a player can choose any of these options even if the player hasn't captured that piece from their opponent. This means you could have 2 or more queens! After choosing a piece, the pawn transforms into that piece for the rest of the game.</p>

![Screenshot of promotion option](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_promotion1.png)

![Screenshot of after promotion](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_promotion2.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Castling

<p>Castling is a special move available to the king which results in the king moving two squares, while simultaneously moving a rook to the far side of the king, protecting it.</p>
<p>A king can castle on either the right or left side of the board which is called a 'kingside castle' or 'queenside castle' respectively. A castle results in moving the king two squares either left or right. Meaning it will end up in column 'c' or 'g'. The rook will move past the king and end up in column 'd' or 'g' respectively.</p>
<p>You can only castle if there is a clear path to castle, and your king is not put in check on any of the squares on the way to the castle location. Addiitonally, castling, must be the first move a king makes in the game, and the first move the respective rook makes in the game. If he king moves at all, you can no longer castle. If a rook moves, you can no longer castle on that side of the board.</p>

<p>To castle, choose your king piece, for example enter 'e1', if you can castle you will have a move 'kingside castle' and/or 'queenside castle'. Enter in either 'k' or 'kingside castle' or 'q' or 'queenside castle' to choose that move. Both pieces will then be moved to the correct squares.</p>

![Screenshot of castle option](https://github.com/RaspberryRat/chess/blob/main/screen_shots/castle_options.png)

![Screenshot of castle after](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_promotion2.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



## En Passant

<p>En Passant, mean means 'in passing' in french is a special move available only to pawns. This speical move allows you to capture a pawn with your own pawn when the opponent move's their pawn 2 squares. If an opponent's pawn moves 2 squares, and you would have been able to capture it if the opponent only moved a single square, you will then have the option to capture that pawn as if it only moved the 1 square. See the screenshots below to see how it works in the game.</p>
<p>The white player's pawn at 'a5' is within two squares of the black player.</p>

![Screenshot of enpassant](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_enpassant1.png)

<p>At this point the black player moves their pawn from 'b7' to 'b5' thinking they can avoid getting it captured.</p>

![Screenshot of enpassant](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_enpassant2.png)

<p>However, the rule of En Passant, which means in passing in french, allows the white player to still capture the black player's pawn.</p>


![Screenshot of enpassant](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_enpassant_options.png)


<p>The white player has move to 'b6' and capture the pawn at 'b5'</p>

![Screenshot of enpassant](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_enpassant3.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>





<!-- CONTACT -->
## Contact

Project Link: [https://github.com/RaspberryRat/chess](https://github.com/RaspberryRat/chess)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
