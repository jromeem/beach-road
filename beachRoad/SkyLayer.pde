// =============================================================================

class SkyLayer {
  float y;        // starting y-coordinate of the layer
  float h;        // height of the layer
  int num;        // number of clouds
  float speed;    // speed of this layer
  Cloud[] clouds; // array of Cloud objects

  // SkyLayer constructor
  SkyLayer(float y, float h, float s, int n) {
    this.y = y;                   // assigns y-coordinate
    this.h = h;                   // assigns height
    this.num = n;                 // assigns number of clouds
    this.speed = s;               // assigns speed
    this.clouds = new Cloud[n];   // creates a Cloud array of size n

    // instantiate all the clouds in the clouds array
    for (int i = 0; i < this.num; i++) {
      this.clouds[i] = new Cloud(random(0, width), this.y+this.h, this.speed);
    }
  }

  // display the entire layer: (sky, clouds)
  void display() {
    // display the sky
    this.displaySky();

    // display the clouds
    for (int i = 0; i < this.num; i++) {
      this.clouds[i].display();
    }
  }

  // create a sky with a gradient
  void displaySky() {
    // create the sky
    color lightBlue = color(151+20, 219+20, 254+20);
    color deepBlue = color(46+10, 154+20, 254+20);

    fill(lightBlue);
    rect(0, this.y, width, this.h);
    fill(deepBlue);
    rect(0, this.y, width, this.y+this.h/3);
    this.colorGradient(0, int(this.y+this.h/3), width, this.h/2, deepBlue, lightBlue);
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

class Cloud {
  float x;  // x-position of this cloud
  float y;  // y-position of this cloud
  float s;  // speed of the cloud
  float w;  // size of the cloud, i.e. width

  // Cloud constructor
  Cloud(float x, float y, float s) {
    this.x = x;                 // assigns x-position
    this.y = y;                 // assigns y-position
    this.s = s;                 // assigns speed
    this.w = random(10, 300);   // assigns size
  }

  // draw the cloud
  void display() {
    fill(255);
    ellipse(this.x, this.y, this.w, this.w);
    ellipse(this.x+40, this.y+20, this.w, this.w);
    ellipse(this.x-60, this.y-10, this.w, this.w+(this.w/2));

    // create and manage movement of the cloud
    this.x += this.s;
    if (this.x > width+this.w) {
      this.x = random(0-this.w, -width);
    } 
  }
}