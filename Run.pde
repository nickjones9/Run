//Nick Jones

boolean jump = false;                                                                                     // Track when player is jumping
boolean fall = false;                                                                                     // Track when player is falling
float cloudX = 0;                                                                                         // Tracking X position of first cloud
float cloudY = 0;                                                                                         // Tracking Y position of first cloud
float playerX = 200;                                                                                      // Tracking X position of player
float playerY = 0;                                                                                        // Tracking Y position of player
float objectX1 = 0;                                                                                       // Tracking X position of first obstacle
float objectX2 = 0;                                                                                       // Tracking Y position of second obstacle       
float objectY1 = 0;                                                                                       // Tracking X position of first obstacle
float objectY2 = 0;                                                                                       // Tracking Y position of second obstacle
float delay1 = random(500, 1000);                                                                         // Delay for the first object entering screen
float delay2 = random(500);                                                                               // Delay for the second object entering screen
float speed = 0;                                                                                          // Speed of objects
float gravity = 0.1;                                                                                      // 
float acceleration = 20;                                                                                  // Speed of objects
float playerSpeed = 0;                                                                                    // Speed of player while jumping

void setup() {
  size(1000, 300);                                                                                        // Drawing a canvas

  objectX1 = width + 1000 + delay1;                                                                       // First object starts beyond width
  objectX2 = width + 1000;                                                                                // Second object starts beyond width

  playerY = 275;                                                                                          // Player starts at 275
  playerSpeed = 0;                                                                                        // Speed of player starts at 1;
  speed = 5;                                                                                              // Speed of objects are set to 5
}

void draw() {
  background(225);                                                                                        // Constantly drawing background

  ellipse(playerX, playerY, 50, 50);                                                                      // Drawing player

  objectX1 = objectX1 - speed;                                                                            // First object has a speed every frame
  objectX2 = objectX2 - speed;                                                                            // Second object has a speed every frame

  ellipse(objectX1, 275, 50, 50);                                                                         // First object is drawn
  ellipse(objectX2, 275, 50, 50);                                                                         // Second object is drawn

  if (playerY >= 275) {
    playerSpeed = 0;
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
    playerSpeed = playerSpeed - 0.2;                                                                      // Speed of player increases                                                                    // Player moves
  } 

  if (playerY <= 150) {                                                                                   // If the player reaches 200 high...
    jump = false;                                                                                         // Player is no longer jumping, but falling
    playerY = 149;                                                                                        // Speed of player invertes
    playerSpeed = playerSpeed * -0.5;                                                                     
  }
  println(playerSpeed);

  playerY = playerY + playerSpeed;                                                                        // Player's speed effects the player's position
}
