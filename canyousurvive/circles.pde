public class Circles extends Obstacles{
	public int r;
	public int g;
	public int b;

    public Circles(float somex, float somey, float someradius){
       this.centerX = somex;
       this.centerY = somey;
       this.radius = someradius;
       super.xspeed = 8;
       super.yspeed = 8;
    }

    public Circles(float somex, float somey, float someradius, float somexspeed, float someyspeed){
       this.centerX = somex;
       this.centerY = somey;
       this.radius = someradius;
       super.xspeed = somexspeed;
       super.yspeed = someyspeed;
    }

    public void moveShape(){
        centerX = centerX + xspeed;
        centerY = centerY + yspeed;
        bounce();
    }

    public void draw(){
        fill(r, g, b);
        ellipse(centerX, centerY, 2*radius, 2*radius);
				image(teacher, centerX - 0.75*radius, centerY - 0.75*radius, 1.5*radius, 1.5*radius);
    }

	public void discoMode(){
		if(keyCode == ENTER){
			r = int(random(0,255));
			g = int(random(0,255));
			b = int(random(0,255));
		 }
	}

	public void schoolMode(){
		if(key == 'a'){
			r = 137;
			g = 56;
			b = 183;
		 }
	}
}