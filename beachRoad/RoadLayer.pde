class RoadLayer {
  int num;
  float speed;
  float y;
  float h;

  Rail[] rails;
  Divider[] dividers;

  RoadLayer(float y, float h, float s, int n) {
    this.y = y;
    this.h = h;
    this.speed = s;
    this.num = n;

    this.rails = new Rail[n];
    this.dividers = new Divider[n];

    for (int i = 0; i < this.num; i++) {
      this.rails[i] = new Rail(width/this.num*i, this.y, this.speed);
      this.dividers[i] = new Divider(width/this.num*i+50, this.y+this.h*2/3, this.speed);
    }
  }

  // display the road
  void display() {
    // create the pavement
    fill(210, 210, 200);
    rect(0, this.y, width, this.h);

    // display the rails and the dividers
    for(int i = 0; i < this.num; i++) {
      this.rails[i].display();
      this.dividers[i].display();
    }
  }
}

class Rail {
  float x;  // x position
  float y;  // y position
  float s;  // speed
  float railWidth = 30;
  float railHeight = 40;

  Rail(float x, float y, float s) {
    this.x = x;
    this.y = y;
    this.s = s;
  }

  void display() {
    fill(100, 100, 130);
    rect(0, this.y-this.railHeight, width, 8);
    rect(this.x, this.y-this.railHeight+3, this.railWidth, this.railHeight);

    this.x += this.s;
    if(this.x < 0-this.railWidth) {
      this.x = width-this.railWidth;
    }
  }
}

class Divider {
  float x;
  float y;
  float s;
  float dividerWidth = 60;
  float dividerHeight = 2;
  
  Divider(float x, float y, float s) {
    this.x = x;
    this.y = y;
    this.s = s;
  }

  void display() {
    fill(250, 250, 0);
    rect(this.x, this.y, this.dividerWidth, this.dividerHeight);
    
    this.x += this.s;
    if(this.x < 0-this.dividerWidth) {
      this.x = width-this.dividerWidth;
    }
  }
}