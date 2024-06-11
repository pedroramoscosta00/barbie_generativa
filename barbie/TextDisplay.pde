// Array of text to display
String[] messagesBarbie = {
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
  "Ideas live forever. Humans, not so much.",  "Men rule the world!",
  "You’re gonna start getting sad, and mushy, and complicated.",
  "We fixed everything so all women in the real world are happy.",
  "You can be anything you want to be.",
    "I’m everything, but I'm also just a girl.",
    "We must strive to be more than what we are.",
    "Every day is the best day ever.",
    "Girls can do anything boys can do, and more!",
    "Dream big, because dreams do come true.",
    "There's no limit to what we can achieve.",
    "Barbie Land is where dreams begin.",
    "Believe in yourself, because you are amazing.",
    "We’re all capable of incredible things.",
    "Barbie isn’t just a doll, she’s a role model.",
    "Imagination has no bounds.",
    "Every girl deserves to shine.",
    "Barbie Land is a place of endless possibilities.",
    "Confidence is the key to success.",
    "We’re strong, we’re smart, we’re unstoppable.",
    "Barbie shows us that we can be leaders.",
    "Never underestimate the power of a girl with a dream.",
    "Together, we can change the world.",
    "Barbie taught us that kindness and courage go hand in hand.",
    "In Barbie Land, every girl’s dream is possible.",
    "You’re never too old to dream big.",
    "Barbie inspires us to reach for the stars.",
    "Being yourself is the best thing you can be.",
    "Barbie celebrates the power of friendship.",
    "We can be heroes in our own stories.",
    "Barbie Land is a place where everyone belongs.",
    "Barbie encourages us to break boundaries.",
    "Believe in the magic within you.",
    "In Barbie Land, everyone’s voice is heard.",
    "Barbie’s world is full of love and acceptance.",
    "There’s strength in diversity.",
    "Barbie empowers us to embrace who we are.",
    "Together, we are unstoppable.",
    "Barbie is a symbol of hope and possibility.",
    "Every girl has the power to change the world.",
    "Barbie teaches us to dream without limits.",
    "In Barbie Land, we support and uplift each other.",
    "The future is bright with Barbie’s inspiration.",
    "Barbie’s message is one of love and empowerment.",
    "Every girl can make a difference."
};

String[] messagesKen = {
  "Welcome to the Mojo Dojo Casa House!",
    "It’s not a house, it’s a home.",
    "This is where I’ll teach you all about the patriarchy.",
    "The Mojo Dojo Casa House is the perfect place for me to be a man.",
    "You see, Barbie, the Mojo Dojo Casa House represents freedom and independence.",
    "Every man needs a Mojo Dojo Casa House to truly express himself.",
    "Here at the Mojo Dojo Casa House, we can be our true, rugged selves.",
    "The Mojo Dojo Casa House is where all my dreams come true.",
    "Barbie, let me show you the wonders of the Mojo Dojo Casa House.",
    "The essence of manliness is captured perfectly in the Mojo Dojo Casa House.",
    "At the Mojo Dojo Casa House, we live by our own rules.",
    "There’s nothing more liberating than the Mojo Dojo Casa House.",
    "This isn’t just a place; it’s a lifestyle. Welcome to the Mojo Dojo Casa House.",
    "Barbie, the Mojo Dojo Casa House is where I feel most alive.",
    "The Mojo Dojo Casa House is the pinnacle of my existence.",
    "Every detail in the Mojo Dojo Casa House reflects my personality.",
    "The Mojo Dojo Casa House is a fortress of solitude for men.",
    "Only in the Mojo Dojo Casa House can a man truly be free.",
    "Everything about the Mojo Dojo Casa House is perfect for a guy like me.",
    "The Mojo Dojo Casa House is my sanctuary, my paradise.",
    "The Mojo Dojo Casa House is where I can be unapologetically me.",
    "This is more than a house, it’s a symbol of masculinity.",
    "The Mojo Dojo Casa House is where we can embrace our true selves.",
    "Welcome to the ultimate man cave: the Mojo Dojo Casa House.",
    "In the Mojo Dojo Casa House, we make our own destiny.",
    "Barbie, you have to see how amazing the Mojo Dojo Casa House is.",
    "The Mojo Dojo Casa House is all about living large and in charge.",
    "Life is better at the Mojo Dojo Casa House.",
    "The Mojo Dojo Casa House is where adventure begins.",
    "Here at the Mojo Dojo Casa House, we’re kings of our own world.",
    "There’s nothing like the Mojo Dojo Casa House anywhere else.",
    "The Mojo Dojo Casa House: where men can be men.",
    "In the Mojo Dojo Casa House, we write our own rules.",
    "The Mojo Dojo Casa House is where legends are made.",
    "This is my kingdom, my Mojo Dojo Casa House.",
    "The Mojo Dojo Casa House is the ultimate hangout spot.",
    "Every man needs a place like the Mojo Dojo Casa House.",
    "The Mojo Dojo Casa House is where we find our true strength.",
    "The Mojo Dojo Casa House: where every day is an adventure.",
    "Barbie, the Mojo Dojo Casa House is a man’s paradise."
};
// TextDisplay class
class TextDisplay {
  String text;
  PImage img;
  PGraphics pg;
  color cor;

  int x=0;
  int y=0;

  float calculatedY;

  color bgColor = color(255);

  float angle = 0;
  float radius = 50; // Initial radius of the spiral
  float angularSpeed = 0.05; // Speed of rotation
  float radiusSpeed = 0.5; // Speed of radius change



  // Constructor
  TextDisplay(String[] messages, PImage img, color cor) {
    selectRandomText(messages);
    this.img = img;
    this.cor = cor;
  }

  // Method to randomly select text from the array

  void selectRandomText(String[] messages) {
    int index = int(random(messages.length));
    text = messages[index];
  }

  void desenharPersonagem(PImage img) {
    fill(255, 100);
    rectMode(CORNERS);
    rect(0, 0, width, height);
    image(img, x, y);
  }


  void display(float x, float y) {
    textSize(32);
    textAlign(CENTER, CENTER);

    // Draw the star
    noStroke();
    fill(255);



    // Calculate text dimensions
    float textWidth = textWidth(text);
    float textHeight = textAscent() + textDescent();

    fill(bgColor);
    rectMode(CENTER);
    rect(x, y, textWidth + 20, textHeight + 20);

    // Draw text
    fill(cor);
    text(text, x, y);
  }
}
