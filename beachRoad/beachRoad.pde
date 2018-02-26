// beach road sketch by Jerome Martinez
// ~you are awesome~

SkyLayer sl;
OceanLayer ol;
RoadLayer rl;

void setup() {
  size(800, 600);
  sl = new SkyLayer(0, 300, 0.05, 8);
  ol = new OceanLayer(300, 220, -2.5, 5);
  rl = new RoadLayer(520, 70, -8, 8);
  noStroke();
}

void draw() {
  background(0);
  sl.display();
  ol.display();
  rl.display();
}