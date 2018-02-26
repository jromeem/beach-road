class SkyLayer {
  int num;
  float speed;
  float y;
  float h;

  Cloud[] clouds;

  SkyLayer(float y, float h, float s, int n) {
    this.speed = s;
    this.num = n;
    this.y = y;
    this.h = h;

    this.clouds = new Cloud[n];

    for (int i = 0; i < this.num; i++) {
      this.clouds[i] = new Cloud(random(0, width), this.y+this.h, this.speed);
    }
  }

  // display the sky
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

class Cloud {
  float x;
  float y;
  float s;
  float w;

  Cloud(float x, float y, float s) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.w = random(10, 300);
  }

  void display() {
    fill(255);
    ellipse(this.x, this.y, this.w, this.w);
    ellipse(this.x+40, this.y+20, this.w, this.w);
    ellipse(this.x-60, this.y-10, this.w, this.w+(this.w/2));

    this.x += this.s;
    if (this.x > width+this.w) {
      this.x = random(0-this.w, -width);
    } 
  }
}