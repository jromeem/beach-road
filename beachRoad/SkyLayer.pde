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
    // create the sky
    fill(56+20, 174+30, 254+20);
    rect(0, this.y, width, this.h);

    // display the clouds
    for (int i = 0; i < this.num; i++) {
      this.clouds[i].display();
    }
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