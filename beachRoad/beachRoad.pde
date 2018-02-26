// beach road sketch by Jerome Martinez
// ~you are awesome~

SkyLayer sl;
OceanLayer ol;
RoadLayer rl;
CarLayer cl;

void setup() {
  size(800, 600);
  noStroke();

  sl = new SkyLayer(0, 300, 0.05, 8);
  ol = new OceanLayer(300, 220, -2.5, 5);
  rl = new RoadLayer(520, 70, -8, 8);
  cl = new CarLayer(180, 545, 25, 15);
}

void draw() {
  background(0);
  sl.display();
  ol.display();
  rl.display();
  cl.display();
}