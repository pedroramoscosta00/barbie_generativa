class StaticVeiculo extends Veiculo {
  StaticVeiculo(PImage img, float px, float py, int tamanho, PGraphics pg, int noiseFreq, float noiseScale, int intervalo, int velX) {
    super(img, px, py, tamanho, pg, noiseFreq, noiseScale, intervalo, velX);
  }

  @Override
    void noiseMovement() {
    y = ppy;  // Keep y constant
    x = ppx;
  }
}
