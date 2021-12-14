-- Review:

delete objects
--To create a box:
-- Note: Using 'enter' on your keyboard 
p = Box()  --Note: Once created, it will be called Box001 in "Scene Explorer". However, in our code, we refer it as 'p'
c = Box()

-- Now, we can move, rotate and scale objects:
scale c [0.5, 0.5, 0.5]
move c [0, 0, 40]

--We can refer the objects by the name that appears on the scene explorer
-- In this case, we have to use $ sign before the name.
move $Box001 [40, 0, 0]

-- or, equivalently, refering them by the object name in the script:
move p [0, 40, 0]

-- Adding modifiers to objects
addModifier p (twist angle:30) /*Or, equivalently: */ addModifier $Box001 (twist angle:-30)

--Selecting the objects using script

select $Box001 /* Or, equivalently: */ select c

--if you want to select many objects at the same time
--use an array instead

--Selecting multiple objects on the scene
select #($Box001, $Box002)

--$ refers to the last selected object: 
$.pos=[0, 10, 10]


--We can use regular expression when selecting objects:
select $Box* --Selects all boxes on the scene
select $* --Selects all objects in the scene

--You can also use object sets. It is some predefined categories,
--that is handy to have when you want to edit all of the same type
/*
objects  --all the objects
geometry  --the standard 3ds Max categories...
lights
cameras
helpers
shapes
systems
spacewarps
selection  --the current selection
*/
select objects --selects all objects
select cameras --selects all cameras

--Applying the same rule, we can perform different operations on selcted objects:
delete $* -- To delete all Objects
delete $Box* -- To delete all boxes on the scene

----------------------------------------------------------------------------------Dealing with cameras----------------------------------------------------------------
--Creating a target camera
cam_one = Targetcamera target:(Targetobject transform:(matrix3 [1,0,0] [0,1,0] [0,0,1] [7.32262,3.89145,0]))

--Or, more complete:
--myCam = Targetcamera fov:45 nearclip:1 farclip:1000 nearrange:0 farrange:1000 mpassEnabled:off mpassRenderPerPass:off pos:[66.374,-31.9284,0] isSelected:on target:(Targetobject transform:(matrix3 [1,0,0] [0,1,0] [0,0,1] [7.32262,3.89145,0]))
	
	
move cam_one [30, 30, 0] 
	
rotate cam_one (eulerAngles 90 0 0)
cam_one.pos=[50, 50, 10]

select cam_one.Target
cam_one.Target.pos=[0, 0, 0]  --Or, equivalently:   $.pos= [20,20,20]
--Or, we can use, move $ [30, 30, 0] /*Since the $ always refers to the last selected element*/


--To set the viewport to a camera
viewport.setCamera cam_one

-- To reset the viewport to the default viewport
viewport.ResetAllViews()

--To set the vireport to the top view
viewport.setType #view_top

-- The following link contains the full documentation of viewports:
--http://docs.autodesk.com/3DSMAX/16/ENU/MAXScript-Help/index.html?url=files/GUID-8AA71F9E-F4F0-4437-A44E-9683619E89DE.htm,topicNumber=d30e694468

	
	
---------------------------------------------------------------------------------------Creating animation-------------------------------------------------------------------------
c = Box()
--We set the keyframes for the selected object by using at time command

animate on
(
  at time 0f (c.pos = [-100, 0, 0]; c.scale = [1, 1, 0.25])
  at time 100f (c.pos = [100, 0, 0]; c.scale = [1, 1, 3])
)


-- Animating Camera	
select cam_one
animate on
(	
		at time 5f $.pos=[10, 10, 30]
)

--Now, let's go through a comprehensive example
--Make sure to change your time configuration and increase it to 360 frames
delete objects
cam_one = Targetcamera target:(Targetobject transform:(matrix3 [1,0,0] [0,1,0] [0,0,1] [7.32262,3.89145,0]))
animate on	
(
	for i = 1 to 360 do
	(
		x=50 * cos(i)
		y=50* sin(i)
		at time i cam_one.pos=[x, y, 50]
	)

	b = Box()

	at time 0 b.pos = [-100, 0, 0]
	at time 360 b.pos = [100, 0, 0]
)

--To delete the created keys
deletekeys cam_one #allKeys
--Or, in general:
deleteKeys objects #allKeys


---------------------------------------------------------------------------------------------------Dealing with lights---------------------------------------------------------------------------------------

Target_Light pos:[-19.1468,45.2361,0] isSelected:on target:(Targetobject transform:(matrix3 [1,0,0] [0,1,0] [0,0,1] [-5.32485,12.3084,0]))
	
$.rgbFilter = color 0 235 17
	
--Selecting and Removing Lights
select lights
delete $


	
--Exercise: Create the solar system simulation that you were assigned last week.
	
-- An example of how to move all objects on the scene
/*
obj=$box01
avg_pos=[0,0,0]
offset_pos=[100,100,0]
-- new for loop index variable obj created even though
-- a variable named obj already exists, scope is for loop
for obj in $* do
(
-- new variable pos created, scope is for
-- loop offset_pos already exists outside
-- for loop, its value will be used
pos=obj.pos-offset_pos
-- avg_pos already exists outside for loop,
-- its value will be used for loop index since variable
-- obj goes out of scope
avg_pos += pos
)
avg_pos /= $*.count
*/

