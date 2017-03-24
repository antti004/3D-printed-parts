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


http://www.thingiverse.com/thing:1674077
Lego-like motor mount for 28BYJ-48 Stepper Motor (improved) by rainerunsinn is licensed under the Creative Commons - Attribution license.
http://creativecommons.org/licenses/by/3.0/

# Summary

UPADTE 3.1: Moved motor block by .15mm to avoid friction and in-air-printing.

I very much liked https://www.thingiverse.com/thing:151616, but found the possibilities to connect it to LEGO(c) technic too limited.

"*_view" file is for display only.

Prints with a hub adaptor.

You can modify the OpenSCAD file to make it longer (or shorter) in quantites of LEGO block size, and to move the motor back or forth. Sorry, parts of it are written in German...

I also included thing:5699 a little bit changed for better printing and thing:122070  for convinience.

# Print Settings

Printer Brand: RepRap
Printer: Chinese
Rafts: No
Supports: Yes
Resolution: 0.2
Infill: 50%

Notes: 
I used 190°C Hotend and 60°C (50°C after first layer) settings

# Post-Printing

Remove all supports! This is tedious work as they are so small. On my printer I need them to get the precision I need for LEGO(c) to fit.

Fixation of the stepper motor: I used **two 9.5 x 3.5 mm cylinder-head self-tapping screws**. Larger screws (4mm, 3.9 resp.) that I had tried before had too large a head to fit next to the motor's body.

To control the steppers with an Arduino there is a small program available at [GitHub](https://github.com/snowdd1/multistepper)

# How I Designed This

I started with [MarkBenson's](http://www.thingiverse.com/MarkBenson) "Lego compatible motor mount", but after printing one, my son and me had troubles properly mounting it to LEGO technic beams for our robot (in spe). So I reverse-engineered the part apart and added more plastic to the sides and top, and moved the motor to be aligned with the LEGO style axle mounts. I also changed the motor mounting direction - now the motor is inserted from behind to have more space for axle fixation points on the front.

I wanted to make this customizable but failed. In thingiverse customizer it very much looked crappy.