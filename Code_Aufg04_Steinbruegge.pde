// Aufgabe 04, Marie Steinbrügge

ArrayList<Ball> balls = new ArrayList<Ball>();
//Ball Mouse = new Ball (0,0, 120, 0,0);

boolean go = false;

void setup(){
  size(600,600);
 // background(BLACK);

}

void draw(){ 
  
  fill(0,30);
  rect(0,0, width, height);
  
  //Mouse.Position.x = mouseX;
  //Mouse.Position.y = mouseY;
  
  
  //Mouse.draw();
  
  for(int i = 0; i < balls.size(); i++){
    balls.get(i).update();
    balls.get(i).Abprallen(balls);
    balls.get(i).draw();
  }
  
  //Mouse.MouseCollision(balls);
}

void mouseClicked(){
  
  int length = (int) random (5,20);
 
  for(int i = 0; i < length; i++){
    balls.add(new Ball(random(mouseX-100,mouseX+100),random(mouseY-100, mouseY+100),20, random(-3, 3), random(-3,3), 255));
  }
  
}
