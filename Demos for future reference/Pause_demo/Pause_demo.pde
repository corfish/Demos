Pause pause;
void setup()
{

 //fullScreen();

 // orientation(PORTRAIT);
  size(500, 700);
  pause = new Pause();

}
void draw()
{
  background(0);
    pause.show();
    pause.checkCollision();
}

public class Pause {

  int size;
  PVector cords;
  //index 0 is resume, 1 is menu, 2 is restart
  Button[] allButtons;
 
  boolean pause;
  PImage pauseButton;
  //PImage resume;
  //PImage menu;
  //PImage restart;
  PImage background;
  
  
  public Pause(){
    
    size = width/7;
    cords = new PVector(width/7*6,height/100);

    allButtons = new Button[3];
    allButtons[0] = new Button("resume.png", new PVector(width*.1628571429, height*.315));
    allButtons[1] = new Button("menu button.png", new PVector( width*.1628571429, height*.49));
    allButtons[2] = new Button("restart.png", new PVector(width*.1628571429, height*.665));
    
    pauseButton = loadImage("pause.png");
    
    //resume = loadImage("resume.png");
    //menu = loadImage("menu button.png");
    //restart = loadImage("restart.png");
    background = loadImage("menu without music.png");
    
    
    
  }
  public void checkCollision()
  {
      if(mousePressed && mouseX >=cords.x && mouseX <= cords.x + size && mouseY >= cords.y && mouseY < cords.y + size)
      {
        pause  = true;
      }
  }
  public void update(){
    
  
 
    
    
  }
  public void show()
  {
       if(pause)
    {
      image(background, width*.1428571429, height*.17, width*.7142857143, height*.68);
      for(int i = 0; i < allButtons.length; i ++){
        allButtons[i].show();
         if(allButtons[i].checkCollision())
         {
           link("https://www.youtube.com/watch?v=nKXPYoMyEZc&t=6s");
         }
         
      }
      //image(resume, width*.1628571429, height*.315, width*.66228571429, height*.11);
      //image(restart, width*.1628571429, height*.49, width*.66228571429, height*.11);
      //image(menu, width*.1628571429, height*.665, width*.66228571429, height*.11);
      
    }
    else
    {
    image(pauseButton, cords.x, cords.y,size,size);
    }
  }
}