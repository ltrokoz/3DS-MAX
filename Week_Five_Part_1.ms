--To delete all objects on the scene
delete objects

--To create box
b1 = Box()

b1.length=5
b1.width=5
b1.height=5

--Another method to create a Box:
b = box length:10 width:10 height:10 wirecolor:red


-- Translation:
--The difference between move and pos is that pos will set the position of the object 
-- in global coordinate system, where as move will displace the object 
-- corresponding to its previous position
b1.pos = [0, 0, 20]
move b1 [5, 5, 5]

--Rotation
--Rotate the smaller box about Y 30 degrees
rb1 = eulerAngles 0 30 0
rotate b1 rb1

--Rotate the red box about Z 45 degrees
rb = eulerAngles 0 0 45
rotate b rb

--Scaling
scale b [2, 2, 2]

--Set the parent for b
b1.parent = b

--Branching:
x = 3

if x == 3 then
(
	print("If block succeedes")
)
else
(
	print("Else block succeedes")
)

--Loop
for i = 1 to 5 do
(
	newbox = Box()
	newbox.length=5
    newbox.width=5
    newbox.height=5

	move newbox [0, 0, 8*i]
)

--Defining Functions
function funny arg1 arg2 val:0 =
(
	result = undefined
	if val == 0
		then result = arg1 + arg2
	else if val > 0
		then result = arg1 - arg2
	else messagebox("Negative Values Not Acceptable")
	
)


delete objects

--Start defining a funny function
--This example is taken from AutoDesk tutorials

function tree currentHeight maxHeight parentbox:undefined=
(
	for i = currentHeight to maxHeight do
	(
		newbox = Box()
		if parentbox != undefined then
		(
			newbox.parent = parentbox
			in coordsys parent newbox.pos = [0, 0, 30]
				rotX = random -10.0 10.0
				rotY = random -10.0 10.0
				rotZ = random -10.0 10.0
				about newbox.parent rotate newbox(eulerangles rotX rotY rotZ)
		)
		parentbox = newbox
	)
)
	













