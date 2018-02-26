// beach road sketch by Jerome Martinez
// ~you are awesome~

// create the layers
OceanLayer ol;
RoadLayer rl;
CarLayer cl;

void setup() {
  size(800, 600);
  noStroke();

  // instantiate each of the layers
  ol = new OceanLayer(300, 250, -2.5, 10);
  rl = new RoadLayer(520, 70, -12, 8);

  // draw the car
  cl = new CarLayer(180, 545, 25, 15);
}

void draw() {
  background(0);

  // draw the sky
  fill(75, 205, 255);
  rect(0, 0, width, height);

  // draw each layer
  ol.display();
  rl.display();
  cl.display();
}