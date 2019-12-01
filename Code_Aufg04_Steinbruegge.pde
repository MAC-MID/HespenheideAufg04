ArrayList<Ball> balls = new ArrayList<Ball>();
Ball Mouse = new Ball (0,0, 120, 0,0);

void setup(){
  size(600,600);

}

void draw(){
  
  fill(150,40);
  rect(0,0, width, height);
  
  //Mouse.Position.x = mouseX;
 // Mouse.Position.y = mouseY;
 //Mouse.MouseCollision(balls);
  
  //Mouse.draw();
  
  for(int i = 0; i < balls.size(); i++){
    balls.get(i).update();
    balls.get(i).Abprallen(balls);
    balls.get(i).draw();
  }
}

void mouseClicked(){
  
  int length = (int) random (5,20);
 
  for(int i = 0; i < length; i++){
    balls.add(new Ball(random(mouseX-50,mouseX+50),random(mouseY-50, mouseY+50),20, random(-3, 3), random(-3,3)));
  }
  
}
