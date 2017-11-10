//Tres circunferencias arrastrables (drag and drop) unidas por líneas
 
//variables para la primera circunferencia: coord. del centro y tamaño
int x = 100;
int y = 100;
int sz = 100;
//variables para la segunda
int x1 = 400;
int y1 = 100;
int sz1 = 50;
//variables para la tercera
int x2 = 250;
int y2 = 400;
int sz2 = 75;
//variable para el color del fondo
color bgcolor;
 
void setup(){
  size(500,500);
  //definiendo y aplicando el color de fondo
  bgcolor = #CC0000;
  background(bgcolor);
}
 
void draw(){
  //reiniciar el fondo a cada repetición
  background(bgcolor);
 
  //líneas que unen las circ.
  stroke(#FFFFFF);
  line(x,y, x1,y1);
  line(x1,y1, x2,y2);
  line(x2,y2, x,y);
 
  //primera circ.
  //si la distancia entre el ratón y el centro es menor que la mitad del radio...
  if (dist(x,y,  mouseX,mouseY) < sz/2){
    //el cursor se convierte en mano
    cursor(HAND);
    //cambia el color
    fill(#FA8A00);
    //si además hacemos clic
    if (mousePressed){
      //el centro de la circ. se mueve a la posición del cursor
      x = mouseX;
      y = mouseY;
      //y la línea se hace más gruesa
      strokeWeight(5);
    //en caso contrario
    } else {
      //volver al grueso original
      strokeWeight(2);
    }
    //color de la circ. con el cursor encima
    fill(#FA8A00);
    stroke(#FFFFFF);
  //si el cursor está fuera de la circ.  
  } else {
    //deshacemos los cambios en el cursor y el contorno
    cursor (ARROW);
    noStroke();
    fill(#FFFFFF);
  }
  //y dibujamos la circunferencia
  ellipse(x, y, sz, sz);
 
  //segunda circ.
  if (dist(x1,y1,  mouseX,mouseY) < sz/2){
    cursor(HAND);
    fill(#FA8A00);
    if (mousePressed){
      x1 = mouseX;
      y1 = mouseY;
      strokeWeight(5);
    } else {
      strokeWeight(2);
    }
 
    fill(#FA8A00);
    stroke(#FFFFFF);
 
  } else {
    cursor (ARROW);
    noStroke();
    fill(#FFFFFF);
  }
  ellipse(x1, y1, sz1, sz1);
 
  //tercera circ.
  if (dist(x2,y2,  mouseX,mouseY) < sz/2){
    cursor(HAND);
    fill(#FA8A00);
    if (mousePressed){
      x2 = mouseX;
      y2 = mouseY;
      strokeWeight(5);
    } else {
      strokeWeight(2);
    }
 
    fill(#FA8A00);
    stroke(#FFFFFF);
 
  } else {
    cursor (ARROW);
    noStroke();
    fill(#FFFFFF);
  }
  ellipse(x2, y2, sz2, sz2);
}