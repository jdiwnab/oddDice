# OddDice
Most dice we know are in the form of Platonic Solids: the 6 sided cube, the 4 sided tetrahetron, the 20 sided icosohedron, etc.
Other dice follow the pattern of a 'dipymamid', a series of points around an equator, with points on either end. This can create most dice of even sides, at least as long as you can distinguish the sides
But what about odd numbered dice? How often have we wanted dice with a weird number of sides? 5 players to choose from, 7 directions, whatever. Re-rolling on a 6 is lame.

This project tries to create a fair die with an odd number of sides using a different method. Rather than trying to find a polyhedron with a specific number of sides, we fashion a shape with the required number of sides, and make it so it won't land on areas that are not appropriate sides.
To accomplish this, we take a sphere, select the required number of points spaced as evenly as possible, then slice a flat on that side of the sphere, with the number directly opposite.

This project has three parts:
1. diceFinder.html - a webpage that attempts to find the correct point locations using a repulsion algorithm based on the Thompson problem
2. diceTemplate.scad - a OpenSCAD program that accepts the point locations and creates the dice model
3. dX.stl - STLs of the dice generated by diceTemplate, of the specific number of faces

[Link to DiceFinder](https://jdiwnab.github.io/oddDice/diceFinder.html)
![image](https://user-images.githubusercontent.com/9559695/114254805-b4507480-997f-11eb-96f9-de52ef4e8151.png)
