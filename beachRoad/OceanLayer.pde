class OceanLayer {
  int num;      // number of islands
  float speed;  // the speed of the layer
  float y;      // the upper bound y 
  float h;      // the height of the layer
  
  Island[] isles;
  
  OceanLayer(float y, float h, float s, int n) {
    this.speed = s;
    this.num = n;
    this.y = y;
    this.h = h;
    
    this.isles = new Island[n];
    
    for (int i = 0; i < this.num; i++) {
      this.isles[i] = new Island(random(0, width), random(this.h/this.num*i+this.y, this.h/this.num*i*2), y, h, s); 
    }
  }
  
  // display the ocean
  void display() {
    // create the ocean
    fill(8+20, 75+20, 195+20);
    rect(0, this.y, width, this.h);
    
    // display the islands
    for (int i = 0; i < this.num; i++) {
      this.isles[i].display();
    }
  }
}

class Island {
  float x;  // x position
  float y;  // y position
  float s;  // speed
  color c;  // color
  float w;  // width
  
  Island(float x, float y, float boundingY, float boundingHeight, float s) {
    this.x = x;
    this.y = y;

    // map the speed to to the distance from the horizon
    this.s = map(y, boundingY, boundingY+boundingHeight, -0.1, s);
    
    // map the size of the island to the distance from the horizon
    this.w = map(y, boundingY, boundingY+boundingHeight, 20, 150);

    // map the green saturation to the distance from the horizon
    float saturation = map(y, boundingY, boundingY+boundingHeight, 10, 100);
    this.c = color(100-saturation, 140+saturation, 90-saturation);
  }
  
  void display() {
    fill(this.c);
    arc(this.x, this.y, this.w+this.w/2, this.w-15, PI, TWO_PI);
    fill(8+20, 75+20, 195+20);
    rect(this.x-this.w/2 - 5, this.y, this.w + 10, 3);
    fill(8-20, 75-20, 195-20);
    rect(this.x-this.w/2, this.y+3, this.w, 2);
    
    // create movement
    this.x += this.s;
    if (this.x < -this.w) {
      this.x = random(width+this.w, 3*width/2 + this.w); 
    }
  }
}