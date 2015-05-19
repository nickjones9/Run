//Nick Jones

float playerX = 0;                                                                                        // Tracking X position of player
float playerY = 0;                                                                                        // Tracking Y position of player
float objectX1 = 0;                                                                                       // Tracking X position of first obstacle
float objectX2 = 0;                                                                                       // Tracking Y position of second obstacle       
float objectY1 = 0;                                                                                       // Tracking X position of first obstacle
float objectY2 = 0;                                                                                       // Tracking Y position of second obstacle
float delay1 = random(500, 1000);                                                                         // Delay for the first object entering screen
float delay2 = random(500);                                                                               // Delay for the second object entering screen
float speed = 0;                                                                                          // Speed of objects

void setup() {
  size(1000, 300);                                                                                        // Drawing a canvas

  objectX1 = width + 1000 + delay1;                                                                       // First object starts beyond width
  objectX2 = width + 1000;                                                                                // Second object starts beyond width
  
  speed = 5;
}

void draw() {
  background(225);                                                                                        // Constantly drawing background

  objectX1 = objectX1 - speed;                                                                            // First object has a speed every frame
  objectX2 = objectX2 - speed;                                                                            // Second object has a speed every frame

  ellipse(objectX1, 275, 50, 50);                                                                         // First object is drawn
  ellipse(objectX2, 275, 50, 50);                                                                         // Second object is drawn

  if (objectX1 < 0)                                                                                       // When first object hits left boarder...
    objectX1 = width + delay1;                                                                            // It is re-drawn with a delay
    
  if (objectX2 < 0)                                                                                       // When second object hits left boarder...
    objectX2 = width + delay2;                                                                            // It is re-drawn with a delay
}
