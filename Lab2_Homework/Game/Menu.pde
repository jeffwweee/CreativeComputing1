class Menu {
  // still image for menus
  PImage main;
  PImage pause;
  PImage gameend;
  PImage restart;
  PImage quit;
  PImage returnMenu;

  Menu() {
    main = loadImage("Menu.png");
    pause = loadImage("Pause.png");
    gameend = loadImage("GameOver.png");
    restart = loadImage("Restart.png");
    quit = loadImage("Quit.png");
    returnMenu = loadImage("Returntomenu.png");
  }

  void mainMenu() {
    image(main, 0, 0);
  }

  void pauseMenu() {
    image(pause, 0, 0);
  }

  void endGameMenu() {
    image(gameend, 0, 0);
  }

  void restartMenu() {
    image(restart, 0, 0);
  }

  void quitMenu() {
    image(quit, 0, 0);
  }

  void returnToMenu() {
    image(returnMenu, 0, 0);
  }
}
