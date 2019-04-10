/**************************************************************
* File: A3_GROUP14.pde
* Group: 14; {Tegan Lee Barnes, Alison Bryce, Josh Le Gresley}.
* Date: 4/04/2018
* Course: COSC101 - Software Development Studio 1
*
* Description: 
Astroids is a classic multidirection shooter archade game. The player controls 
a space ship in an asteroid field, the aim being to survive as long as possible 
whilst shooting the asteroids to increase their score. UFO's will also attack 
the players space ship at random intervals.The game becomes harder as the number 
of asteroids and their velocity increases.
*
* Usage: 
To compile and run the .pde file, download the Processing editor from the 
processing website: https://processing.org/download/. The proceesing editor will 
compilethe processing language to Java and run the program.
*
* Notes: 
All audio samples sourced from https://freesound.org.
Font is sourced from https://www.fontspace.com.
Any Code Sampled from online sources is commented in method or class headings.
**************************************************************/

//imoprt a java audio library
import ddf.minim.*;

/*
TODO: IMPLEMENT COLLISION DETECTION:
              
              - collision between asteroids (bounce off each other)
              - collision between space ship and asteroids
              - collision between shot from space ship and asteroid
              - collision between UFO and space ship
              - collision betweenshot from space ship and UFO 
              
       IMPLEMENT
            - game reset functionality
            

AsteroidGame class accesses the clases required to build up the Asteroids
game implementation. User input events are monitored and passed to the relevent
classes requiring this information. Sound files are called at input events. Game 
play status is moitored with boolean flags and game flow is directed in the 
relevent direction. Collision detection is monitored.
*/

class AsteroidGame
{
  Asteroid oneAsteroid;              // declare Asteroid object
  SpaceShip mySpaceShip;             // declare SpaceShip object
  Menu myMenu;                       // declare Menu object
  UFO myUFO;                         // declare UFO object
  HighScores myHighScores;           // declare highscores object
  
  PFont font;                        // declare a Pfont object
  
  boolean gameOver = false,          // boolean status flag to control end game status 
          startGame = false,         // boolean status flag to control start game status 
          startAsteroids = false;    // boolean status flag to control the start of the asteroids
          
  ArrayList<Asteroid> myAsteroids = 
          new ArrayList<Asteroid>(); // declare Asteroid object ArrayList
          
  boolean[] keyIsPressed;            // boolean array to store a boolean corrosponding to keypress event.
  PVector[] starsBackground;         // PVector array to store locations of stars for moving background.
  float[] starSpeed;                 // float array to set the speed of the star
          
  String start;                      // Sting to store the game start messege
        
  int score,                         // number of asteroids destroyed.
      totalAsteroids,                // total number of asteroid objects to create.
      startTime,                     // stores the millisecond starting point of timer
      totalTime,                     // time accumulator
      timeGap;                       // sets an asteroid every 5 secs

  /*
  AsteroidGame Constructor initialises objects, variables and loads images.
  */ 
  AsteroidGame()
  {
    // Instantiate objects
    mySpaceShip = new SpaceShip();
    myMenu = new Menu();
    myHighScores = new HighScores();
    
    // load font
    font = createFont("Pixel-Miners.otf", 32);
    
    // create a boolean array to monitor which keys are pressed. 256 corrosponds to the
    // number of ASCII characters
    keyIsPressed = new boolean[256];
    
    // create a PVector array to store locations of stars in game background
    starsBackground = new PVector[100];
    // create a float array with corrosponding speed values for each star
    starSpeed = new float[100] ;
    
    // use a for loop to construct the stars Background and starsSpeed arrays
    for(int i = 0; i < starsBackground.length; i++)
    {
      starsBackground[i] = new PVector(random(0, width), random(0, height));
      starSpeed[i] = random(1, 5);
    }
    
    // set integer variables
    score = 0;                    
    totalAsteroids = 10;   
    startTime = 0;
    totalTime = 0;            
    timeGap = 500; 
    
    //set font settings
    fill(#FEFFBF);
    textFont(font);
    textSize(50);
  }
  
  /*
  Method to set up game screen.
  */
  void layout()
  {
    background(0);
    stroke(255);
    // set to start on main menu
    if(!startGame)
    {
      myMenu.menuBackground();
      myMenu.menuText();
    }
    // enter game 
    else
    {
      //Draw moving background
      for(int i = 0; i < starsBackground.length; i++)
      {
        if(starsBackground[i].x < 0)
        {
          starsBackground[i].x = width;
        }
        starsBackground[i].sub(new PVector(starSpeed[i] / 2, 0));
        strokeWeight(starSpeed[i]);
        point(starsBackground[i].x, starsBackground[i].y);
      }
      
      // game holds off asteroids till player is ready and clicks any button
      if(!startAsteroids)
      {
        start = "Press any key\n to start game";
        // print messege and time to screen.      
        text(start, width/4.5, height/2);
      }
    } 
  }
   
   /*
  Method to add Asteroid objects to the Asteroid object array list.
  */
  void addAsteroid()
  {
    if(startAsteroids)
    {
      // at start of game first asteroid gets created
      if(myAsteroids.size() < 1)
      {
         myAsteroids.add(oneAsteroid = new Asteroid());
         startTime = millis();
      }
      // after the first the objects are created by the timeGap interval
      else
      {
        int split = (millis() - startTime)/1000;
        totalTime += split;
        if(myAsteroids.size() < totalAsteroids && totalTime > timeGap)
        {
          myAsteroids.add(oneAsteroid = new Asteroid());
          totalTime = 0;
          startTime = millis();
        }
      }
    }
  }
  
  /*
  Method to update each Asteroid object in the Array list. 
  */
  void updateAsteroids()
  {
    if(startAsteroids)
    // iterate through arraylist of current Asteroids
    for(int i = 0; i < myAsteroids.size(); i++)
    {
      // condition to check if asteroid is not hit
      if(!myAsteroids.get(i).hit)
      {
        // access each Asteroid objects methods to control movement
        myAsteroids.get(i).moveAsteroid();
        myAsteroids.get(i).edgeDetect();
        // add an image to the current location
        myAsteroids.get(i).displayAsteroid();
      }
    } 
  }

  /*
  Method to update SpaceShip object
  */
  void updateSpaceShip()
  {
    if(startAsteroids)
    {
      mySpaceShip.moveShip();
      mySpaceShip.shipEdgeDetect();
      mySpaceShip.controlShip(keyIsPressed);
      mySpaceShip.displayShip();
      mySpaceShip.addShot(keyIsPressed);
      mySpaceShip.updateShot();
    }
  }  
  
  /*
  Method called from the built-in keyPressed() method. This method works along side the
  keyRelease() method below to handle key press and key release events. The concept used
  was sourced from code on https://forum.processing.org. It was including because it
  provides a concise way to store all key input events (press or release) in an array.
  They can then be passed to classes that require access to them. The array keyIsPressed
  can hold 256 boolean values, corrosponding to each ASCII value. The values are set to
  true on key press events and false on key release events.
  */
  void keyPress() 
  {
    keyIsPressed[keyCode] = true;
  }
  
  /*
  Method called from the built-in keyReleased() method. See keyPress method (above)
  for description of functionality.
  */
  void keyRelease() 
  {
    keyIsPressed[keyCode] = false;
  }
}


// Declare AsteroidGame and AsteroidGameAudio objects
AsteroidGame myAsteroidGame;
AsteroidGameAudio myAudio;

/*
Setup initialises the AsteroidGame and AsteroidGameAudio classes. Also Sets screen size.
*/
void setup()
{
  // set screen size
  size(800, 800);
  
  // Initialise objects
  myAsteroidGame = new AsteroidGame();
  myAudio = new AsteroidGameAudio(this);
}

/*
The draw loop controls the calls for Asteroid game play
*/
void draw()
{
  myAsteroidGame.layout();
  myAsteroidGame.addAsteroid();
  myAsteroidGame.updateAsteroids();
  //myAsteroidGame.updateSpaceShip();
}


/*
Built in function KeyPressed() initially has no functionality, until the player mouse
clicks to select play game. This action sets the startGame flag to true and sets the
game screen to 'ready to play'. Now the game waits for the player to input any click to
commence play (which starts the asteroids). Once in 'game play' mode any clicks invoke
the keyPress() method which updates the keyIsPressed boolean array.
*/  
void keyPressed()
{
  if(myAsteroidGame.startGame)
  {
    if(!myAsteroidGame.startAsteroids)
    {
      myAsteroidGame.startAsteroids = true;
    }
    else
    {
      myAsteroidGame.keyPress();
    }
  }
}

/*
  Initially mousedPressed() is the players only way to interact with the game. Options
  on the main menu can be selected by clicking on the selectable areas. As options are
  selected the boolean flags are updated to relevant position in the menu.
*/
void mousePressed()
{
  if(!myAsteroidGame.startGame)
  {
    myAsteroidGame.startGame = true;
  }
}

/*
Like keyPressed(), keyReleased() has no functionality until 'play game' mode. Once at 
this point any clicks invoke the keyRelease() method which updates the keyIsPressed 
boolean array.
*/
void keyReleased() 
{
  if(myAsteroidGame.startAsteroids)
  {
    myAsteroidGame.keyRelease();
  }
}
