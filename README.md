## akinfenwa

akinfenwa FINALLY made it out the championship, will he ball out in the premier league? come and find out.

basically you run around grabbing footballs. every ball you touch is a premier league goal. thats the whole game.

## how to run it

two ways. godot editor or the html export.

### godot

you need godot 4.7. open the project manager, hit import, pick this folder (the project.godot file), then play. thats it.

### browser

you cant just double click akinfenwa.html and expect it to work. browsers block that. serve the folder then open it.

from this folder in powershell:

```
python -m http.server 8080
```

then go to http://localhost:8080/akinfenwa.html

if you dont have python, any local static server on this folder works. same idea.

## controls

- a = left
- d = right
- space = jump

walk into a ball and the "premier league goals" counter in the top right ticks up. fall off the map and you respawn at the start.
