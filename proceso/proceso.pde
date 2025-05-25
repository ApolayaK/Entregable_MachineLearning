int totalPerType = 100;  // Número total de imágenes por tipo
int currentType = 0;     // Tipo de triángulo rectángulo
int count = 1;           // Contador para triángulos rectángulos (comienza desde 1)

int acu_currentType = 0; // Tipo de triángulo acutángulo
int acu_count = 1;       // Contador para triángulos acutángulos (comienza desde 1)

void setup() {
  size(128, 128);
  frameRate(10);
  background(255);

  // Crear carpeta "data" si no existe
  File dir = new File(sketchPath("data"));
  if (!dir.exists()) {
    dir.mkdirs();
  }
}

void draw() {
  if (currentType < 4) {
    // Generar triángulos rectángulos
    generateRectangularTriangles();
  } else if (acu_currentType < 2) {
    // Generar triángulos acutángulos
    generateAcutangularTriangles();
  } else {
    // Finaliza el proceso cuando se generen todos
    println("¡Generación completa!");
    exit();
  }
}

void generateRectangularTriangles() {
  background(255); // Fondo blanco para cada nueva imagen
  stroke(0);        // Línea negra
  strokeWeight(3);  // Grosor de la línea

  float base = random(30, 50);
  float heightT = random(30, 50);
  float x = random(40, width - 40);
  float y = random(40, height - 40);

  pushMatrix();
  translate(x, y);

  beginShape();
  // Dibujar los 4 tipos de triángulos rectángulos
  if (currentType == 0) {
    // Recto abajo izquierda
    vertex(0, 0);
    vertex(base, 0);
    vertex(0, -heightT);
  } else if (currentType == 1) {
    // Recto abajo derecha
    vertex(0, 0);
    vertex(-base, 0);
    vertex(0, -heightT);
  } else if (currentType == 2) {
    // Recto arriba izquierda
    vertex(0, 0);
    vertex(base, 0);
    vertex(0, heightT);
  } else if (currentType == 3) {
    // Recto arriba derecha
    vertex(0, 0);
    vertex(-base, 0);
    vertex(0, heightT);
  }
  endShape(CLOSE);
  popMatrix();

  // Guardar en carpeta "data" con nombre indicando tipo
  String filename = "tri_rect_" + nf(currentType + 1, 2) + "_" + nf(count, 3) + ".png";
  saveFrame("data/" + filename);

  count++;
  if (count > totalPerType) {
    count = 1;  // Reiniciar contador al alcanzar 100 imágenes
    currentType++;
  }
}

void generateAcutangularTriangles() {
  background(255); // Fondo blanco para cada nueva imagen
  stroke(0);        // Línea negra
  strokeWeight(3);  // Grosor de la línea

  float base = random(30, 50);
  float heightT = random(30, 50);
  float x = random(40, width - 40);
  float y = random(40, height - 40);

  pushMatrix();
  translate(x, y);

  beginShape();
  // Dibujar los 2 tipos de triángulos acutángulos
  if (acu_currentType == 0) {
    // Tipo 1: vértice arriba centrado
    vertex(-base/2, 0);
    vertex(base/2, 0);
    vertex(0, -heightT);
  } else if (acu_currentType == 1) {
    // Tipo 2: vértice abajo centrado
    vertex(-base/2, 0);
    vertex(base/2, 0);
    vertex(0, heightT);
  }
  endShape(CLOSE);
  popMatrix();

  // Guardar en carpeta "data" con nombre indicando tipo
  String filename = "tri_acu_" + nf(acu_currentType + 1, 2) + "_" + nf(acu_count, 3) + ".png";
  saveFrame("data/" + filename);

  acu_count++;
  if (acu_count > totalPerType) {
    acu_count = 1;  // Reiniciar contador al alcanzar 100 imágenes
    acu_currentType++;
  }
}
