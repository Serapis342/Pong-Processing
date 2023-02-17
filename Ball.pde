class Ball
{
  private int directionX;
  private int directionY;
  private int x;
  private int y;
  private int playerSize;
  private int space;
  private int radius;
  private int paddleWidth;
  private PApplet p;

  Ball(PApplet MainClass, int size, int spaceToWall, int radiusOfCircle, int widthOfPaddle)
  {
    p = MainClass;
    playerSize = size;
    space = spaceToWall;
    radius = radiusOfCircle;
    widthOfPaddle = paddleWidth;
    directionX = (int) p.random(10) + 2;
    directionY = (int) p.random(10) + 2;

    if((int) p.random(1) + 2 == 2)
      directionX *= -1;
    if((int) p.random(1) + 2 == 2)
      directionY *= -1;
      
    x = p.width / 2;
    y = p.height / 2;
  }

  protected int getPosition(char position)
  {
    if (position == 'x')
      return this.x;
    else
      return this.y;
  }

  protected int getDirection(char direction)
  {
    if (direction == 'x')
      return this.directionX;
    else
      return this.directionY;
  }

  private void reflectBall(char direction)
  {
    if (direction == 'x')
      directionX *= -1;
    else
      directionY *= -1;
  }

  protected void move(int playerOne, int playerTwo)
  {
    x += directionX;
    y += directionY;

    checkWallCollision();
    checkPlayerCollision(playerOne, playerTwo);
  }

  private void checkWallCollision()
  {
    if (x > p.width || x < 0)
      reflectBall('x');
    else if (y > p.height || y < 0)
      reflectBall('y');
  }

  private void checkPlayerCollision(int playerOne, int playerTwo)
  {
    if (x < space + radius + 3)
    {
      if (y > playerOne && y < playerOne + playerSize)
      {
        reflectBall('x');
      }
    } else if (x > p.width - paddleWidth - spaceToWall - 25)
    {
      if (y > playerTwo && y < playerTwo + playerSize)
      {
        reflectBall('x');
      }
    }
  }
}
