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
    color deepWater = color(8+20, 75+20, 195+20);
    color shallowWater = color(128, 195, 255);
    fill(deepWater);
    rect(0, this.y, width, this.h/2);
    colorGradient(0, int(this.y+this.h/2), width, this.h, deepWater, shallowWater);
    
    // display the islands
    for (int i = 0; i < this.num; i++) {
      this.isles[i].display();
    }
  }

  // create a color gradient
  void colorGradient(int x, int y, float w, float h, color c1, color c2) {
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

// =============================================================================

class Island {
  float x;  // x-position
  float y;  // y-position
  float s;  // speed
  color c;  // color
  color o1;  // ocean island shadow from color
  color o2;  // ocean shadow shadow o color
  float w;  // width
  float h;  // height
  
  // Island constructor
  Island(float x, float y, float boundingY, float boundingHeight, float s) {
    // map the Island's speed to to the distance from the horizon
    this.s = map(y, boundingY, boundingY+boundingHeight, -0.1, s);
    
    // map the size of the island to the distance from the horizon
    this.w = map(y, boundingY, boundingY+boundingHeight, 20, 150)+random(50);

    this.x = x;   // assigns the x-position
    this.y = y;   // assigns the y-position
    this.h = this.w*3/4-random(30);   // assigns a height

    // lerp the Island's green to the distance from the horizon
    color from = color(64, 115, 158);
    color to = color(90+5, 139+40, 63+5);
    float amt = map(y, boundingY, boundingY+boundingHeight, 0, 1);
    this.c = lerpColor(from, to, amt);

    color deepWater = color(8+20, 75+20, 195+20);
    color shallowWater = color(128, 195, 255);
    float amt2 = map(y-200, boundingY, boundingY+boundingHeight, 0, 1);
    float amt3 = map(y-70, boundingY, boundingY+boundingHeight, 0, 1);
    this.o1 = lerpColor(deepWater, shallowWater, amt2);
    this.o2 = lerpColor(deepWater, shallowWater, amt3);
  }
  
  // display the island
  void display() {
    // display the green island top
    fill(this.c);
    arc(this.x, this.y, this.w+this.w/2, this.h, PI, TWO_PI);
    
    // ocean shadow gradient under the island
    color shadedBlue = color(20, 80, 185);
    color oceanBlue = color(8+20, 75+20, 195+20);
    this.colorGradient(int(this.x-(this.w+this.w/2)/2 - 2), int(this.y), this.w+this.w/2 + 4, 40, this.o1, this.o2);

    // create and manage movement of the island
    this.x += this.s;
    if (this.x < -this.w) {
      this.x = random(width+this.w, 3*width/2 + this.w); 
    }
  }

  // create a color gradient
  void colorGradient(int x, int y, float w, float h, color c1, color c2) {
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