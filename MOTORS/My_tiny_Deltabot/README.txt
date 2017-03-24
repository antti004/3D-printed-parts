                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:1881820
My tiny Deltabot by tecdroid is licensed under the Creative Commons - Attribution license.
http://creativecommons.org/licenses/by/3.0/

# Summary

I made this to solve a little problem that may be caused by JML31347's triangular joint design. Calculation of Point may be hard to do that way.

Here's how often you have to print the parts
gelenk(); // 6 x
aktuatorgelenk(); // 6 x
oberarm(); // 3 x
unterarm(); // 6 x
by28_mount(); // 3 x
actor(); // 1 x

Should be calculatable with standard deltabot algorithms..

Some additional information on what you need:
*  The robot uses three 28byj-48 stepper motors which aren't that fast but small.
*  you will need a hand full of M5x20 screws and stop nuts to mount the "gelenk" parts.
* additionally, you need 6 4x20mm rods to mount the center arm part to the "gelenk"-parts. 

Yesterday, i built the first arm and wasn't amazed by the little angle it moved, so I will rework this a little. I also decided to use only one gelenk part instead of two different. This should make it more easy to build.