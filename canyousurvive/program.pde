int centerX, centerY, xspeed, yspeed, radius, milliseconds, borderStroke;
Squares somesquare = new Squares(50, 400, 0);
Triangles sometriangle = new Triangles(100, 210, 270, 210, 400, 220);
Circles somecircle = new Circles(300, 200, 30);
Squares somesquare2 = new Squares (50, 200, 50);
Squares somesquare3 = new Squares (50, 600, 80);
ArrayList<Obstacles> obstacles = new ArrayList<Obstacles>();
book = loadImage("book.jpg");
teacher = loadImage("teacher.jpeg");
sat = loadImage("sat.jpg");

void setup(){
    obstacles.add(somesquare);
    obstacles.add(somesquare2);
    obstacles.add(somesquare3);
    obstacles.add(sometriangle);
    obstacles.add(somecircle);
    for(int i = 0; i < 4; i++){
         obstacles.add(new Circles(float(int(random(0,width))), float(int(random(0,height))), float(int(random(5,30))), float(int(random(1,10))), float(int(random(1,10)))));
    }
    size(800,400);
    centerX = width/2;
    centerY = height/2;
    xspeed = 10;
    yspeed = 10;
    radius = 40;
    milliseconds = millis();
}

void draw(){
    background(0);
    int twoBS = borderStroke*2;
    rect(borderStroke, borderStroke, width-twoBS, height-twoBS);
    sometriangle.draw();
    sometriangle.moveShape();
    sometriangle.stopTriangle();
    somesquare.draw();
    somesquare.moveShape();
    somesquare2.draw();
    somesquare2.moveShape();
    somesquare3.draw();
    somesquare3.moveShape();
    somecircle.draw();
    somecircle.moveShape();
    for (int i = 4; i < 9; i++){
        obstacles.get(i).draw();
        obstacles.get(i).moveShape();
	obstacles.get(i).discoMode();
	obstacles.get(i).schoolMode();
    }
    drawBall();
    moveBall();
    bounceBall();
    killUser();

    textSize(32);
    textAlign(CENTER);
    text("Can you survive high school?", 400, 200);
	textSize(14);
	text("Press enter to go into disco mode.", 400, 300);
	text("Press A to turn everything purple.", 400, 320);

    fill(0, 100, 100);
    ellipse(mouseX, mouseY, 10, 10);
}

void drawBall(){
    fill(255, 0, 0);
    ellipse(centerX, centerY, 2*radius, 2*radius);
    image(sat, centerX - 0.75*radius, centerY - 0.75*radius, 1.5*radius, 1.5*radius);
  }

void moveBall(){
    centerX = centerX + xspeed;
    centerY = centerY + yspeed;
  }

void bounceBall(){
     if (centerX > width - radius || centerX < 0){
        xspeed = -xspeed;
     }
     if (centerY > height - radius || centerY < 0){
        yspeed = -yspeed;
     }
}

boolean checkCollision(){
  if(dist(centerX, centerY, mouseX, mouseY) < 2*radius - 30 ||
     dist(somesquare.centerX+somesquare.sidelength/2, somesquare.centerY+somesquare.sidelength/2, mouseX, mouseY) < (2*somesquare.radius*sqrt(2))/2 ||
     dist(somesquare2.centerX+somesquare2.sidelength/2, somesquare2.centerY+somesquare2.sidelength/2, mouseX, mouseY) < (2*somesquare2.radius*sqrt(2))/2 ||
     dist(somesquare3.centerX+somesquare3.sidelength/2, somesquare3.centerY+somesquare3.sidelength/2, mouseX, mouseY) < (2*somesquare3.radius*sqrt(2))/2 ||
     dist(somecircle.centerX, somecircle.centerY, mouseX, mouseY) < 2*somecircle.radius - 20 ||
     checkBallCollision() == true
   ){
     return true;
   } else {
     return false;
   }
}

boolean checkBallCollision(){
  boolean hit = false;
  for(int i = 4; i < 9; i++){
        if(dist(obstacles.get(i).centerX, obstacles.get(i).centerY, mouseX, mouseY) < 2*obstacles.get(i).radius - 0.66*obstacles.get(i).radius)
   {
     hit = true;
   }
  }
  return hit;
}


void killUser(){
     if(checkCollision() == true){
     xspeed = 0;
     yspeed = 0;
     somesquare.yspeed = 0;
     somesquare2.yspeed = 0;
     somesquare3.yspeed = 0;
     somecircle.xspeed = 0;
     somecircle.yspeed = 0;
     sometriangle.xspeed = 0;
     for(int i = 5; i < 9; i++){
        obstacles.get(i).xspeed = 0;
        obstacles.get(i).yspeed = 0;
     }
     textSize(32);
     textAlign(CENTER, TOP);
     text("YOU FAILED AND DROPPED OUT!", 400, 200);
   }
}
