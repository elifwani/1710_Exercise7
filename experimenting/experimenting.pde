PShader shader;

void setup() {
  size(800, 600, P2D);
  shader = loadShader("example.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("depth", 0.5);
  shader.set("rate", 2.0);
}

void draw() {
  background(0);

  stroke(0, 255, 0);
  fill(200, 42, 30);
  triangle(18, 18, 18, 360, 81, 360);  
  triangle(800-18, 18, 800-18, 360, 800-81, 360);

  for (int i = 0; i < 200; i += 20) {
    bezier(mouseX-(i/2.0), 40+i, 410, 20, 440, 300, mouseY-(i/16.0), 300+(i/8.0));
  }
  for (int i = 0; i < 200; i += 20) {
    bezier(mouseY-(i/16.0), 80+i, 410, 20, 440, 300, mouseX-(i/2.0), 330+(i/8.0));
  }
  for (int i = 0; i < 200; i += 20) {
    bezier(mouseX-(i/2.0), 40+i, 500, 20, 440, 300, mouseY-(i/16.0), 300+(i/8.0));
  }
  for (int i = 0; i < 200; i += 20) {
    bezier(mouseY-(i/16.0), 80+i, 500, 20, 440, 300, mouseX-(i/2.0), 330+(i/8.0));
  }
  for (int i = 0; i < 200; i += 20) {
    bezier(mouseY, 300, 500, 400, 440, 300, mouseX, 500);
  }
  for (int i = 0; i < 200; i += 20) {
    bezier(mouseX, 340, 500, 450, 440, 300, mouseY, 550);
  }

  shader.set("time", float(millis())/5000.0);
  filter(shader);
}
