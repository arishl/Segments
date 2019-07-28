class Triangle implements Shape{
  Point p1;
  Point p2;
  Point p3;
  ArrayList<Line> lines = new ArrayList();
  
  public Triangle(Point p1, Point p2, Point p3){
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
    lines.add(new Line(p1,p2));
    lines.add(new Line(p2,p3));
    lines.add(new Line(p3,p1));
  }
  
  public void create(){
    stroke(0);
    strokeWeight(3);
    triangle(p1.getX(),p1.getY(),p2.getX(),p2.getY(),p3.getX(),p3.getY());
    
  }
  
  
}
