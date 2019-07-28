class Line implements Shape{
  Point p1;
  Point p2;
  
  public Line(Point p1, Point p2){
    this.p1=p1;
    this.p2 =p2;
  }
  
  public Line(){
    p1 = new Point(10.0,10.0,10.0);
    p2 = new Point(10.0,10.0,10.0);
  }

  
  public void create(){
    float slope = (p1.getY()-p2.getY())/(p1.getX()-p2.getX());
    float a = p1.getY()-slope*p1.getX();
    float b = 600*slope+a;
    strokeWeight(1);
    stroke(100);
    line(0,a,600,b);
    strokeWeight(3);
    stroke(0);
    line(p1.getX(),p1.getY(),p2.getX(),p2.getY());
  }
  
  
  Point getP1(){
    return p1;
  }
  Point getP2(){
    return p2;
  }
 
}
