// Horloge analoge et digital
 
//variables horloge analogue
int radius = 700;
int sx = 600;
int sy = 300; 
int cx, cy;
 
//variable pour gérer les clicks dans les buttons dans l'horlogue analogue 
int circleSize = 85;
String overCircle = "";
PImage img;
PImage loadedVideo; 

//vidéos
//importer la librairie utilisée pour faire fonctionner les vidéos.
import processing.video.*;
Movie video;

//Array des videos disponible.
String [] videoName = {"start_button2.mov","m1.mov","m2.mov","m3.mov","m4.mov","m5.mov","m6.mov","m7.mov","m8.mov","m9.mov","rock_minions.mov","button_start.mov","m5.mov"}; //liste de vidéo
int indexvideo = 0; //numéro du vidéo qui va jouer.
boolean videoPlaying = false;

 //canvas size
void setup() {
  size(1000, 1000);  
  img=loadImage("mechanical_clock.jpg");
  //analog clock center
  cx = width / 2;
  cy = 415 ;
  
  }
  
void draw() {
  //background
  //PImage img;
  background(0);
  image(img,-120,0); 
  
  //draw horloge numérique
  float h, m, s;
  h = hour();
  m = minute();
  s = second();
  textSize(60);
  fill(255);
  text("Current time: " + (int)h + ":" + (int)m + ":" + (int)s, 150, height-90);
  
  if(!videoPlaying) {
      //draw horloge analogue
      strokeWeight(3);
      //stroke(0,100);   //Si jamais, on a besoin de tracer un cercle
      //noFill();
      //ellipse(cx, cy, radius, radius); 
      stroke(255,0,0);
      fill(255,0,0,100);
      ellipse(100, 100, circleSize, circleSize);
      textSize(20);
      text("BACK",75, 105);
            // validation que le curseur est au-dessus du button "back"
      if (mouseX > 100-circleSize/2 && mouseX < 100+circleSize/2 && 
          mouseY > 100-circleSize/2 && mouseY < 100+circleSize/2) {
          overCircle = "back_button";  
      }  
    
      //Marqueur sur L,horlogue
      for (int i = 0; i < 12; i ++) {
          float ang = i * 30 * PI / 180;
          float sina = sin(ang);
          float cosa = cos(ang);
          
          //position pour les petites lignes
          int x1 = (int)(cx + (radius / 2 - 25) * sina);
          int y1 = (int)(cy + (radius / 2 - 25) * cosa);
          int x2 = (int)(cx + radius / 2 * sina);
          int y2 = (int)(cy + radius / 2 * cosa);
          
          //position pour les petits cercles
          int bx = (int)(cx + (radius / 2 - 105) * sina);
          int by = (int)(cy + (radius / 2 - 105) * cosa);
          line(x1, y1, x2, y2);
          ellipse(bx, by, circleSize, circleSize); 
          
              // validation que le curseur est au-dessus d'un cercle rouge
          if (mouseX > bx-circleSize && mouseX < bx+circleSize && 
              mouseY > by-circleSize && mouseY < by+circleSize) {
            overCircle = "circle_"+i;  
          }
      }
      
      // draw seconde
      float ang = (30 - s) * 6 * PI / 180;
      float sina = sin(ang);
      float cosa = cos(ang);  
      int sx = (int)(cx + radius / 2.3 * sina);
      int sy = (int)(cy + radius / 2.3 * cosa);
      line(cx, cy, sx, sy);  
      
      // draw minute
      strokeWeight(10);
      m += (s / 60.0);
      ang = (30 - m) * 6 * PI / 180;
      sina = sin(ang);
      cosa = cos(ang);
      int mx = (int)(cx + radius / 2.5 * sina);
      int my = (int)(cy + radius / 2.5 * cosa);  
      line(cx, cy, mx, my);
      
      // draw heure
      strokeWeight(20);
      h += (m / 60.0);  
      ang = (30 - h) * 30 * PI / 180;
      sina = sin(ang);
      cosa = cos(ang);
      int hx = (int)(cx + radius / 5 * sina);
      int hy = (int)(cy + radius / 5 * cosa);  
      line(cx, cy, hx, hy);
  } 
  //Load le vidéo dans le canvas
  else {
    image(video, 0,0);
  }  
}

void loadImage(boolean isVideoPlaying, String imageName) {
    videoPlaying = isVideoPlaying;
    img=loadImage(imageName);
    background(0);  
    image(img,0,0);
    println(imageName);
    
}

void playVideo(boolean isVideoPlaying, String videoName){
    println(videoName);
    videoPlaying = isVideoPlaying;
    video = new Movie(this, videoName);
    video.loop();

}

void movieEvent(Movie m) {
   m.read();

}

void mouseClicked() 

   {
  switch(overCircle) { 
    case "back_button":
      loadImage(false, "mechanical_clock.jpg");
      break;
      
    case "circle_0": // button de 6 heures
      playVideo(true, videoName[0]);
      break; 
      
    case "circle_1": //  button de 5 heures
      playVideo(true, videoName[1]);
      break;
      
    case "circle_2": //  button de 4 heures
      playVideo(true, videoName[2]);
      break;
      
    case "circle_3": //  button de 3 heures
      playVideo(true, videoName[3]);
      break;
      
    case "circle_4": //  button de 2 heures
      playVideo(true, videoName[4]);
      break;
      
    case "circle_5": //  button de 1 heures
      playVideo(true, videoName[5]);
      break;
      
    case "circle_6": //  button de 12 heures
      playVideo(true, videoName[6]);
      break;
      
    case "circle_7": //  button de 11 heures
      playVideo(true, videoName[7]);
      break;
      
    case "circle_8": //  button de 10 heures
      playVideo(true, videoName[8]);
      break;
      
    case "circle_9": //  button de 9 heures
      playVideo(true, videoName[9]);
      break;
      
    case "circle_10": //  button de 8 heures
      playVideo(true, videoName[10]);
      break;
      
    case "circle_11": //  button de 7 heures
      playVideo(true, videoName[11]);
      break;
      
    default :
      loadImage(false, "mechanical_clock.jpg");
      println("no_circle"); //  button à l'extérieur de l'horloge analogue, dans le vide
      break;
  }
  overCircle="";

}

/*to do
-Cacher l'horloge quand on click sur les buttons d'heure
-trouver et éditer les vidéos
-faire la fonction qui load les videos et les associer avec la fonctions des flèches du clavier
-exporter le code du projet sur GitHub
*/