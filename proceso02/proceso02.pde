void setup() {
  // Reducimos el tamaño del lienzo para ahorrar recursos de hardware
  size(64, 64); // Lienzo pequeño
}

void draw() {
  // 6 imágenes en total: 4 triángulos rectángulos y 2 acutángulos
  for (int i = 0; i < 6; i++) {
    background(255);
    strokeWeight(4);

    pushMatrix(); // Traslación de objetos

    // Algoritmo para coordenadas
    float r = random(8, 24);
    float x = random(r, width - r);
    float y = random(r, height - r);

    stroke(100, 100, 100);

    translate(x, y); // Va con pushMatrix

    // Triángulos rectángulos
    if (i < 4) {
      float base = r; // Base del triángulo
      float heightT = r; // Altura del triángulo

      if (i == 0) {
        // Tipo 1: Rectángulo (abajo izquierda)
        beginShape();
        vertex(0, 0);
        vertex(base, 0);
        vertex(0, -heightT);
        endShape(CLOSE);
        saveFrame("data/tri_rect_01_" + nf(frameCount, 3) + ".png");
      } else if (i == 1) {
        // Tipo 2: Rectángulo (abajo derecha)
        beginShape();
        vertex(0, 0);
        vertex(-base, 0);
        vertex(0, -heightT);
        endShape(CLOSE);
        saveFrame("data/tri_rect_02_" + nf(frameCount, 3) + ".png");
      } else if (i == 2) {
        // Tipo 3: Rectángulo (arriba izquierda)
        beginShape();
        vertex(0, 0);
        vertex(base, 0);
        vertex(0, heightT);
        endShape(CLOSE);
        saveFrame("data/tri_rect_03_" + nf(frameCount, 3) + ".png");
      } else if (i == 3) {
        // Tipo 4: Rectángulo (arriba derecha)
        beginShape();
        vertex(0, 0);
        vertex(-base, 0);
        vertex(0, heightT);
        endShape(CLOSE);
        saveFrame("data/tri_rect_04_" + nf(frameCount, 3) + ".png");
      }
    } 
    // Triángulos acutángulos
    else {
      float base = r; // Base del triángulo
      float heightT = r; // Altura del triángulo

      if (i == 4) {
        // Tipo 1: Acutángulo (vértice arriba centrado)
        beginShape();
        vertex(-base / 2, 0);
        vertex(base / 2, 0);
        vertex(0, -heightT);
        endShape(CLOSE);
        saveFrame("data/tri_acu_01_" + nf(frameCount, 3) + ".png");
      } else if (i == 5) {
        // Tipo 2: Acutángulo (vértice abajo centrado)
        beginShape();
        vertex(-base / 2, 0);
        vertex(base / 2, 0);
        vertex(0, heightT);
        endShape(CLOSE);
        saveFrame("data/tri_acu_02_" + nf(frameCount, 3) + ".png");
      }
    }

    popMatrix();
  } // fin for

  if (frameCount == 100) {
    exit();
  }
}
