/**************************************************************
* File: a3.pde
* Group: Tegan Lee Barnes, Alison Bryce, Josh Le Gresley; 14.
* Date: 4/04/2018
* Course: COSC101 - Software Development Studio 1
**************************************************************/

/*
TODO:
      - source relevent sound files
      - link to click envent

AsteroidGameAudio class handles loading sound files and gives access to play
and/or loop sounds dependent on requirements.
*/
class AsteroidGameAudio
{
  Minim minim;                // Minim object to load sound file
  
  AudioPlayer hit;            //Audioplayer object for hit 
  
  /*
  Constructor takes in PApplet argument to get minim class to load 
  files within this class. Code sourced from https://forum.processing.org
  */            
  AsteroidGameAudio(PApplet p)
  {
    //SOUND:
    // new minim class instance
    minim = new Minim(p);
    
    //load sound
    //ie hit = minim.loadFile("hit.wav");
  }
  
  /*
  Method to play hit sound
  */
  void playHit()
  {
    //hit.rewind();
    //hit.play();
  }
}
