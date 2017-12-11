import processing.sound.*;
SoundFile song;
PImage Blue;
PImage Red;
PImage Green;
int poisoned = 0;
boolean isgameOver = false;
boolean isAlive = false;
PFont Poison;
PFont F;
int Survive = 0;
void setup()
{
  fullScreen();

  Poison = createFont("Exquisite Corpse.ttf", 100);
  Red = loadImage("Red.png");
  Red.resize(200, 250);
  Blue = loadImage("Blue .png");
  Blue.resize(200, 250);
  Green = loadImage("Green.png");
  Green.resize(200, 250);
  imageMode(CENTER);
  textAlign(CENTER);
  poisoned = (int)random(1, 4);
  song = new SoundFile(this, "Stranger_Things_Soundtrack_Main_Theme_10_minute_version[Mp3Converter.net].mp3");
  song.play();
}

void draw()
{
  background(0);
  textSize(200);
  fill(255);
  textFont(Poison);
  text("Pick Your Poison", width/2, height/2 - 250);
  text("Choose Wisely", width/2, height/2 + 250);
  image(Red, width/2, height/2);
  image(Blue, width/2 +300, height/2);
  image(Green, width/2 -300, height/2);
  textSize(75);
  text(Survive, 228, 100);
  text("Score:", 100, 100);
  if (isgameOver == true)
  { 
    gameOver();
  }

  if (isAlive == true)
  { 
    Congrats();
  }
}


void mousePressed()
{
  if (dist(mouseX, mouseY, width/2, height/2) < 200)
  {
    if (poisoned==2)
    {
      isgameOver = true;
    }
  }

  if (dist(mouseX, mouseY, width/2+300, height/2) < 200)
  {
    if (poisoned==3)
    {
      isgameOver = true;
    }
  }

  if (dist(mouseX, mouseY, width/2-300, height/2) < 200)
  {
    if (poisoned==1)
    {
      isgameOver = true;
    }
  }
  if (dist(mouseX, mouseY, width/2 + 300, height/2) < 200)
  {
    if (poisoned==2)
    {
      Survive ++ ;
      isAlive = true;
    }
  }
  if (dist(mouseX, mouseY, width/2 - 300, height/2) < 200)
  {
    if (poisoned==2)
    {
      Survive ++ ;
      isAlive = true;
    }
  }
  if (dist(mouseX, mouseY, width/2, height/2) < 200)
  {
    if (poisoned==3)
    {
      Survive ++ ;
      isAlive = true;
    }
  }
  if (dist(mouseX, mouseY, width/2-300, height/2) < 200)
  {
    if (poisoned==3)
    {
      Survive ++ ;
      isAlive = true;
    }
  }
  if (dist(mouseX, mouseY, width/2, height/2) < 200)
  {
    if (poisoned==1)
    {
      Survive ++ ;
      isAlive = true;
    }
  }
  if (dist(mouseX, mouseY, width/2+300, height/2) < 200)
  {
    if (poisoned==1)
    {
      Survive ++ ;
      isAlive = true;
    }
  }
}

void gameOver()
{
  background(255);
  fill(0);
  textSize(100);
  textFont(Poison);
  text("You Died", width/2, height/2);
  textSize(60);
  text(Survive, 100, 100);
}

void Congrats()
{
  poisoned = (int)random(1, 4);

  background(255);
  fill(0);
  textFont(Poison);
  textSize(200);
  text("You Survived", width/2, height/2);
  ellipse(width/2, height/2 + 300, 300, 150);
  fill(255);
  textSize(50);
  text("Continue?", width/2, height/2+300);
  if (mousePressed)
  {
    if (dist(mouseX, mouseY, width/2, height/2+300) < 150)
    {
      isgameOver = false;
      isAlive = false;
    }
  }
}