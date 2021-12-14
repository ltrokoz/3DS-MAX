delete objects

-- Ctrl + E          run script

/*
b1 = Box()
b2 = Box()
move b2 [0, 0, 30]
b2.parent = b1
*/

-- parentbox = undefined

function tree currentHeight maxHeight parentbox:undefined branchingChance:0.15 =
(
	
	firstbox = undefined
	
	for i = currentHeight to maxHeight do
	(
		newbox = Box()
		
		if firstbox == undefined then
		(
			firstbox = newbox
		)
		
		-- move newbox [0, 0, 30 * i]
		
		if parentbox != undefined then
		(		
			newbox.parent = parentbox
			
			in coordsys parent newbox.scale = [0.95, 0.95, 0.95]

			in coordsys parent newbox.pos = [0, 0, 30]
				
			rotX = random -10.0 10.0
			rotY = random -10.0 10.0
			rotZ = random -10.0 10.0
			about newbox.parent rotate newbox (eulerAngles rotX rotY rotZ)
			
			branchRoll = random 0.0 1.0
			if branchRoll <= branchingChance then
			(
				--Create a branch
				branchbox = tree i maxHeight parentbox:newbox
				
				rotbranchX = random -45.0 45.0
				rotbranchY = random -45.0 45.0
				rotbranchZ = random -180.0 180.0
				about newbox rotate branchbox (eulerAngles rotbranchX rotbranchY rotbranchZ)
			)
		)
		
		parentbox = newbox
	)
	
	firstbox
)

function animateTree treeBox currentFrame:0 frameIncrement:3 =
(
	for i = 1 to treeBox.children.count do
	(
		nextFrame = currentFrame + frameIncrement
		animateTree treeBox.children[1] currentFrame:nextFrame
	)
	
	currentScale = treeBox.scale
	
	with animate on
	(
		at time 0 treeBox.scale = [0, 0, 0]
			
		at time currentFrame treeBox.scale = currentScale
	)
		
)

myTree = tree 0 25 branchingChance:0.25
animateTree myTree