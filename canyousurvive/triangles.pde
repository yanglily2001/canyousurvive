public class Triangles extends Obstacles{
    public float x1;
    public float x2;
    public float x3;
    public float y1;
    public float y2;
    public float y3;

    public Triangles(float x1, float y1, float x2, float y2, float x3, float y3){
      this.centerX = ((x1+x2+x3)/3);
      this.centerY = ((y1+y2+y3)/3);
      this.radius = 1;
      this.x1 = x1;
      this.x1 = x1;
      this.x2 = x2;
      this.x3 = x3;
      this.y1 = y1;
      this.y2 = y2;
      this.y3 = y3;
    }

    public void moveShape(){
      centerX = centerX + xspeed;
      xspeed = 1;
    }

    public void draw(){
      fill(120, 0, 60);
      triangle(centerX, y1, x2, y2, x3, y3);
    }

    public void stopTriangle(){
      if (centerX > 520){
        xspeed = 0;
      }
    }
}