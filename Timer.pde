/**************************************************************
* File: a3.pde
* Group: Tegan Lee Barnes, Alison Bryce, Josh Le Gresley; 14.
* Date: 4/04/2018
* Course: COSC101 - Software Development Studio 1
**************************************************************/

/*
Timer class is used to track asteroid object creation, and the random time intervals
the UFO comes to attack.
*/ 
class Timer
{
  int startMS,    // variable to store start time
      msElapsed;  // variable to store elapsed time
  
  /*
  Method to recod starting point
  */
  void startTimer()
  {
    startMS = millis();
  }
  /*
  Method to calculate and return the elapsed time
  @return: The elapsed time in seconds
  */
  int endTimer()
  {
    return msElapsed = (millis() - startMS)/1000;
  }
}
