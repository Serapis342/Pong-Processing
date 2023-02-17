int playerSize = 100;
int spaceToWall = 10;
int radius = 20;
int middleLineSize;
int paddleWidth = 10;
boolean VK_UP = false;
boolean VK_DOWN = false;
boolean w = false;
boolean s = false;
Ball ball = new Ball(this, playerSize, spaceToWall, radius, paddleWidth);
Player playerOne = new Player(this, playerSize);
Player playerTwo = new Player(this, playerSize);

void setup()
{
  size(900, 900);
  surface.setResizable(true);
  surface.setTitle("Ping Pong || Made by Serapis");
}

void draw()
{
  background(0);
  middleLineSize = width/100;
  drawMiddleLine();
  noStroke();
  ball.move(playerOne.y, playerTwo.y);
  drawBall();
  drawPlayerOne();
  drawPlayerTwo();
  checkWallCollision();
  showText();
  move();
}

void keyPressed()
{
  if (keyCode == UP)
    VK_UP = true;
  if (keyCode == DOWN)
    VK_DOWN = true;
  if (key == 'w' || key == 'W')
    w = true;
  if (key == 's' || key == 'S')
    s = true;
}

void keyReleased()
{
  if (keyCode == UP)
    VK_UP = false;
  if (keyCode == DOWN)
    VK_DOWN = false;
  if (key == 'w' || key == 'W')
    w = false;
  if (key == 's' || key == 'S')
    s = false;
}

private void drawBall()
{
  fill(#B71825);
  circle(ball.getPosition('x'), ball.getPosition('y'), radius);
}

private void drawPlayerOne()
{
  fill(#0F1293);
  rect(spaceToWall, playerOne.getY(), paddleWidth, playerSize);
}

private void drawPlayerTwo()
{
  fill(#0F1293);
  rect(width - paddleWidth - spaceToWall, playerTwo.getY(), paddleWidth, playerSize);
}

private void drawMiddleLine()
{
  stroke(200);
  strokeWeight(middleLineSize);
  line(width/2, height, width/2, 0);
}

private void checkWallCollision()
{
  if (ball.getPosition('x') <= 0)
  {
    playerTwo.updateScore();
    restart();
  } else if (ball.getPosition('x') >= width)
  {
    playerOne.updateScore();
    restart();
  }
}

private void showText()
{
  fill(#FFFFFF);
  textSize(75);
  text(playerOne.getScore(), width/2 - width/5, 75);
  text(playerTwo.getScore(), width/2 + width/5, 75);
}

private void restart()
{
  ball = new Ball(this, playerSize, spaceToWall, radius, paddleWidth);
}

private void move()
{
  if (w)
    playerOne.move("up");
  if (s)
    playerOne.move("down");
  if (VK_UP)
    playerTwo.move("up");
  if (VK_DOWN)
    playerTwo.move("down");
}
