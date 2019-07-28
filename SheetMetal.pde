class SheetMetal implements Shape{
  
  ArrayList<Line> outline = new ArrayList();
  
  public SheetMetal(){
  }
  
  void create(){
    outline.add(new Line(new Point(20.0,20.0,20.0),new Point(20.0,780.0,20.0)));
    outline.add(new Line(new Point(20.0,20.0,20.0),new Point(580.0,20.0,20.0)));
    outline.add(new Line(new Point(580.0,20.0,20.0),new Point(580.0,780.0,20.0)));
    outline.add(new Line(new Point(20.0,780.0,20.0),new Point(580.0,780.0,20.0)));
    for(Line l : outline){
      l.create();
    }
  }
  
  
  
  
  
  
}
