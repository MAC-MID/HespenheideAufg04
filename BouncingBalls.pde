class Ball{
  
  PVector Position = new PVector();
  PVector Bewegung = new PVector();
  
  int r;
  float MaxSpeed = 2.5;
  float MinSpeed = 1;
  
  Ball LastCollision;
  
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
      
    Bewegung.limit(MaxSpeed);
    
    if(Bewegung.mag() < MinSpeed){
      Bewegung.setMag(MinSpeed);
    }
      
    Position.x = Position.x+Bewegung.x;
    Position.y = Position.y+Bewegung.y;
    
  }
  
  
  public void Abprallen(ArrayList<Ball> balls){
    
    for(int i = 0; i < balls.size(); i++){
      if (dist(Position.x, Position.y, balls.get(i).Position.x, balls.get(i).Position.y) <= (r+balls.get(i).r)/2 && dist(Position.x, Position.y, balls.get(i).Position.x, balls.get(i).Position.y) > 0){
        if(this.LastCollision != balls.get(i)){
          this.LastCollision =  balls.get(i);
          Bewegung.y = Bewegung.y*(-1)+random(-1, 1);
          Bewegung.x = Bewegung.x*(-1)+random(-1, 1);
        
        }
        else{
          println("Penis");
        }
      }
    }
    
  }
  
  public void MouseCollision(ArrayList<Ball> balls){
    
    for(int i = 0; i < balls.size(); i++){
      if (dist(Position.x, Position.y, balls.get(i).Position.x, balls.get(i).Position.y) < (r+balls.get(i).r)/2 && dist(Position.x, Position.y, balls.get(i).Position.x, balls.get(i).Position.y) > 0){
         
         if(balls.get(i).LastCollision != this){
            balls.get(i).LastCollision =  this;
            balls.get(i).Bewegung.y =  balls.get(i).Bewegung.y*(-1)+random(-1, 1);
            balls.get(i).Bewegung.x =  balls.get(i).Bewegung.x*(-1)+random(-1, 1);
        
        }
        else{
          println("Penis");
        }
      }
    } 
  }
}
