class CarLayer {
  float x;
  float y;
  float w;
  float h;

  CarLayer(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  // display the car
  void display() {
    // chasis
    fill(250, 50, 50);
    rect(this.x-this.w*3+5, this.y-this.h*2, this.w*6-10, this.h*2, 10);
    rect(this.x-this.w*3/2, this.y-this.h*4, this.w*3, this.h*4, 40);

    // right tire
    fill(50, 50, 50);
    ellipse(this.x+this.w*2, this.y, this.w, this.w);
    fill(150, 150, 150);
    ellipse(this.x+this.w*2, this.y, this.w-10, this.w-10);

    // left tire
    fill(50, 50, 50);
    ellipse(this.x-this.w*2, this.y, this.w, this.w);
    fill(150, 150, 150);
    ellipse(this.x-this.w*2, this.y, this.w-10, this.w-10);

  }
}