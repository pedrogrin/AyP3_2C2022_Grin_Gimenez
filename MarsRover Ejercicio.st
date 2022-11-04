!classDefinition: #TestMarsRover category: 'MarsRover Ejercicio'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!TestMarsRover methodsFor: 'general' stamp: 'pg 10/31/2022 23:20:30'!
test01EmptyCommandDoesntModifyLocationAndDirection
	
	self assertThat: (self marsRoverPointingNorth) afterExecuting: '' isAt: 0@0 pointing: (North new).! !

!TestMarsRover methodsFor: 'general' stamp: 'pg 11/3/2022 20:58:18'!
test18MarsRoverCanExecuteMultipleCommands
	
	self assertThat: (self marsRoverPointingNorth) afterExecuting: 'fff' isAt: 0@3 pointing: (North new).! !

!TestMarsRover methodsFor: 'general' stamp: 'pg 11/3/2022 20:57:08'!
test19NonExistCommandRaiseError
	
	| marsRover |
	
	marsRover := self marsRoverPointingEast.
	
	self 
		should: [marsRover executeFollowingTheCommands: ' '.]
		raise: Error
		withExceptionDo: [ :anError | self assert: Commands commandDoesntExistErrorMessage equals: anError messageText ]! !


!TestMarsRover methodsFor: 'north' stamp: 'pg 11/2/2022 17:22:47'!
test02MarsRoverPointingNorthCanGoForward
	
	self assertThat: (self marsRoverPointingNorth) afterExecuting: 'f' isAt: 0@1 pointing: (North new).! !

!TestMarsRover methodsFor: 'north' stamp: 'pg 10/31/2022 23:32:18'!
test03MarsRoverPointingNorthCanGoBackwards
	
	self assertThat: (self marsRoverPointingNorth) afterExecuting: 'b' isAt: (0@-1) pointing: (North new).! !

!TestMarsRover methodsFor: 'north' stamp: 'pg 10/31/2022 23:32:30'!
test04MarsRoverPointingNorthCanRotateLeft
	
	self assertThat: (self marsRoverPointingNorth) afterExecuting: 'l' isAt: 0@0 pointing: (West new).! !

!TestMarsRover methodsFor: 'north' stamp: 'pg 10/31/2022 23:32:42'!
test05MarsRoverPointingNorthCanRotateRight
	
	self assertThat: (self marsRoverPointingNorth) afterExecuting: 'r' isAt: 0@0 pointing: (East new).! !


!TestMarsRover methodsFor: 'west' stamp: 'pg 11/2/2022 17:22:57'!
test10MarsRoverPointingWestCanGoForward
	
	self assertThat: (self marsRoverPointingWest) afterExecuting: 'f' isAt: -1@0 pointing: (West new).! !

!TestMarsRover methodsFor: 'west' stamp: 'pg 10/31/2022 23:33:18'!
test11MarsRoverPointingWestCanGoBackwards
	
	self assertThat: (self marsRoverPointingWest) afterExecuting: 'b' isAt: 1@0 pointing: (West new).! !

!TestMarsRover methodsFor: 'west' stamp: 'pg 10/31/2022 23:33:30'!
test12MarsRoverPointingWestCanRotateLeft
	
	self assertThat: (self marsRoverPointingWest) afterExecuting: 'l' isAt: 0@0 pointing: (South new).! !

!TestMarsRover methodsFor: 'west' stamp: 'pg 10/31/2022 23:33:40'!
test13MarsRoverPointingWestCanRotateRIght
	
	self assertThat: (self marsRoverPointingWest) afterExecuting: 'r' isAt: 0@0 pointing: (North new).! !


!TestMarsRover methodsFor: 'east' stamp: 'pg 11/2/2022 17:23:03'!
test14MarsRoverPointingEastCanGoForward
	
	self assertThat: (self marsRoverPointingEast) afterExecuting: 'f' isAt: 1@0 pointing: (East new).! !

!TestMarsRover methodsFor: 'east' stamp: 'pg 10/31/2022 23:34:29'!
test15MarsRoverPointingEastCanGoBackwards
	
	self assertThat: (self marsRoverPointingEast) afterExecuting: 'b' isAt: -1@0 pointing: (East new).! !

!TestMarsRover methodsFor: 'east' stamp: 'pg 10/31/2022 23:34:39'!
test16MarsRoverPointingEastCanRotateLeft
	
	self assertThat: (self marsRoverPointingEast) afterExecuting: 'l' isAt: 0@0 pointing: (North new).! !

!TestMarsRover methodsFor: 'east' stamp: 'pg 10/31/2022 23:34:52'!
test17MarsRoverPointingEastCanRotateRight
	
	self assertThat: (self marsRoverPointingEast) afterExecuting: 'r' isAt: 0@0 pointing: (South new).! !


!TestMarsRover methodsFor: 'south' stamp: 'pg 11/2/2022 17:23:08'!
test06MarsRoverPointingSouthCanGoForward
	
	self assertThat: (self marsRoverPointingSouth) afterExecuting: 'f' isAt: 0@-1 pointing: (South new).! !

!TestMarsRover methodsFor: 'south' stamp: 'pg 10/31/2022 23:35:31'!
test07MarsRoverPointingSouthCanGoBackwards
	
	self assertThat: (self marsRoverPointingSouth) afterExecuting: 'b' isAt: 0@1 pointing: (South new).! !

!TestMarsRover methodsFor: 'south' stamp: 'pg 10/31/2022 23:35:44'!
test08MarsRoverPointingSouthCanRotateLeft
	
	self assertThat: (self marsRoverPointingSouth) afterExecuting: 'l' isAt: 0@0 pointing: (East new).! !

!TestMarsRover methodsFor: 'south' stamp: 'pg 10/31/2022 23:35:57'!
test09MarsRoverPointingSouthCanRotateRight
	
	self assertThat: (self marsRoverPointingSouth) afterExecuting: 'r' isAt: 0@0 pointing: (West new).! !


!TestMarsRover methodsFor: 'setUp/tearDown' stamp: 'pg 10/31/2022 23:43:47'!
marsRoverPointingEast

	^MarsRover landPointingTo: East new.! !

!TestMarsRover methodsFor: 'setUp/tearDown' stamp: 'pg 10/31/2022 23:44:00'!
marsRoverPointingNorth

	^MarsRover landPointingTo: North new.! !

!TestMarsRover methodsFor: 'setUp/tearDown' stamp: 'pg 10/31/2022 23:44:08'!
marsRoverPointingSouth

	^MarsRover landPointingTo: South new.! !

!TestMarsRover methodsFor: 'setUp/tearDown' stamp: 'pg 10/31/2022 23:44:13'!
marsRoverPointingWest

	^MarsRover landPointingTo: West new.! !


!TestMarsRover methodsFor: 'assertions' stamp: 'pg 10/31/2022 23:17:19'!
assertThat: aMarsRover afterExecuting: aStringOfCommands isAt: aLocationInMars pointing: aCardinalDirection

	aMarsRover executeFollowingTheCommands: aStringOfCommands.
	
	self assert: (aMarsRover isAt: aLocationInMars pointingTo: aCardinalDirection).! !


!classDefinition: #CardinalDirections category: 'MarsRover Ejercicio'!
Object subclass: #CardinalDirections
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!CardinalDirections methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:28:30'!
rotateLeft

	self subclassResponsibility ! !

!CardinalDirections methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:29:20'!
rotateRight

	self subclassResponsibility ! !


!CardinalDirections methodsFor: 'movements' stamp: 'pg 10/31/2022 21:26:33'!
moveBackwards

	self subclassResponsibility ! !

!CardinalDirections methodsFor: 'movements' stamp: 'pg 11/2/2022 17:23:30'!
moveForward

	self subclassResponsibility ! !


!classDefinition: #East category: 'MarsRover Ejercicio'!
CardinalDirections subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!East methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:28:30'!
rotateLeft

	^North new.! !

!East methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:29:20'!
rotateRight

	^South new.! !


!East methodsFor: 'movements' stamp: 'pg 10/31/2022 21:26:33'!
moveBackwards

	^-1@0! !

!East methodsFor: 'movements' stamp: 'pg 11/2/2022 17:23:30'!
moveForward

	^1@0! !


!classDefinition: #North category: 'MarsRover Ejercicio'!
CardinalDirections subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!North methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:28:30'!
rotateLeft

	^West new.! !

!North methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:29:20'!
rotateRight

	^East new.! !


!North methodsFor: 'movements' stamp: 'pg 10/31/2022 21:26:33'!
moveBackwards

	^0@-1! !

!North methodsFor: 'movements' stamp: 'pg 11/2/2022 17:23:30'!
moveForward

	^0@1! !


!classDefinition: #South category: 'MarsRover Ejercicio'!
CardinalDirections subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!South methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:28:30'!
rotateLeft

	^East new.! !

!South methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:29:20'!
rotateRight

	^West new.! !


!South methodsFor: 'movements' stamp: 'pg 10/31/2022 21:26:33'!
moveBackwards

	^0@1! !

!South methodsFor: 'movements' stamp: 'pg 11/2/2022 17:23:30'!
moveForward

	^0@-1! !


!classDefinition: #West category: 'MarsRover Ejercicio'!
CardinalDirections subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!West methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:28:30'!
rotateLeft

	^South new.! !

!West methodsFor: 'rotations' stamp: 'pg 10/31/2022 21:29:20'!
rotateRight

	^North new.! !


!West methodsFor: 'movements' stamp: 'pg 10/31/2022 21:26:33'!
moveBackwards

	^1@0! !

!West methodsFor: 'movements' stamp: 'pg 11/2/2022 17:23:30'!
moveForward

	^-1@0! !


!classDefinition: #MarsRover category: 'MarsRover Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'locationInMars pointingDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!MarsRover methodsFor: 'initialization' stamp: 'pg 10/31/2022 23:17:02'!
initializeLandAt: aPointInMars pointingTo: aCardinalPoint 

	locationInMars := aPointInMars.
	pointingDirection := aCardinalPoint.! !


!MarsRover methodsFor: 'evaluating' stamp: 'pg 10/31/2022 23:17:35'!
isAt: aPointInMars pointingTo: aCardinalDirection
	
	^locationInMars = aPointInMars and: [(pointingDirection class) = (aCardinalDirection class)]! !


!MarsRover methodsFor: 'actions' stamp: 'pg 10/31/2022 23:12:01'!
changeYourDirectionTo: aCardinalDirection

	pointingDirection := aCardinalDirection ! !

!MarsRover methodsFor: 'actions' stamp: 'pg 11/2/2022 21:57:28'!
executeFollowingTheCommands: aStringOfCommands

	aStringOfCommands do: [:aCommand | self executeTheCommand: aCommand].
	
	! !

!MarsRover methodsFor: 'actions' stamp: 'pg 11/2/2022 22:19:56'!
executeTheCommand: aCommand 
	
	(Commands initializeFor: aCommand) executeYourActionFor: self.
	
	
		! !

!MarsRover methodsFor: 'actions' stamp: 'pg 11/3/2022 20:56:28'!
move: aPointToBeAdded

	locationInMars := locationInMars + aPointToBeAdded! !


!MarsRover methodsFor: 'accessing' stamp: 'pg 11/2/2022 22:13:06'!
pointingDirection

	^pointingDirection ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover Ejercicio'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'pg 10/31/2022 23:17:58'!
landAt: aPointInMars pointingTo: aCardinalDirection
	
	^self new initializeLandAt: aPointInMars pointingTo: aCardinalDirection! !

!MarsRover class methodsFor: 'instance creation' stamp: 'pg 10/31/2022 23:43:22'!
landPointingTo: aCardinalDirection
	
	^self new initializeLandAt: 0@0 pointingTo: aCardinalDirection! !


!classDefinition: #Commands category: 'MarsRover Ejercicio'!
MarsRover subclass: #Commands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!Commands methodsFor: 'actions' stamp: 'pg 11/2/2022 22:06:42'!
executeYourActionFor: aMarsRover
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Commands class' category: 'MarsRover Ejercicio'!
Commands class
	instanceVariableNames: ''!

!Commands class methodsFor: 'handling errors' stamp: 'pg 11/2/2022 22:22:17'!
commandDoesntExistErrorMessage

	^'The command doesnt exist'! !

!Commands class methodsFor: 'handling errors' stamp: 'pg 11/2/2022 22:21:50'!
signalCommandDoesntExistError

	self error: self commandDoesntExistErrorMessage! !


!Commands class methodsFor: 'instance creation' stamp: 'pg 11/2/2022 22:17:16'!
initializeFor: aCommand

	^(Commands subclasses detect: [:aCommandSubclass | aCommandSubclass verifyYourRequirments: aCommand] 
	ifNone: [^self signalCommandDoesntExistError ]) new! !

!Commands class methodsFor: 'instance creation' stamp: 'pg 11/2/2022 22:05:23'!
verifyYourRequirments: aCommand

	self subclassResponsibility ! !


!classDefinition: #Backwards category: 'MarsRover Ejercicio'!
Commands subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!Backwards methodsFor: 'actions' stamp: 'pg 11/2/2022 22:13:17'!
executeYourActionFor: aMarsRover

	^aMarsRover move: (aMarsRover pointingDirection moveBackwards) ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backwards class' category: 'MarsRover Ejercicio'!
Backwards class
	instanceVariableNames: ''!

!Backwards class methodsFor: 'instance creation' stamp: 'pg 11/2/2022 22:05:56'!
verifyYourRequirments: aCommand

	^aCommand = $b! !


!classDefinition: #Forward category: 'MarsRover Ejercicio'!
Commands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!Forward methodsFor: 'actions' stamp: 'pg 11/2/2022 22:13:37'!
executeYourActionFor: aMarsRover

	^aMarsRover move: (aMarsRover pointingDirection moveForward)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover Ejercicio'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'instance creation' stamp: 'pg 11/2/2022 22:06:02'!
verifyYourRequirments: aCommand

	^aCommand = $f! !


!classDefinition: #Left category: 'MarsRover Ejercicio'!
Commands subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!Left methodsFor: 'actions' stamp: 'pg 11/2/2022 22:13:43'!
executeYourActionFor: aMarsRover

	^aMarsRover changeYourDirectionTo: (aMarsRover pointingDirection rotateLeft)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: 'MarsRover Ejercicio'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'instance creation' stamp: 'pg 11/2/2022 22:06:07'!
verifyYourRequirments: aCommand

	^aCommand = $l! !


!classDefinition: #Right category: 'MarsRover Ejercicio'!
Commands subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover Ejercicio'!

!Right methodsFor: 'actions' stamp: 'pg 11/2/2022 22:13:50'!
executeYourActionFor: aMarsRover

	^aMarsRover changeYourDirectionTo: (aMarsRover pointingDirection rotateRight)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: 'MarsRover Ejercicio'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'instance creation' stamp: 'pg 11/2/2022 22:06:11'!
verifyYourRequirments: aCommand

	^aCommand = $r! !
