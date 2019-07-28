final public int width = 1000;
final public int height = 800;

ArrayList<Point> vertexesForShapes = new ArrayList();
ArrayList<Shape> shapes = new ArrayList();
ArrayList<Point> vertexes = new ArrayList();

SheetMetal metal = new SheetMetal();

void setup(){ 
  size(1000,800);
  background(255);
}

void draw(){
  background (255);
  stroke(0);
  strokeWeight(0);
  line(625,0,625,800);
  metal.create();
  for(int i = 0; i < shapes.size(); i++){
    Shape s = shapes.get(i);
    s.create();
    if(s instanceof Line){
      if(i==0){
        Line l = (Line) s;
        Line r = ((Line)shapes.get(shapes.size()-1));
        Point p = lineIntersect(l.getP1(),l.getP2(),r.getP1(), r.getP2());
        vertexes.add(p);
      }else{
        Line l = (Line) s;
        for(int z = i-1; z >=0; z--){
          Point p = lineIntersect(l.getP1(),l.getP2(),((Line)(shapes.get(z))).getP1(), ((Line)(shapes.get(z))).getP2());
          vertexes.add(p);
        }
      }
    }
  }  
  
  for(Point p : vertexes){
    strokeWeight(10);
    stroke(255,0,0);
    point(p.getX(),p.getY());
  }
}

void mouseClicked(){
  if(mouseX<=600){
    vertexesForShapes.add(new Point((float)mouseX,(float)mouseY,20.0));
  }
}

void keyPressed(){
  if(key == ' '){
    if(vertexesForShapes.size()>1){
      for(int i = 1; i < vertexesForShapes.size(); i++){
        shapes.add(new Line(vertexesForShapes.get(i-1), vertexesForShapes.get(i)));  
      }
    }
    if(vertexesForShapes.size()>2){
        shapes.add(new Line(vertexesForShapes.get(0), vertexesForShapes.get(vertexesForShapes.size()-1)));
    }
    vertexesForShapes = new ArrayList();
  }
  if(key == 'r'){
    shapes = new ArrayList();
  }
  if(key == 'x'){
    vertexes = new ArrayList();
  }
}

Point lineIntersect(Point p0, Point p1, Point p2, Point p3) {
  
    float A1 = p1.getY() - p0.getY();
    float B1 = p0.getX() - p1.getX();
    float C1 = A1 * p0.getX() + B1 * p0.getY();
    float A2 = p3.getY() - p2.getY();
    float B2 = p2.getX() - p3.getX();
    float C2 = A2 * p2.getX() + B2 * p2.getY();
    float denominator = A1 * B2 - A2 * B1;

    return new Point( (B2 * C1 - B1 * C2) / denominator, (A1 * C2 - A2 * C1) / denominator, 20.0);
  }
