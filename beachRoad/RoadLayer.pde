// =============================================================================

class RoadLayer {
  float y;            // starting y-cordinate of the layer
  float h;            // height of the layer
  int num;            // number of rails/dividers
  float speed;        // speed of this layer
  Rail[] rails;       // array of Rail objects
  Divider[] dividers; // array of Divider objects

  // RoadLayer constructor
  RoadLayer(float y, float h, float s, int n) {
    this.y = y;                     // assigns y-coordiate
    this.h = h;                     // assigns height
    this.num = n;                   // assigns number of rails/dividers
    this.speed = s;                 // assigns speed
    this.rails = new Rail[n];       // creates a new Rail array of size n
    this.dividers = new Divider[n]; // creates a new Divider array of size n

    // instantiate all the rails/dividers in their respective arrays
    for (int i = 0; i < this.num; i++) {
      this.rails[i] = new Rail(width/this.num*i, this.y, this.speed);
      this.dividers[i] = new Divider(width/this.num*i+50, this.y+this.h*2/3, this.speed);
    }
  }

  // display the entire layer: (pavement, rails, dividers)
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

// =============================================================================

class Rail {
  float x;  // x-position
  float y;  // y-position
  float s;  // speed
  float railWidth = 30; 
  float railHeight = 40;

  // Rail constructor
  Rail(float x, float y, float s) {
    this.x = x;   // assigns the x-position
    this.y = y;   // assigns the y-position
    this.s = s;   // assigns the speed
  }

  // draw the rail
  void display() {
    fill(100, 100, 130);
    rect(0, this.y-this.railHeight, width, 8);
    rect(this.x, this.y-this.railHeight+3, this.railWidth, this.railHeight);

    // create and manage movement of the rail
    this.x += this.s;
    if(this.x < 0-this.railWidth) {
      this.x = width-this.railWidth;
    }
  }
}

// =============================================================================

class Divider {
  float x;  // x-position
  float y;  // y-position
  float s;  // speed
  float dividerWidth = 60;
  float dividerHeight = 2;
  
  // Divider constructor
  Divider(float x, float y, float s) {
    this.x = x;   // assigns the x-position
    this.y = y;   // assigns the y-position
    this.s = s;   // assigns the speed
  }

  // draw the divider
  void display() {
    fill(250, 250, 0);
    rect(this.x, this.y, this.dividerWidth, this.dividerHeight);
    
    // create and manage movement of the divider
    this.x += this.s;
    if(this.x < 0-this.dividerWidth) {
      this.x = width-this.dividerWidth;
    }
  }
}