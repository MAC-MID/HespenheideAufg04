ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(600,600);
  
  for(int i = 0; i < 100; i++){
    balls.add(new Ball(random(0,width),random(0, height),10, 3, 3));
  }

}

void draw(){
  
  fill(150,40);
  rect(0,0, width, height);
  
  for(int i = 0; i < balls.size(); i++){
    balls.get(i).update();
    balls.get(i).draw();
  }
}
