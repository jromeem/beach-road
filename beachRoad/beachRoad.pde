// beach road sketch by Jerome Martinez
// ~you are awesome~

OceanLayer ol;
OceanLayer ol2;
SkyLayer sl;

void setup() {
  sl = new SkyLayer(0, 300, 0.06, 8);
  ol = new OceanLayer(300, 150, -1.5, 5);
  ol2 = new OceanLayer(450, 150, -1.5, 5);

  size(800, 600);
  noStroke();
}

void draw() {
  background(0);
  sl.display();
  ol.display();
  // ol2.display();
}