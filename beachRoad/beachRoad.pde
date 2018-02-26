// beach road sketch by Jerome Martinez
// ~you are awesome~

// create the layers
SkyLayer sl;
OceanLayer ol;
RoadLayer rl;
CarLayer cl;

PImage canvas;

void setup() {
  size(1000, 600);
  noStroke();

  // instantiate each of the layers
  sl = new SkyLayer(0, 300, 0.05, 8);
  ol = new OceanLayer(300, 220, -2.5, 6);
  rl = new RoadLayer(520, 70, -12, 8);
  cl = new CarLayer(180, 545, 25, 15);
}

void draw() {
  background(0);

  // draw each layer
  sl.display();
  ol.display();
  rl.display();
  cl.display();

  canvas = copy();
  tint(245, 240, 200);
  image(canvas, 0, 0);
}