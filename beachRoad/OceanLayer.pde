// =============================================================================

class OceanLayer {
  float y;        // starting y-cordinate of the layer 
  float h;        // height of the layer
  int num;        // number of islands
  float speed;    // speed of the layer
  Island[] isles; // array of Island objects
  
  // OceanLayer constructor
  OceanLayer(float y, float h, float s, int n) {
    this.y = y;                   // assigns the y-coordinate
    this.h = h;                   // assigns the height
    this.num = n;                 // assigns number of islands
    this.speed = s;               // assigns speed
    this.isles = new Island[n];   // creates an arry of Island array of size n
    
    // instantiate all the islands in the isles array
    for (int i = 0; i < this.num; i++) {
      this.isles[i] = new Island(random(0, width), random(this.h/this.num*i+this.y, this.h/this.num*i*2), y, h, s); 
    }
  }
  
  // display the entire layer: (water, islands)
  void display() {
    // create the water
    fill(8+20, 75+20, 195+20);
    rect(0, this.y, width, this.h);
    
    // display the islands
    for (int i = 0; i < this.num; i++) {
      this.isles[i].display();
    }
  }
}

// =============================================================================

class Island {
  float x;  // x-position
  float y;  // y-position
  float s;  // speed
  color c;  // color
  float w;  // width
  
  // Island constructor
  Island(float x, float y, float boundingY, float boundingHeight, float s) {
    this.x = x;   // assigns the x-position
    this.y = y;   // assigns the y-position

    // map the Island's speed to to the distance from the horizon
    this.s = map(y, boundingY, boundingY+boundingHeight, -0.1, s);
    
    // map the size of the island to the distance from the horizon
    this.w = map(y, boundingY, boundingY+boundingHeight, 20, 150);

    // map the Island's green saturation to the distance from the horizon
    float saturation = map(y, boundingY, boundingY+boundingHeight, 10, 100);
    this.c = color(100-saturation, 140+saturation, 90-saturation);
  }
  
  // display the island
  void display() {

    fill(this.c);
    arc(this.x, this.y, this.w+this.w/2, this.w-15, PI, TWO_PI);
    
    color shadedBlue = color(20, 80, 185);
    color oceanBlue = color(8+20, 75+20, 195+20);
    this.islandGradient(int(this.x-(this.w+this.w/2)/2 - 2), int(this.y), this.w+this.w/2 + 4, 20, shadedBlue, oceanBlue);

    // create and manage movement of the island
    this.x += this.s;
    if (this.x < -this.w) {
      this.x = random(width+this.w, 3*width/2 + this.w); 
    }
  }

  // create a color gradient
  void islandGradient(int x, int y, float w, float h, color c1, color c2) {
    noFill();
    // top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }  
    noStroke();
  }
}