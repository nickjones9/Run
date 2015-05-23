//Nick Jones

boolean collision = false;
boolean jump = false;                                                                                     // Track when collision has occored
boolean fall = false;                                                                                     // Track when player is falling
float cloudX = 0;                                                                                         // Tracking X position of first cloud
float cloudY = 0;                                                                                         // Tracking Y position of first cloud
float playerX = 200;                                                                                      // Tracking X position of player
float playerY =  0;                                                                                       // Tracking Y position of player
float objectX1 = 0;                                                                                       // Tracking X position of first obstacle
float objectX2 = 0;                                                                                       // Tracking Y position of second obstacle       
float objectX3 = 0;                                                                                       // Tracking Y position of yhird obstacle   
float objectY1 = 275;                                                                                     // Tracking X position of first obstacle
float objectY2 = 275;                                                                                     // Tracking Y position of second obstacle
float objectY3 = 225;                                                                                     // Tracking Y position of third obstacle
float delay1 = random(500);                                                                               // Delay for the first object entering screen
float delay2 = random(500, 1000);                                                                         // Delay for the second object entering screen
float delay3 = random(1000, 2000);                                                                        // Delay for the third object entering screen
float speed = 0;                                                                                          // Speed of objects
float gravity = 0;                                                                                        // 
float acceleration = 0;                                                                                   // Speed of objects
float playerYspeed = 1;                                                                                   // Speed of player while jumping
float playerDiameter;                                                                                     // 
float objectDiameter;                                                                                     // Diameter of objectts
float objectDiameter1;                                                                                    // Diameter of first object
float objectDiameter2;                                                                                    // Diameter of second object
float objectDiameter3;                                                                                    // Diameter of third object

void setup() {
  size(1000, 300);                                                                                        // Drawing a canvas

  objectX1 = width + 1000 + delay1;                                                                       // First object starts beyond width
  objectX2 = width + 1000 + delay2;                                                                       // Second object starts beyond width
  objectX3 = width + 1000 + delay3;                                                                       // Second object starts beyond width

  playerY = 275;                                                                                          // Player starts at 275
  playerYspeed = 0;                                                                                       // Speed of player starts at 1;
  speed = 5;                                                                                              // Speed of objects are set to 5
  playerDiameter = 50;                                                                                    // Setting diameter objects
  objectDiameter1 = 50;                                                                                   // Setting diameter of first object
  objectDiameter2 = 50;                                                                                   // Setting diameter of second object
  objectDiameter3 = 50;                                                                                   // Setting diameter of third object
}

void draw() {
  background(225);                                                                                        // Constantly drawing background

  ellipse(playerX, playerY, 50, 50);                                                                      // Drawing player

  objectX1 = objectX1 - speed;                                                                            // First object has a speed for every frame
  objectX2 = objectX2 - speed;                                                                            // Second object has a speed for every frame
  objectX3 = objectX3 - speed;                                                                            // Third object has a speed for every frame

  ellipse(objectX1, objectY1, objectDiameter1, objectDiameter1);                                          // First object is drawn
  ellipse(objectX2, objectY2, objectDiameter2, objectDiameter2);                                          // Second object is drawn
  ellipse(objectX3, objectY3, objectDiameter3, objectDiameter3);                                          // Third object is drawn

  if (playerY >= 275) {
    playerYspeed = 0;
    playerY = 275;
  } 

  if (objectX1 < 0)                                                                                       // When first object hits left boarder...
    objectX1 = width + delay1;                                                                            // It is re-drawn with a delay

  if (objectX2 < 0)                                                                                       // When second object hits left boarder...
    objectX2 = width + delay2;                                                                            // It is re-drawn with a delay

  if (keyPressed && playerY == 275) {                                                                     // When key is pressed and player is on the ground...
    jump = true;                                                                                          // Player is now jumping
    println("jumping...");
  }

  if (jump == true) {                                                                                     // If player is jumping...
    playerYspeed = playerYspeed - 1;                                                                      // Speed of player increases                                                                    // Player moves
  } 

  if (playerY <= 150) {                                                                                   // If the player reaches 200 high...
    jump = false;                                                                                         // Player is no longer jumping, but falling
    playerY = 149;                                                                                        // Speed of player invertes
    playerYspeed = playerYspeed * -1;                                                                     // Speed of player invertes
  }
  // println(playerSpeed);

  playerY = playerY + playerYspeed;                                                                       // Player's speed effects the player's position

  if (sqrt(sq(objectX1-playerX)+sq(objectY1-playerY)) < (objectDiameter1+playerDiameter)/2) {             // Using Pythag Therom to look for collisions with obj 1
    noLoop();                                                                                             // Stop looping when collision occors
    println("Collision w/ 1");
  }

  if (sqrt(sq(objectX2-playerX)+sq(objectY2-playerY)) < (objectDiameter2+playerDiameter)/2) {             // Using Pythag Therom to look for collisions with obj 2
    noLoop();                                                                                             // Stop looping when collision occors
    println("Collision w/ 2");
  }

  if (sqrt(sq(objectX3-playerX)+sq(objectY3-playerY)) < (objectDiameter3+playerDiameter)/2) {             // Using Pythag Therom to look for collisions with obj 3
    noLoop();                                                                                             // Stop looping when collision occors
    println("Collision w/3");
  }
}
