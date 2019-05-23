# UIScreenShot-Testing

1.   First take the screen shot and store into file, then run the testcases.
2.   Make sure that give correct file name which you want to read from file.
3.   There is a method compare which takes tolerance and two image data and check whether two
     images are equal or not.
4.   Make Sure if you are setting tolerance == 0.0 , means images should exactly be equal.
     See on the top, time should also be same.
     if you don't want full screen shot then you can define frame for which you want to take screen shot.
5.   tolerance == 0.1  means if two images are not matching 10% then also It will say both images are equal. 
