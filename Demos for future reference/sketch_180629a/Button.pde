public class Button {
  PImage button;
  
  PVector cords;
  final PVector size = new PVector( width*.66228571429, height*.11);
  
  Button(String image, PVector cor)
  {
    button = loadImage(image);
    cords = cor;
  }
  public void show(){
    image(button, cords.x, cords.y, size.x, size.y);
  }
  public void checkCollision(){
    
        if(mousePressed && mouseX >=cords.x && mouseX <= cords.x + size.x && mouseY >= cords.y && mouseY < cords.y + size.y)
      {
        
      }
      
  }
}