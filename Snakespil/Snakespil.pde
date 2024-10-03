ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w=25, h=25, blocks = 20, direction =2, foodx=15, foody= 15;
int[]x_directions={0, 0, 1, -1}, y_directions={1, -1, 0, 0};
boolean gameover = false;
void setup() {
  size(600, 600);
  x.add(0);
  y.add(15);
}

void draw() {
  background(0);
  fill(57, 169, 50);
  for (int i =0; i<x.size(); i++) rect(x.get(i)*blocks, y.get(i)*blocks, blocks, blocks);
  if (!gameover) {
    fill(255); //slangemad farve
    rect(foodx*blocks, foody*blocks, blocks, blocks); //slangemad
//indsætter tekst  - W3Schools
textAlign(LEFT); 
textSize(25);
fill(255);
text("Score: " + x.size(),10,10, width -20,50); //scpre tæller pr spist food
    if (frameCount%7==0) {
      x.add(0, x.get(0) + x_directions[direction]);
      y.add(0, y.get(0) + y_directions[direction]);
      
      if (x.get(0)==foodx && y.get(0)== foody) {
        foodx = (int)random(0, w);
        foody = (int)random(0, h);
      } else {
        x.remove(x.size()-1);
        y.remove(y.size()-1);
      }
    }
  }
}

void keyPressed() { //bevægelse på tastaturen
  int newdir = keyCode == DOWN? 0:(keyCode == UP?1:(keyCode==RIGHT?2:(keyCode==LEFT?3:-1)));
  if (newdir != -1) direction = newdir;
}
