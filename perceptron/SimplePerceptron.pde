Perceptron brain;
Point[] points = new Point[300];

public void settings(){
   size(800,800);
}

void setup(){
  brain = new Perceptron(3);  
  
  for(int i = 0; i<points.length; i++)
  {
    points[i] = new Point();
  } 
  
}

void draw(){
  background(255);
  stroke(0);
  //y = x line
  Point p1 = new Point(-1,f(-1));
  Point p2 = new Point(1, f(1));
  //map the values to the width and height of screen
  float x1 = p1.pixelX();
  float y1 = p1.pixelY();
  float x2 = p2.pixelX();
  float y2 = p2.pixelY();  
  line(x1, y1, x2, y2);
  
  Point p3 = new Point(-1, brain.guessY(-1));
  Point p4 = new Point(1, brain.guessY(1));
  line(p3.pixelX(), p3.pixelY(), p4.pixelX(),p4.pixelY());
  
  for(Point p : points)
  {
    p.show();
  }
  
  for(Point pt: points)
  {
    float [] inputs = {pt.x,pt.y, pt.bias};
    int target = pt.label;
    int guess = brain.guess(inputs);    
    brain.train(inputs,target);
    if(guess == target)
    {
      fill(0,255,0);      
    }
    else
    {
      fill(255,0,0);
    }
    ellipse(pt.pixelX(),pt.pixelY(),10,10);
  }
}

void mousePressed(){
  for(Point pt: points)
  {
    float [] inputs = {pt.x,pt.y, pt.bias};
    int target = pt.label;
    brain.train(inputs,target);
  }
}
