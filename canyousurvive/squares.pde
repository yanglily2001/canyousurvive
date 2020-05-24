public class Squares extends Obstacles{
    public float width;
    public float height;
    public float sidelength;

    public Squares(float sidelength, float centerX, float centerY){
        width = sidelength;
        height = sidelength;
        this.sidelength = sidelength;
        super.radius = sidelength/2;
        this.centerX = centerX;
        this.centerY = centerY;
        super.yspeed = 5;
    }

     public void moveShape(){
        centerY = centerY + yspeed;
        bounce();
    }

    public void draw(){
        fill(255, 0, 0);
        image(book, centerX, centerY, sidelength, sidelength);
    }
}