  class Ball{
  
  PVector Position = new PVector();
  PVector Bewegung = new PVector();
  
  int r;
  float MaxSpeed = 2.5;
  float MinSpeed = 1;
  
  color Farbe;
  
  int counterCollision = 0;

  Ball LastCollision;
  
  Ball (float x, float y, int r, float bx, float by, color Colour) {
    Position.x = x;
    Position.y = y;
    this.r = r;
    this.Farbe = Colour;
    
    Bewegung.x = bx;
    Bewegung.y = by;
    }
  
  public void draw(){
    fill(this.Farbe);

    noStroke();
    circle(Position.x, Position.y, r);
    
    switch(floor((this.counterCollision)/25)){
      case 0: 
        color from = color(239,121,138);
        color to = color(216,17,89);
        color interA = lerpColor(from, to, (float)(this.counterCollision)/25);
        this.Farbe = interA;
        break;
      case 1:
        color from1 = color(216,17,89);
        color to1 = color(125,130,184);
        color interB = lerpColor(from1, to1, ((float)(this.counterCollision)/25)-1);
        this.Farbe = interB;
        break;
      case 2:
        color from2 = color(125,130,184);
        color to2 = color(229,195,209);
        color interC = lerpColor(from2, to2, ((float)(this.counterCollision)/25)-2);
        this.Farbe = interC;
        break;
      case 3:
        color from3 = color(229,195,209);
        color to3 = color(255);
        color interD = lerpColor(from3, to3, ((float)(this.counterCollision)/25)-3);
        this.Farbe = interD;
        break;
    }
    
    //DEBUG
    /*
    textSize(20);
    fill(255);
    text(this.counterCollision, this.Position.x, this.Position.y);
    */
    
  }
  
  public void update(){
    
    if (Position.x > width){
      Position.x = width;
      Bewegung.x = Bewegung.x*(-1)+random(-1, 1);
      this.counterCollision += 1;
    }
   
    if (Position.y > height){
       Position.y = height;
       Bewegung.y = Bewegung.y*(-1)+random(-1, 1);
       this.counterCollision += 1;
    }
     
    if (Position.y < 0){
      Position.y = 0;
      Bewegung.y = Bewegung.y*(-1)+random(-1, 1);
      this.counterCollision += 1;
    }
    
    if (Position.x < 0){
      Position.x = 0;
      Bewegung.x = Bewegung.x*(-1)+random(-1, 1);
      this.counterCollision += 1;
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
      
      if (Abstand(Position, balls.get(i).Position) <= (r+balls.get(i).r)/2 && Abstand(Position, balls.get(i).Position) > 0){  
        if(this.LastCollision != balls.get(i)){
          
          this.LastCollision =  balls.get(i);
          this.Bewegung.y = this.Bewegung.y*(-1)+random(-1, 1);
          this.Bewegung.x = this.Bewegung.x*(-1)+random(-1, 1);
          
          //this.Farbe = color(random(10,200),random(10,200),random(10,200));
          
          this.counterCollision += 1;
        
        }
        else{
        }
      }
    }
    
  }
  
  float Abstand(PVector Objekt1, PVector Objekt2){
    
    return dist(Objekt1.x, Objekt1.y, Objekt2.x, Objekt2.y);  
  }
  
  
  /*public void MouseCollision(ArrayList<Ball> balls){
    
    for(int i = 0; i < balls.size(); i++){
      
      PVector distanceVect = PVector.sub(Position, balls.get(i).Position);
      float distanceVectMag = distanceVect.mag();
      float minDistance = (r + balls.get(i).r)/2;
      
      if (distanceVectMag < minDistance){
        
         if(balls.get(i).LastCollision != this){
            balls.get(i).LastCollision =  this;
            balls.get(i).Bewegung.y =  balls.get(i).Bewegung.y*(-1)+random(-5, 5);
            balls.get(i).Bewegung.x =  balls.get(i).Bewegung.x*(-1)+random(-5, 5);
        
         }
      }
    } 
  }*/
}
