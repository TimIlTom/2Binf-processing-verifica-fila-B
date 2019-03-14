Personaggio harry;
Veicolo nimbus2000;
boolean harrySafe = false;

void setup() {
  fullScreen(P3D);

  harry = new Personaggio ("harry.obj", #000000, width/2, height*0.1);

  nimbus2000 = new Veicolo("broom.obj", #FF00FF, width/2, height*0.9);
}

void draw() {
  background(#7AFF5D);
  lights();

  harry.display ();
  harry.cade();
  harry.avvicina();

  nimbus2000.display();
  nimbus2000.avvicina();

  if ( harry.y > nimbus2000.y ) {

    harry.gravity = 0;
    harry.x = nimbus2000.x;
    harry.y = nimbus2000.y;
    harrySafe = true;
  }

  if ( harrySafe == true ) {

    nimbus2000.fluttua(harry);
  }
}

class Personaggio {

  PShape forma;
  float x, y;
  float gravity = 9.8;
  Personaggio ( String filename, int setColor, float x, float y ) {

    this.x = x;
    this.y = y;

    forma = loadShape(filename);
    forma.setFill (setColor);
  }

  void display () {

    shape( forma, x, y );
  }

  void cade() {

    y+=gravity;
  }

  void avvicina() {

    if ( keyPressed && key =='a' ) {   
      forma.scale(1.01);
    }
  }
}

class Veicolo {

  PShape tipoV;
  float x, y;
  Veicolo ( String filename, int setColor, float x, float y ) {

    this.x = x;
    this.y = y;

    tipoV = loadShape ( filename );
    tipoV.setFill (setColor);
  }

  void display () {

    shape (tipoV, x, y );
  }

  void avvicina() {

    if ( keyPressed && key =='a' ) {
      tipoV.scale(1.01);
    }
  }

  void fluttua(Personaggio guidatore ) {

    guidatore.y+=10;
    y+=10;

    guidatore.y -= 8;
    y-=8;
  }
}
