public class Obstacles{
    public float centerX;
    public float centerY;
    public float xspeed;
    public float yspeed;
    public float radius;

    public Obstacles(){
    centerX = 400;
    centerY = 200;
    xspeed = 10;
    yspeed = 10;
    radius = 40;
  }

    public void bounce(){
        if (centerX > 800 - radius || centerX < 0){
            xspeed = -xspeed;
        }
        if (centerY > 400 - radius || centerY < 0){
            yspeed = -yspeed;
        }
    }

    public void moveShape(){
        centerX = centerX + xspeed;
        centerY = centerY + yspeed;
    }

    public void draw(){
    }
}