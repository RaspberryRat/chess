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
  <a href="https://github.com/RaspberryRat/chess">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

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



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>

      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
<h2>About</h2>

 <p>I programmed this to practice and develop my programming while I am learning.</p>

![Screenshot of gameboard](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_gameboard.png)
</ br>
</ br>


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<p>Built With</p>

* ![Ruby](https://www.ruby-lang.org/en/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
<p>!To play go to replit => https://replit.com/@SmellyCosby/Terminal-chess-game</p>


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
<h2>Starting the game</h2>

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


<h1>Game play</h1>

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
</br></br>
![Screenshot of game board showing name](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_name_gameboard.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- Game Rules -->
<h1>Game Rules</h1>

<h2>Piece Movement</h2>
<p>Describe Piece movement</p>
<h3>Pawn movement</h3>
<h3>Rook movement</h3>
<h3>Knight movement</h3>
<h3>Bishop movement</h3>
<h3>Queen movement</h3>
<h3>King movement</h3>

<h2>Check</h2>
<p>description of check</p>

<h2>Checkmate</h2>
<p>description of checkmate</p>






<h1>Special Rules</h1>

<h2>Promotion</h2>
<p>describe how promotion works</p>

<h2>Castling</h2>
<p>You can only castle if there is a clear path to castle, and your king is not put in check on any of the squares on the way to the castle location.</p>



<h2>En Passant</h2>
<p>The white player's pawn at 'a5' is within two squares of the black player.</p>

![Screenshot of enpassant](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_enpassant1.png)

<p>At this point the black player moves their pawn from 'b7' to 'b5' thinking they can avoid getting it captured.</p>

![Screenshot of enpassant](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_enpassant2.png)

<p>However, the rule of En Passant, which means in passing in french, allows the white player to still capture the black player's pawn.</p>

![Screenshot of enpassant](https://github.com/RaspberryRat/chess/blob/main/screen_shots/screen_enpassant3.png)

<p>The white player has move to 'b6' and capture the pawn at 'b5'</p>


<!-- ROADMAP -->
## Roadmap

- [ ] Feature 1
- [ ] Feature 2
- [ ] Feature 3
    - [ ] Nested Feature

See the [open issues](https://github.com/github_username/repo_name/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email@email_client.com

Project Link: [https://github.com/github_username/repo_name](https://github.com/github_username/repo_name)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>

