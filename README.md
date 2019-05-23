# UIScreenShot-Testing

     GO TO THE EatinProgramUITests.swift  file

1.   First take the screen shot and store into file by giving filename , So you can run following methods-
     testWriteSelectedBurger()    and    testWriteSelectedBurgerDetailPage()
     These above methods are taking screenshot and storing into file.
2.   Make sure that give correct file name which you want to read from file.
     Now you can run the following testcases -
     testReadSelectedBurger()   and   testReadSelectedBurgerDetailPage()
3.   There is a compare method written in EatinProgramUITests.swift which takes tolerance and 
     two image data and checks whether two images are equal or not.
4.   Make Sure if you are setting tolerance == 0.0 , means images should exactly be equal.
     See on the top, time should also be same.
     if you don't want full screen shot then you can define frame for which you want to take screen shot.
5.   tolerance == 0.1  means if two images are not matching 10% then also It will say both images are equal. 
