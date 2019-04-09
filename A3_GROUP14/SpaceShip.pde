/**************************************************************
* File: a3.pde
* Group: Tegan Lee Barnes, Alison Bryce, Josh Le Gresley; 14.
* Date: 4/04/2018
* Course: COSC101 - Software Development Studio 1
**************************************************************/

/*
TODO: - COMPLETE IMPLEMENTATION OF SHIP
          IMPLEMENT 
            - A timed interval for shots to be fired if holding down spacebar
            - destroy shots from Array list if off screen


The space ship class creates a PShape for the ship and moves the ship according to keyboard input.
In this class the framework for the code is adapted and modified from sample code sourced on 
https://forum.processing.org as well as guidance from Daniel Shiffman's Coding Challenge #46 Tutorial.
*/

class SpaceShip
{
  Shot oneShot;                  // declares a Shot object
  
  PVector shipLocation,          // declare PVector object for ship's location
          shipVelocity;          // declare PVector object for ship's velocity
     
  PShape drawShip;               // declare PShape object
  
  boolean shotFired;             // boolean flag to state if a shot has been fired on not
          
  ArrayList<Shot> myShots = 
          new ArrayList<Shot>(); // declare Shots object ArrayList
          
  int delay;                     // sets a delay of asteroids exiting and reentering the screen
 
  /*
  SpaceShip constructor 
  */
  SpaceShip()
  {
    // create PVectors for ship movement
    shipLocation = new PVector(width/2, height/2);
    shipVelocity = new PVector();
 
    // create PShape object
    noFill();
    drawShip = createShape(TRIANGLE, -20, -20, 20, 0, -20, 20);
    drawShip.setStroke(#24DE14);
    
    //set status flags
    shotFired = false;
    
    // sets deley of objects entering/exiting the screen
    delay = 30;
  }
  
  /*
  Method to update the movement of the ship
  */
  void moveShip()
  {
   
  }
  
   /*
  This method monitors the ships location and wraps the object to re 
  enter the opposite side of screen of the screen.
  */
  void shipEdgeDetect()
  {
    if(shipLocation.x < - delay )
    {
      shipLocation.x = width + delay;
    }
    else if (shipLocation.x > width + delay)
    {
      shipLocation.x = 0 - delay;
    }
    if(shipLocation.y < - delay)
    {
      shipLocation.y = height + delay;
    }
    else if (shipLocation.y > height + delay)
    {
      shipLocation.y = 0 - delay;
    }
  }
  
  /*
  Method to control the ships motion according to key events
  @PARAMS: boolean array
  */
  void controlShip(boolean[] keypress)
  {
    if(keypress[LEFT])
    {
    }
    if(keypress[RIGHT])
    {
    }
    if(keypress[UP]) 
    {
    }
    if(keypress[DOWN])   
    {
    }
  }
  
   /*
  Method to draw the PShape object to the screen
  */
  void displayShip()
  {
    
  } 
  
  /*
  Method to add a Shot object to the Shot array list on a mouse click event.
  @PARAMS keypress: boolean array
  */
  void addShot(boolean[] keypress)
  {
    if (keypress[' '])
    {
      
    }
  }
  
   /*
  Method to update the motion of each shot in the myShots array list
  */
  void updateShot()
  {
    if(shotFired)
    {
      for(int i = 0; i < myShots.size(); i++)
      {
       
      }
    }
  }
}
