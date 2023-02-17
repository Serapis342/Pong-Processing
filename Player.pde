class Player
{
  private PApplet p;
  private int size;
  private int y;
  private int score;
  
  Player(PApplet MainClass, int playerSize)
  {
    p = MainClass;
    size = playerSize;
    score = 0;
    y = width/2;
  }

  protected void move(String direction)
  {
    if (direction == "up" && y > 0)
      y -= height/70;
    else if (direction == "down" && y < p.height - size)
      y += height/70;
  }

  protected float getY()
  {
    return this.y;
  }
  
  protected void updateScore()
  {
    score++;
  }
  
  protected int getScore()
  {
    return this.score;
  }
}
