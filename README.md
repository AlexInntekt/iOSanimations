# iOSanimations
Following the tutorial from Raywenderlich


The content of the first chapter that has no autolayout environment, is supposed to be emulated for iPhone8.


# My notes
- you can create amazing animations using the layers and views if you use autorezising insead of autolayout:        
   -you can keep the storyboard with autolayout turned on    
   -clean all constraints of the view you want apply animations to and center/place it using autoresizing         
   -apply animations by changing the properties of the view or its layer      
   
- in case using constraints/autolayout control on the specific view, you can animate changes only by using other tools, like CGAffineTransform (the best I saw so far).
