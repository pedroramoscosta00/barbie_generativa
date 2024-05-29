// Array of text to display
String[] messages = {
  "Humans have only one ending. Ideas live forever.",
  "Mr. Mattel… Mattel CEO: Please call me mother. No, thank you.",
  "I thought I might stay over tonight. Why? Because we’re girlfriend and boyfriend. To do what? I’m actually not sure.",
  "I’m just Ken and I’m enough. And I’m great at doing stuff.",
  "Come on, Kens. Nobody’s going to beach anyone off.",
  "Why didn’t Barbie tell me about Patriarchy?",
  "Goodnight Barbies. I’m definitely not thinking about death anymore.",
  "You have to go to the real world. You can go back to your regular life, and forget any of this ever happened. Or you can know the truth about the universe.",
  "Buckle up, Babe. Barbieland is now Kenland.",
  "Men look at me like I’m an object, girls hate me.",
  "The real world is not what I thought it was.",
  "I can already feel my heels lifting.",
  "I do not have a vagina and he does not have a penis. We have no genitals.",
  "It is literally impossible to be a woman.",
  "Maybe it's time to discover who Ken is.",
  "Ideas live forever. Humans, not so much.",
  "Men rule the world!",
  "You’re gonna start getting sad, and mushy, and complicated.",
  "We fixed everything so all women in the real world are happy.",
  "Destroy Barbie."
};

// TextDisplay class
class TextDisplay {
  String text;
  PImage img;
  PGraphics pg;

  int x=0;
  int y=0;
  
  float calculatedY;
  

  // Constructor
  TextDisplay(String[] messages, PImage img) {
    selectRandomText(messages);
    this.img = img;
  }

  // Method to randomly select text from the array
  void selectRandomText(String[] messages) {
    int index = int(random(messages.length));
    text = messages[index];
  }

  void desenharPersonagem(PImage img) {
    /*
    pg.beginDraw();
    y = pg.height - img.height;
    calculatedY = height-img.height;
    image(img, x, y);
    pg.endDraw();*/
    fill(255, 100);
    rect(0, 0, width, height);
    image(img, x, y);
  }
  
  // Method to display the text at a given position
  void display(float x, float y) {
    textSize(32);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, x, y);
  }
}
