# UIScreenShot-Testing
   Here Initially we will take the ScreenShot and store into the file and then at any time again we can take
   the ScreenShot and compare to know is there any changes happened
    
## Getting Started
   To run the project, clone the repo, and simply run.

## Running The Tests
     Go to the EatinProgramUITests.swift file
   1.   First take the screen shot and store into file by giving filename , So you can run following methods-
        testWriteSelectedBurger()    and    testWriteSelectedBurgerDetailPage()
        These above methods are taking screenshot and storing into file.
   2.   Make sure that give correct file name which you want to read from file.
        Now you can run the following testcases -
        testReadSelectedBurger() and testReadSelectedBurgerDetailPage()
   3.   The above testCases are taking one screenShot currently and one which you have stored into file
        and then simply comparing whether both are equal or not.

### Comparing Two images
        There is a compare method written in EatinProgramUITests.swift which takes tolerance and 
        two image data and checks whether two images are equal or not.
        
  #### Steps:-
   1. Convert from data into images .
   2. Convert into cgImages because we need bimaps .
   3. Find out expected number of pixels .
   4. It allocates memory for the specified number of pixels for type unsigned 32-bit integer .
   5. Then compares pixel by pixel and based on the tolerance it returns true or false 
      indicating whether images are equal or not.
        
   Make Sure if you are setting tolerance == 0.0 , means images should exactly be equal.
   See on the top, time should also be same.
   if you don't want full screen shot then you can define frame for which you want to take screen shot.
   tolerance == 0.1  means if two images are not matching 10% then also It will say both images are equal. 
   
## Author
   **Amar Prakash Mishra** - *Initial work* - [UIScreenShot-Testing](https://github.com/iertamar/UIScreenShot-Testing)
   Created by Amar Prakash Mishra, @iertamar on 23/05/19.
   
## Contact
  Share feedback if you feel anything needs to be improved, I would be happy to hear.
   
   
