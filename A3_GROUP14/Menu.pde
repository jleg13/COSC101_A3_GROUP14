/**************************************************************
* File: a3.pde
* Group: Tegan Lee Barnes, Alison Bryce, Josh Le Gresley; 14.
* Date: 4/04/2018
* Course: COSC101 - Software Development Studio 1
**************************************************************/

/*
 TODO: - Implement a moving star field background or similar for main menu 
       - add specified clickable area and box to each selection options
       - menu options might include:
                   
                   - difficulty: easy, intermidiate, difficult
                   - game highscores
                   - choose type of ship
                   - exit
                   
The Menu class creates the portal to access the game at specified difficulty levels.
Also provides the option to view highscores and an exit button.
*/
class Menu
{
  String messege,                    // messege of main instructions
         menuLevels;                 // messege to set difficulty
 
  /*
  Menu Constructor
  */
  Menu()
  {
  
  }
  
  /*
  implement menu background ie a moving star field effect
  */
  void menuBackground()
  {
   
  }
  
  void menuText()
  {
    messege = "Choose level \nto start game";
    // print messege and time to screen.
    text(messege, width/4.5, height/2);
    menuLevels = "Easy";
    text(menuLevels,  width/2.5, height/2+200);
  }
}
