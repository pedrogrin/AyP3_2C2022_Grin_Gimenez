!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: 'stack johnLennon paulMcCartney ringoStarr'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'setUp' stamp: 'pg 10/8/2022 15:45:50'!
setUp
	
	stack := Stack new.
	johnLennon := 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.
	ringoStarr := 'Ringo Starr'! !


!StackTest methodsFor: 'tests' stamp: 'pg 10/8/2022 15:37:24'!
test01StackShouldBeEmptyWhenCreated

	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'pg 10/8/2022 15:37:24'!
test02AgregarUnElementoAlTestDeberiaTardarMenosDe50Milisegundos

	self should: [stack push: johnLennon ] notTakeMoreThan: 50 milliSeconds. ! !

!StackTest methodsFor: 'tests' stamp: 'pg 10/8/2022 15:37:24'!
test03AgregarDistintosElementosAlStackNoDeberiaTardarMasDe50Milisegundos

	self should: [stack push: johnLennon . stack push: 2] notTakeMoreThan: 50 milliSeconds. ! !

!StackTest methodsFor: 'tests' stamp: 'pg 10/8/2022 15:38:34'!
test04SacarUnElementoDelStackDeberiaTardarMenosDe50Milisegundos

	stack push: johnLennon.
	self should: [stack pop] notTakeMoreThan: 50 milliSeconds. ! !

!StackTest methodsFor: 'tests' stamp: 'pg 10/8/2022 15:37:24'!
test05SacarUnElementoConElStackVacioDebeDarError

	self should: [ stack pop ] raise: Error 
	withMessageText: Stack canNotPopWithEmptyStackDescription .! !

!StackTest methodsFor: 'tests' stamp: 'pg 10/8/2022 15:47:03'!
test06SacarUnElementoDelStackDebeRetornarElUltimoAgregado

	stack push: johnLennon.
	stack push: paulMcCartney.
	stack push: ringoStarr.
	
	self assert: (stack pop) equals: ringoStarr.
	self assert: (stack pop) equals: paulMcCartney .
	self assert: (stack pop) equals: johnLennon .! !

!StackTest methodsFor: 'tests' stamp: 'pg 10/8/2022 15:52:58'!
test07SePuedeObtenerElUltimoElementoAgregadoSinSacarlo

	stack push: johnLennon.
	stack push: paulMcCartney .
	
	self assert: (stack top) equals: paulMcCartney.
	self assert: (stack pop) equals: paulMcCartney ! !

!StackTest methodsFor: 'tests' stamp: 'pg 10/8/2022 15:54:02'!
test08VerElUltimoElementoConElStackVacioDebeDarError

	self should: [ stack top ] raise: Error 
	withMessageText: Stack canNotTopWithEmptyStackDescription.! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'array'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'operations' stamp: 'pg 10/8/2022 15:32:41'!
pop
	
	(self isEmpty) ifTrue: [self signalCanNotPopWithEmptyStack ].
	^array removeLast! !

!Stack methodsFor: 'operations' stamp: 'pg 10/8/2022 15:15:09'!
push: anElement

	array add: anElement.! !

!Stack methodsFor: 'operations' stamp: 'pg 10/8/2022 15:55:11'!
top
	
	(self isEmpty) ifTrue: [self signalCanNotTopWithEmptyStack ].
	^array last
	! !


!Stack methodsFor: 'initialization' stamp: 'pg 10/8/2022 15:12:13'!
initialize

	array := OrderedCollection new.! !


!Stack methodsFor: 'testing' stamp: 'pg 10/8/2022 15:12:13'!
isEmpty

	^array isEmpty! !


!Stack methodsFor: 'error handling' stamp: 'pg 10/8/2022 15:31:59'!
signalCanNotPopWithEmptyStack

	self error: self class canNotPopWithEmptyStackDescription ! !

!Stack methodsFor: 'error handling' stamp: 'pg 10/8/2022 15:54:45'!
signalCanNotTopWithEmptyStack

	self error: self class canNotTopWithEmptyStackDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'error messages' stamp: 'pg 10/8/2022 15:30:26'!
canNotPopWithEmptyStackDescription

	^'No se puede sacar un elemento del stack si esta vacío'! !

!Stack class methodsFor: 'error messages' stamp: 'pg 10/8/2022 15:54:28'!
canNotTopWithEmptyStackDescription

	^'No se puede ver el ultimo elemento del stack si esta vacío'! !
