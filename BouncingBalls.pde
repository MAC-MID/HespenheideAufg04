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
        this.Farbe = color(239,121,138);
        break;
      case 1:
        this.Farbe = color(247,169,168);
        break;
      case 2:
        this.Farbe = color(125,130,184);
        break;
      case 3:
        this.Farbe = color(229,195,209);
        break;
    }
    
    /* DEBUG 
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
      
      if (dist(Position.x, Position.y, balls.get(i).Position.x, balls.get(i).Position.y) <= (r+balls.get(i).r)/2 && dist(Position.x, Position.y, balls.get(i).Position.x, balls.get(i).Position.y) > 0){
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
