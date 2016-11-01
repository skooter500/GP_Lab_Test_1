void setup()
{
  size(500, 500);
  px = width / 2;
  py = height - 60;
  resetPresent();
}

float px, py;
float pr = 20; // Player radius
float speed = 2;
int numPresents = 5;
float presentX;
float presentY;
float presentWidth = 40;
color presentColor;
float presentSpeed;
int score = 0;
int missed = 0;

void resetPresent()
{
  presentX = random(presentWidth, width - presentWidth);
  presentY = -20;
  presentColor = color(random(100, 255), random(100, 255), random(100, 255));
  presentSpeed = random(1, 5);
}

void drawPresent()
{
  noStroke();
  fill(presentColor);
  rect(presentX - presentWidth / 2, presentY - presentWidth / 2, presentWidth, presentWidth);  
  stroke(0);
  line(presentX, presentY - presentWidth / 2, presentX, presentY + presentWidth / 2);
  line(presentX - presentWidth / 2, presentY, presentX + presentWidth / 2, presentY);
}

void drawPlayer()
{
  ellipse(px, py, 20, 20);
  line(px, py + 10, px, py + 30);
  line(px, py + 30, px - 20, py + 50);
  line(px, py + 30, px + 20, py + 50);
  line(px - 20, py + 20, px + 20, py + 20);
}

void draw()
{
  stroke(255, 0, 0);
  background(0);
  noFill();
  drawPlayer();
  drawPresent();
  fill(255);
  text("Collected: " + score, 20, 20);
  text("Missed: " + missed, 20, 40);
  if (keyPressed)
  {
    if (keyCode == LEFT)
    {
      px -= speed;
    }
    if (keyCode == RIGHT)
    {
      px += speed;
    }
  }
  if (px - pr < 0)
  {
    px = pr;
  }
  
  if (px + pr > width)
  {
    px = width - pr;
  }
  presentY += presentSpeed;
  float halfWidth = presentWidth / 2;
  if (px > presentX - halfWidth && px < presentX + halfWidth && presentY + halfWidth > py)
  {
    score ++;
    resetPresent();
  }
  
  if (presentY - halfWidth > height)
  {
    missed ++;
    resetPresent();
  }
  
}