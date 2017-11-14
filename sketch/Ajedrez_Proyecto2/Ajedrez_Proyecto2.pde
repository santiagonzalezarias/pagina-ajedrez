//import processing.serial.*;
//Serial puerto; //Comunicación serial

//Declaracion imagenes fichas blancas
PImage peonb;
PImage torreb;
PImage caballob;
PImage alfilb;
PImage reyb;
PImage reinab;

//Declaracion imagenes fichas negras
PImage peonn;
PImage torren;
PImage caballon;
PImage alfiln;
PImage reyn;
PImage reinan;

//Declaracion fichas blancas --> Impares
char peonB=1;
char torreB=3;
char caballoB=5;
char alfilB=7;
char reinaB=9;
char reyB=11;

//Declaracion fichas negras --> Pares
char peonN=2;
char torreN=4;
char caballoN=6;
char alfilN=8;
char reinaN=10;
char reyN=12;


//Declaracion matriz tablero
char[][] tab=new char[8][8];

//Controlar movimiento fichas
boolean[][] mov=new boolean [8][8];

//Control turnos False=Turno Blancas, True=Turno Negras
boolean acc, turno, actualizar=true; 

//Posiciones
int posX, posY;

//Auxiliares para posición
int aposX, aposY;

int comer, ficha;
String dato;



void setup() {
  //puerto=new Serial(this, "COM3", 9600); //Realizar comunicacion serial
  size(600, 600);
  tablero();


  //Cargar imagen peon blanco
  peonb=loadImage("sketch/Ajedrez_Proyecto2/data/peon-blanco.png");

  //Cargar imagen torre blanca
  torreb=loadImage("sketch/Ajedrez_Proyecto2/data/torre-blanca.png");

  //Cargar imagen caballo blanco
  caballob=loadImage("sketch/Ajedrez_Proyecto2/data/caballo-blanco.png");

  //Cargar imagen alfil blanco
  alfilb=loadImage("sketch/Ajedrez_Proyecto2/data/alfil-blanco.png");

  //Cargar imagen rey blanco
  reyb=loadImage("sketch/Ajedrez_Proyecto2/data/rey-blanco.png");

  //Cargar imagen reina blanca
  reinab=loadImage("sketch/Ajedrez_Proyecto2/data/reina-blanca.png");
  //----------------------------------------------
  //Cargar imagen peon negro
  peonn=loadImage("sketch/Ajedrez_Proyecto2/data/peon-negro.png");

  //Cargar imagen torre negra
  torren=loadImage("sketch/Ajedrez_Proyecto2/data/torre-negra.png");

  //Cargar imagen caballo negro
  caballon=loadImage("sketch/Ajedrez_Proyecto2/data/caballo-negro.png");

  //Cargar imagen alfil negro
  alfiln=loadImage("sketch/Ajedrez_Proyecto2/data/alfil-negro.png");

  //Cargar imagen rey negro
  reyn=loadImage("sketch/Ajedrez_Proyecto2/data/rey-negro.png");

  //Cargar imagen reina blanca
  reinan=loadImage("sketch/Ajedrez_Proyecto2/data/reina-negra.png");

  acc=false;   //Accion
  turno=false; //Turno inicial --> Blancas

  posicionesIniciales();
}



void draw() {
  limpiar(actualizar);
}


void tablero() {

  for (int j=0; j<8; j++) {
    for (int i=0; i<8; i++) {
      if ((i+j)%2==0) {
        fill(#DBDBDB); 
      } else {
        fill(#4D9D2E);
      }
      rect(i*75, j*75, 75, 75);
    }
  }
}


void posicionesIniciales() {
  char i, j;

  //Limpia tablero
  for (i=0; i<8; i++) {
    for (j=0; j<8; j++) {
      tab[i][j]=0;
    }
  }

  //Posiciones iniciales para fichas blancas
  for (i=0; i<=7; i++) {
    tab[i][1] =peonB;
  }
  tab[0][0]=torreB; 
  tab[7][0]=torreB;
  tab[1][0]=caballoB;   
  tab[6][0]=caballoB;
  tab[2][0]=alfilB;
  tab[5][0]=alfilB;
  tab[3][0]=reinaB;                    
  tab[4][0]=reyB;

  //Posiciones iniciales para fichas negras
  for (i=0; i<=7; i++) {
    tab[i][6] =peonN;
  }
  tab[0][7]=torreN; 
  tab[7][7]=torreN;
  tab[1][7]=caballoN;   
  tab[6][7]=caballoN;
  tab[2][7]=alfilN;
  tab[5][7]=alfilN;
  tab[3][7]=reinaN;                    
  tab[4][7]=reyN;

  limpiar(true);
}


void limpiar(boolean l) {
  char i, j;

  tablero();
  if (l==true) {
    for (i=0; i<=7; i++)    //Limpiando los movimientos posibles
      for (j=0; j<=7; j++)
        mov[i][j]=false;
  }
  for (i=0; i<=7; i++) {
    for (j=0; j<=7; j++) {
      if (mov[i][j]==true) {
        if ((tab[i][j]!=0)&&((i!=posX)||(j!=posY))) { //Cuadro para mostrar los posibles movimientos de cada ficha
          fill(#FF2424);
        } else
          fill(#00BCA1);
        rect(75*i, 525-((75*j)), 75, 75);
      }
      //Se actualizan las posiciones de las fichas
      if (tab[i][j]==peonB) 
        image(peonb, 75*i, 525-(75*j));
      if (tab[i][j]==torreB) 
        image(torreb, 75*i, 525-(75*j));
      if (tab[i][j]==caballoB) 
        image(caballob, 75*i, 525-(75*j));
      if (tab[i][j]==alfilB) 
        image(alfilb, 75*i, 525-(75*j));
      if (tab[i][j]==reyB) 
        image(reyb, 75*i, 525-(75*j));
      if (tab[i][j]==reinaB) 
        image(reinab, 75*i, 525-(75*j));

      if (tab[i][j]==peonN) 
        image(peonn, 75*i, 525-(75*j));
      if (tab[i][j]==torreN) 
        image(torren, 75*i, 525-(75*j));
      if (tab[i][j]==caballoN) 
        image(caballon, 75*i, 525-(75*j));
      if (tab[i][j]==alfilN) 
        image(alfiln, 75*i, 525-(75*j));
      if (tab[i][j]==reyN) 
        image(reyn, 75*i, 525-(75*j));
      if (tab[i][j]==reinaN) 
        image(reinan, 75*i, 525-(75*j));
    }
  }
}

void mousePressed() { //Cuando se realiza click
  char i, j;
  posX=9;  
  posY=9;

  for (i=0; i<=7; i++)
    if ((mouseX>=75*i)&&(mouseX<=75+(75*i)))   //Se guarda la posición del mouse al hacer click
      posX=i;
  for (j=0; j<=7; j++)
    if ((mouseY<=600-(75*j)) && (mouseY>=600-(75+(75*j))))
      posY=j;

  if (acc==false) {
    if ((posY==9)||(posX==9)|| (tab[posX][posY]==0)) { //Cuando se da click en una casilla vacia 
      return;
    }

    if (turno) {     //Se verifica el turno
      if ((tab[posX][posY] % 2) != 0)
        return;
    } else if ((tab[posX][posY] % 2) == 0)
      return;

    acc=true;

    mov[posX][posY]=true;
    Movimientos();  //Función de restricción de movimientos de cada ficha
    actualizar=false; 
    aposX=posX; 
    aposY=posY;

    print(aposX); //Posiciones iniciales
    println(aposY);
  } else {
    acc=false;
    if (posX==9 || posY==9) {   
      actualizar=true;
      return;
    }
    if ((mov[posX][posY]==true)&&((posX!=aposX)||(posY!=aposY))) {
      comer1();
      print(posX); //Posiciones finales
      println(posY);
      tab[posX][posY]=tab[aposX][aposY];  

      if (tab[posX][posY]==peonB || tab[posX][posY]==peonN) {
        ficha=0;
      }
      if (tab[posX][posY]==torreB || tab[posX][posY]==torreN) {
        ficha=1;
      }
      if (tab[posX][posY]==caballoB || tab[posX][posY]==caballoN) {
        ficha=2;
      }
      if (tab[posX][posY]==alfilB || tab[posX][posY]==alfilN) {
        ficha=3;
      }
      if (tab[posX][posY]==reinaB || tab[posX][posY]==reinaN) {
        ficha=4;
      }
      if (tab[posX][posY]==reyB || tab[posX][posY]==reyN) {
        ficha=5;
      }

      dato=Integer.toString(aposX) + Integer.toString(aposY)  + Integer.toString(posX)  +Integer.toString(posY) +  Integer.toString(comer) + Integer.toString(ficha);
      //puerto.write(dato);
      println(dato);
      tab[aposX][aposY]=0;
      turno=!turno; // Cambio de turno al realizar la jugada
    } 
    actualizar=true;
  }
}

void comer1() { //Verifica si come ficha
  if (!turno) { //Turno blancas, come negra
    if (tab[posX][posY] % 2==0 && tab[posX][posY]!=0) {
      println("blanca comio negra");
      comer=1;
    }
  } else 
  if (tab[posX][posY] % 2 !=0 && tab[posX][posY]!=0) { //Turno negras, come blanca
    println("negra comio blanca");
    comer=2;
  }

  if (tab[posX][posY]==0) {
    println("no comio");
    comer=0;
  }
}


void Movimientos() {

  boolean x1, x2, y1, y2;
  char i;

  x1=true;
  x2=true;
  y1=true;
  y2=true;

  //Movimientos posibles peones
  if (tab[posX][posY]==peonB) {
    if (posY>6)
      return;
    if (tab[posX][posY+1]==0) {
      mov[posX][posY+1]=true;
      if (posY==1)
        if (tab[posX][posY+2]==0)
          mov[posX][posY+2]=true;
    }
    if ((posX<=6)&&(posY<=6))
      if ((tab[posX+1][posY+1]!=0)&&((tab[posX][posY] % 2)!=(tab[posX+1][posY+1] % 2)))
        mov[posX+1][posY+1]=true;

    if ((posX>=1)&&(posY<=6))
      if ((tab[posX-1][posY+1]!=0)&&((tab[posX][posY] % 2)!=(tab[posX-1][posY+1] % 2)))
        mov[posX-1][posY+1]=true;
  } else if (tab[posX][posY]==peonN) {
    if ( posY < 1) 
      return;
    if ((tab[posX][posY-1] == 0)) { 
      mov[posX][posY-1]=true;
      if (posY==6) if (tab[posX][posY-2] == 0) 
        mov[posX][posY-2]=true;
    }
    if ((posX<=6)&&(posY>=1)) 
      if ((tab[posX+1][posY-1] != 0)&&((tab[posX][posY] % 2)!=(tab[posX+1][posY-1] % 2))) 
        mov[posX+1][posY-1]=true;
    if ((posX>=1)&&(posY>=1)) if ((tab[posX-1][posY-1] != 0)&&((tab[posX][posY] % 2)!=(tab[posX-1][posY-1] % 2)))
      mov[posX-1][posY-1]=true;
  }
  //---------------------------------------------------------------------------------------------------------------

  //Movimientos posibles torre y reina
  if ((tab[posX][posY]==torreB)||(tab[posX][posY]==torreN)||(tab[posX][posY]==reinaB)||(tab[posX][posY]==reinaN)) {   
    for (i=1; i<=7; i++) {

      if ( posX+i <= 7 && x1 == true)
        if (tab[posX+i][posY]==0)
          mov[posX+i][posY]=true;
        else {
          if ( (tab[posX+i][posY] % 2)!=(tab[posX][posY] % 2))
            mov[posX+i][posY]=true;
          x1=false;
        }
      if (posX-i>=0 && x2==true)  
        if (tab[posX-i][posY]==0) 
          mov[posX-i][posY]=true;
        else {
          if ((tab[posX-i][posY] % 2)!=(tab[posX][posY] % 2))
            mov[posX-i][posY]=true;
          x2=false;
        }

      if (posY+i<=7 && y1==true)
        if (tab[posX][posY+i]==0) 
          mov[posX][posY+i]=true;
        else {
          if ((tab[posX][posY+i] % 2) != (tab[posX][posY] % 2))
            mov[posX][posY+i] = true;
          y1=false;
        }

      if (posY-i >= 0 && y2==true) 
        if (tab[posX][posY-i] == 0) 
          mov[posX][posY-i] = true;
        else { 
          if ((tab[posX][posY-i] % 2)!=(tab[posX][posY] % 2)) 
            mov[posX][posY-i] = true;
          y2 = false;
        }
    }
    if ((tab[posX][posY]!=reinaB)&&(tab[posX][posY]!=reinaN))
      return;
    else
      x1=x2=y1=y2=true;
  }

  //------------------------------------------------------------------------------------------------------

  //Movimientos posibles alfil y reina
  if ((tab[posX][posY]==alfilB)||(tab[posX][posY]==alfilN)||(tab[posX][posY]==reinaB)||(tab[posX][posY]==reinaN)) {      
    for (i=1; i<=7; i++) {
      if (posX+i<=7 && posY+i<=7 && x1==true)
        if (tab[posX+i][posY+i] == 0) 
          mov[posX+i][posY+i] = true;
        else { 
          if ( (tab[posX+i][posY+i] % 2)!=(tab[posX][posY] % 2)) 
            mov[posX+i][posY+i]=true;
          x1=false;
        }

      if (posX+i<=7 && posY-i>=0 && x2==true) 
        if (tab[posX+i][posY-i]==0) 
          mov[posX+i][posY-i]=true;
        else { 
          if ((tab[posX+i][posY-i] % 2)!=(tab[posX][posY] % 2)) 
            mov[posX+i][posY-i]=true;
          x2=false;
        }                                                 

      if (posX-i>=0 && posY+i<=7 && y1==true)
        if (tab[posX-i][posY+i]==0) 
          mov[posX-i][posY+i]=true;
        else { 
          if ((tab[posX-i][posY+i] % 2)!=(tab[posX][posY] % 2)) 
            mov[posX-i][posY+i]=true;
          y1 = false;
        }

      if ( posX-i>=0 && posY-i>=0 && y2==true)  
        if (tab[posX-i][posY-i]==0) 
          mov[posX-i][posY-i]=true;
        else { 
          if ((tab[posX-i][posY-i] % 2)!=(tab[posX][posY] % 2)) 
            mov[posX-i][posY-i]=true;
          y2=false;
        }
    }
    return;
  }

  //----------------------------------------------------------------------------------------



  //Movimientos posibles caballo
  if ((tab[posX][posY]==caballoB)||(tab[posX][posY]==caballoN)) {

    if (posX+2<=7 && posY+1<=7)
      if (tab[posX][posY+1]==0)
        mov[posX+2][posY+1]=true;
      else if ((tab[posX][posY] % 2)!=(tab[posX+2][posY+1] % 2))
        mov[posX+2][posY+1]=true;

    if (posX+2<=7 && posY-1>=0)
      if (tab[posX+2][posY-1]==0)
        mov[posX+2][posY-1]=true;
      else if ((tab[posX][posY] % 2)!=(tab[posX+2][posY-1] % 2))
        mov[posX+2][posY-1]=true;

    if (posX-2>=0 && posY+1<=7)
      if (tab[posX-2][posY+1]==0)
        mov[posX-2][posY+1]=true;
      else if ((tab[posX][posY] % 2)!=(tab[posX-2][posY+1] % 2))
        mov[posX-2][posY+1]=true;

    if (posX-2>=0 && posY-1>=0)
      if (tab[posX-2][posY-1]==0)
        mov[posX-2][posY-1]=true;
      else if ((tab[posX][posY] % 2)!=(tab[posX-2][posY-1] % 2))
        mov[posX-2][posY-1]=true;

    if (posX+1<=7 && posY+2<=7)
      if (tab[posX+1][posY+2]==0)
        mov[posX+1][posY+2]=true;
      else if ((tab[posX][posY] % 2)!=(tab[posX+1][posY+2] % 2))
        mov[posX+1][posY+2]=true;

    if (posX-1>=0 && posY+2<=7)
      if (tab[posX-1][posY+2]==0)
        mov[posX-1][posY+2]=true;
      else if ((tab[posX][posY]  % 2)!=(tab[posX-1][posY+2] % 2))
        mov[posX-1][posY+2]=true;

    if (posX+1<=7 && posY-2>=0)
      if (tab[posX+1][posY-2]==0)
        mov[posX+1][posY-2]=true;
      else if ((tab[posX][posY] % 2)!=(tab[posX+1][posY-2] % 2))
        mov[posX+1][posY-2]=true;

    if (posX-1>=0 && posY-2>=0)
      if (tab[posX-1][posY-2]==0)
        mov[posX-1][posY-2]=true;
      else if ((tab[posX][posY] % 2)!=(tab[posX-1][posY-2] % 2))
        mov[posX-1][posY-2]=true;

    return;
  }

  //--------------------------------------------------------------------------

  //Posibles movimientos Rey
  if ((tab[posX][posY]==reyB)||(tab[posX][posY]==reyN)) {
    boolean x3=true, x4=true, y3=true, y4=true;


    if ( posX+1 <= 7 && x1 == true)
      if (tab[posX+1][posY]==0)
        mov[posX+1][posY]=true;
      else {
        if ( (tab[posX+1][posY] % 2)!=(tab[posX][posY] % 2))
          mov[posX+1][posY]=true;
        x1=false;
      }
    if (posX-1>=0 && x2==true)  
      if (tab[posX-1][posY]==0) 
        mov[posX-1][posY]=true;
      else {
        if ((tab[posX-1][posY] % 2)!=(tab[posX][posY] % 2))
          mov[posX-1][posY]=true;
        x2=false;
      }

    if (posY+1<=7 && y1==true)
      if (tab[posX][posY+1]==0) 
        mov[posX][posY+1]=true;
      else {
        if ((tab[posX][posY+1] % 2) != (tab[posX][posY] % 2))
          mov[posX][posY+1] = true;
        y1=false;
      }

    if (posY-1 >= 0 && y2==true) 
      if (tab[posX][posY-1] == 0) 
        mov[posX][posY-1] = true;
      else { 
        if ((tab[posX][posY-1] % 2)!=(tab[posX][posY] % 2)) 
          mov[posX][posY-1] = true;
        y2 = false;
      }

    if (posX+1<=7 && posY+1<=7 && x3==true)
      if (tab[posX+1][posY+1] == 0) 
        mov[posX+1][posY+1] = true;
      else { 
        if ( (tab[posX+1][posY+1] % 2)!=(tab[posX][posY] % 2)) 
          mov[posX+1][posY+1]=true;
        x1=false;
      }

    if (posX+1<=7 && posY-1>=0 && x4==true) 
      if (tab[posX+1][posY-1]==0) 
        mov[posX+1][posY-1]=true;
      else { 
        if ((tab[posX+1][posY-1] % 2)!=(tab[posX][posY] % 2)) 
          mov[posX+1][posY-1]=true;
        x2=false;
      }                                                 

    if (posX-1>=0 && posY+1<=7 && y3==true)
      if (tab[posX-1][posY+1]==0) 
        mov[posX-1][posY+1]=true;
      else { 
        if ((tab[posX-1][posY+1] % 2)!=(tab[posX][posY] % 2)) 
          mov[posX-1][posY+1]=true;
        y1 = false;
      }

    if ( posX-1>=0 && posY-1>=0 && y4==true)  
      if (tab[posX-1][posY-1]==0) 
        mov[posX-1][posY-1]=true;
      else { 
        if ((tab[posX-1][posY-1] % 2)!=(tab[posX][posY] % 2)) 
          mov[posX-1][posY-1]=true;
        y2=false;
      }
    return;
  }
}
