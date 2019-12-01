class Ball{
  
  PVector Position = new PVector();
  PVector Bewegung = new PVector();
  
  int r;
  
  Ball (float x, float y, int r, float bx, float by) {
    Position.x = x;
    Position.y = y;
    this.r = r;
    
    Bewegung.x = bx;
    Bewegung.y = by;
  }
  
  public void draw(){
    fill(255);
    noStroke();
    circle(Position.x, Position.y, r);
  }
  
  public void update(){
    
    if (Position.x > width){
      Position.x = width;
      Bewegung.x = Bewegung.x*(-1)+random(-1, 1);
    }
   
    if (Position.y > height){
       Position.y = height;
       Bewegung.y = Bewegung.y*(-1)+random(-1, 1);
    }
     
    if (Position.y < 0){
      Position.y = 0;
      Bewegung.y = Bewegung.y*(-1)+random(-1, 1);
    }
    
    if (Position.x < 0){
      Position.x = 0;
      Bewegung.x = Bewegung.x*(-1)+random(-1, 1);
    }
      
    Position.x = Position.x+Bewegung.x;
    Position.y = Position.y+Bewegung.y;
  }
}
