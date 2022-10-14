!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'pg 10/14/2022 00:33:40'!
test11StackCanBeLimited
	
	| stack |
	stack := OOStack new initializeWithMaxSize: 2.
	stack push: 10.
	stack push: 5.
	self 
		should: [ stack push: 8]
		raise: Error
		withExceptionDo: [ :anError | self assert: OOStack stackIsFullErrorDescription equals: anError messageText ]! !

!OOStackTest methodsFor: 'test' stamp: 'pg 10/14/2022 00:40:04'!
test12LimitedStackBehavesLIFO
	
	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new initializeWithMaxSize: 2.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty ! !

!OOStackTest methodsFor: 'test' stamp: 'pg 10/14/2022 00:40:15'!
test13LimitedStackCanAnswerSameMessageAsNoLimitedStack
	
	| stack |
	stack := OOStack new initializeWithMaxSize: 2.
	self assert: stack isEmpty.
	
	stack push: 10.
	self assert: stack size equals: 1.
	
	stack push: 5.
	self assert: stack top equals: 5.
	self assert: stack pop equals: 5.
	
	stack pop.
	self assert: stack isEmpty.! !

!OOStackTest methodsFor: 'test' stamp: 'pg 10/14/2022 00:42:10'!
test14LimitedStackRaiseErrorWhenNumberIsInvalid
	
	self
	should: [ OOStack new initializeWithMaxSize: 'invalid'.]
	raise: Error
	withExceptionDo: [ :anError | self assert: OOStack invalidNumberErrorDescription equals: anError messageText ].
	
	self
	should: [ OOStack new initializeWithMaxSize: -2.]
	raise: Error
	withExceptionDo: [ :anError | self assert: OOStack invalidNumberErrorDescription equals: anError messageText ]! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp/tearDown' stamp: 'pg 10/13/2022 21:49:41'!
setUp

	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new with: stack.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 21:49:54'!
test01ExampleCase

	| sentence1 sentence2 sentence3 sentence4 |
	
	sentence1 := 'winter is coming'.
	sentence2 := 'winning is everything'.
	sentence3 :=  'The winds of Winter'.
	sentence4 := 'Winter is here'.
	stack push: sentence1.
	stack push: sentence2.
	stack push: sentence3.
	stack push: sentence4.
	
	self assert: sentence4 equals: (sentenceFinder find: 'Wint').
	

	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 00:59:21'!
test02OnlyOneSentenceAndHasThePrefix

	| sentence1 |
	
	sentence1 := 'winter is coming'.
	stack push: sentence1.
	
	self assert: sentence1  equals: (sentenceFinder find: 'wint').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 00:59:32'!
test03OnlyOneSentenceAndDoesntHaveThePrefix

	| sentence1 |
	
	sentence1 := 'winter is coming'.
	stack push: sentence1.
	
	self assert: nil equals: (sentenceFinder find: 'Wint') .! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 21:56:06'!
test04EmptyStack

	self assert: nil equals: (sentenceFinder find: 'Wint') .
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/14/2022 11:52:35'!
test05EmptyPrefix
	
	| sentence1 |
	
	sentence1 := 'winter is coming'.
	stack push: sentence1.
	
	self 
		should: [ sentenceFinder find: '']
		raise: Error
		withExceptionDo: [ :anError | self assert: Prefix invalidPrefixErrorDescription equals: anError messageText ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/14/2022 11:52:31'!
test06PrefixIsNotString
	
	| sentence1 |
	
	sentence1 := 'winter is coming'.
	stack push: sentence1.
	
	self 
		should: [ sentenceFinder find: 10]
		raise: Error
		withExceptionDo: [ :anError | self assert: Prefix invalidPrefixErrorDescription equals: anError messageText ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 20:50:15'!
test07PrefixIsCaseSensitive
	
	| sentence1 sentence2 sentence3 sentence4 expectedResult |
	sentence1 := 'winter is coming'.
	sentence2 := 'winning is everything'.
	sentence3 :=  'The winds of Winter'.
	sentence4 := 'Winter is here'.
	stack push: sentence1.
	stack push: sentence2.
	stack push: sentence3.
	stack push: sentence4.
	
	expectedResult := OrderedCollection with: sentence2 with: sentence1..
	self assert: (expectedResult includesAllOf: (sentenceFinder find: 'win')).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 01:00:25'!
test08FinderIgnoresElementThatAreNotSentences

	| sentence1 sentence2 sentence3 sentence4 |
	sentence1 := 'winter is coming'.
	sentence2 := 'winning is everything'.
	sentence3 :=  'The winds of Winter'.
	sentence4 := 'Winter is here'.
	stack push: sentence1.
	stack push: 2.
	stack push: sentence2.
	stack push: OrderedCollection new.
	stack push: sentence3.
	stack push: sentence4.
	
	self assert: sentence4 equals: (sentenceFinder find: 'Wint').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 01:09:08'!
test09StackContinuesAsBefore

	| sentence1 sentence2 sentence3 sentence4 |
	sentence1 := 'winter is coming'.
	sentence2 := 'winning is everything'.
	sentence3 :=  'The winds of Winter'.
	sentence4 := 'Winter is here'.
	stack push: sentence1.
	stack push: sentence2.
	stack push: sentence3.
	stack push: sentence4.
	
	self assert: sentence4 equals: (sentenceFinder find: 'Wint').
	self assert: stack pop equals: sentence4.
	self assert: stack pop equals: sentence3.
	self assert: stack pop equals: sentence2.
	self assert: stack pop equals: sentence1.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 20:51:08'!
test10StackSufferChanges

	| sentence1 sentence2 sentence3 sentence4 expectedResult|
	sentence1 := 'winter is coming'.
	sentence2 := 'winning is everything'.
	sentence3 :=  'The winds of Winter'.
	sentence4 := 'Winter is here'.
	stack push: sentence1.
	stack push: sentence2.
	stack push: sentence3.
	stack push: sentence4.
	expectedResult := OrderedCollection with: sentence1 with: sentence2.
	
	self assert: (expectedResult includesAllOf: (sentenceFinder find: 'win')).
	
	stack pop.
	stack pop.
	stack pop.
	
	self assert: sentence1 equals: (sentenceFinder find: 'win').! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 20:51:56'!
test11PrefixCanBeStringWithNumbers

	| sentence1 sentence2 sentence3 expectedResult |
	sentence1 := '33 is my favourite number'.
	sentence2 := 'I am 33 years old'.
	sentence3 :=  '3 to nil was the result'.
	stack push: sentence1.
	stack push: sentence2.
	stack push: sentence3.
	stack push: 3.
	
	expectedResult := OrderedCollection with: sentence3 with: sentence1.	
	
	self assert: (expectedResult includesAllOf:  (sentenceFinder find: '3')).! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pg 10/13/2022 21:56:53'!
test12SomeSentencesAreTwice
	
	| sentence1 sentence2 sentence3 sentence4 expectedResult |
	sentence1 := 'winter is coming'.
	sentence2 := 'winning is everything'.
	sentence3 :=  'The winds of Winter'.
	sentence4 := 'Winter is here'.
	stack push: sentence4.
	stack push: sentence1.
	stack push: sentence2.
	stack push: sentence3.
	stack push: sentence4.
	
	expectedResult := OrderedCollection with: sentence4 with: sentence4.
	self assert: (expectedResult includesAllOf: (sentenceFinder find: 'Wint')).! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top maxSize limited'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'pg 10/11/2022 20:40:53'!
isEmpty

	^top isEmpty! !

!OOStack methodsFor: 'testing' stamp: 'pg 10/11/2022 20:41:01'!
size

	^top size! !


!OOStack methodsFor: 'error handling' stamp: 'pg 10/13/2022 23:35:52'!
signalInvalidNumberError

	self error: self class invalidNumberErrorDescription ! !

!OOStack methodsFor: 'error handling' stamp: 'pg 10/9/2022 20:11:23'!
signalStackEmptyError

	self error: self class stackEmptyErrorDescription ! !

!OOStack methodsFor: 'error handling' stamp: 'pg 10/13/2022 23:24:57'!
signalStackIsFullError

	self error: self class stackIsFullErrorDescription ! !


!OOStack methodsFor: 'operations' stamp: 'pg 10/11/2022 21:28:14'!
pop
	
	|elementToReturn |
	
	elementToReturn := top.
	top := top anterior.
	^elementToReturn pop! !

!OOStack methodsFor: 'operations' stamp: 'pg 10/14/2022 11:29:08'!
push: anElement

	|number newElement|
	
	number := (top size) + 1.
	newElement := Element initializeTheElement: anElement aNumber: number after: top  isLimited: limited withMaxSize: maxSize. 
	top := 	 newElement.
! !

!OOStack methodsFor: 'operations' stamp: 'pg 10/11/2022 20:49:50'!
top
	
	^top top! !


!OOStack methodsFor: 'initialization' stamp: 'pg 10/14/2022 11:30:14'!
initialize

	top := Base new.
	limited := false.
	maxSize := nil.! !

!OOStack methodsFor: 'initialization' stamp: 'pg 10/13/2022 23:41:58'!
initializeWithMaxSize: aNumber
	
	(self validateTheNumber: aNumber) ifFalse: [^self signalInvalidNumberError].
	maxSize := aNumber.
	limited := true.! !


!OOStack methodsFor: 'validations' stamp: 'pg 10/13/2022 23:41:38'!
validateTheNumber: aNumber

	(aNumber isInteger) ifTrue: [(aNumber > 0) ifTrue: [^true]].
	
	^false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'pg 10/13/2022 23:36:09'!
invalidNumberErrorDescription

	^'You enter a invalid number'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'pg 10/13/2022 23:25:17'!
stackIsFullErrorDescription

	^'Your stack is full'! !


!classDefinition: #Top category: 'Stack-Exercise'!
OOStack subclass: #Top
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Top methodsFor: 'operations' stamp: 'pg 10/11/2022 21:29:07'!
anterior

	self subclassResponsibility ! !

!Top methodsFor: 'operations' stamp: 'pg 10/11/2022 20:50:34'!
pop

	self subclassResponsibility ! !

!Top methodsFor: 'operations' stamp: 'pg 10/11/2022 20:50:41'!
top

	self subclassResponsibility ! !


!Top methodsFor: 'testing' stamp: 'pg 10/11/2022 20:50:25'!
isEmpty

	self subclassResponsibility ! !

!Top methodsFor: 'testing' stamp: 'pg 10/11/2022 20:50:38'!
size

	self subclassResponsibility ! !


!classDefinition: #Base category: 'Stack-Exercise'!
Top subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'initialization' stamp: 'pg 10/13/2022 01:10:36'!
initialize! !


!Base methodsFor: 'operations' stamp: 'pg 10/13/2022 01:10:43'!
anterior
! !

!Base methodsFor: 'operations' stamp: 'pg 10/13/2022 21:28:01'!
pop

	^self top! !

!Base methodsFor: 'operations' stamp: 'pg 10/11/2022 20:37:26'!
top

	self signalStackEmptyError! !


!Base methodsFor: 'testing' stamp: 'pg 10/11/2022 20:38:07'!
isEmpty

	^true.! !

!Base methodsFor: 'testing' stamp: 'pg 10/11/2022 20:36:49'!
size

	^0.! !


!classDefinition: #Element category: 'Stack-Exercise'!
Top subclass: #Element
	instanceVariableNames: 'anterior element number'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'initialization' stamp: 'pg 10/14/2022 11:31:22'!
initializeTheElement: anElement withTheNumber: aNumber after: anotherElement andMaxSize: maxSizeNumber

	self subclassResponsibility ! !


!Element methodsFor: 'operations' stamp: 'pg 10/11/2022 20:54:12'!
anterior

	^anterior! !

!Element methodsFor: 'operations' stamp: 'pg 10/12/2022 14:57:38'!
pop

	^self top! !

!Element methodsFor: 'operations' stamp: 'pg 10/11/2022 21:19:38'!
top

	^element! !


!Element methodsFor: 'testing' stamp: 'pg 10/11/2022 20:39:55'!
isEmpty

	^false! !

!Element methodsFor: 'testing' stamp: 'pg 10/11/2022 20:48:30'!
size

	^number! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Element class' category: 'Stack-Exercise'!
Element class
	instanceVariableNames: ''!

!Element class methodsFor: 'private' stamp: 'pg 10/14/2022 11:24:23'!
initializeTheElement: anElement aNumber: number after: top isLimited: boolean withMaxSize: maxSizeNumber.

	^(Element subclasses detect: [:anElementSubclass | anElementSubclass meetsYourRequirements: boolean] ifNone: [^self]) 
	new initializeTheElement: anElement withTheNumber: number after: top andMaxSize: maxSizeNumber.! !

!Element class methodsFor: 'private' stamp: 'pg 10/14/2022 11:53:51'!
meetsYourRequirements: limitedBoolean
	
	self subclassResponsibility ! !


!classDefinition: #LimitedElement category: 'Stack-Exercise'!
Element subclass: #LimitedElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LimitedElement methodsFor: 'initialization' stamp: 'pg 10/14/2022 11:28:47'!
initializeTheElement: anElement withTheNumber: aNumber after: anotherElement andMaxSize: maxSizeNumber
	
	(aNumber > maxSizeNumber ) ifTrue: [self signalStackIsFullError].
	element := anElement.
	number:= aNumber.
	anterior := anotherElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LimitedElement class' category: 'Stack-Exercise'!
LimitedElement class
	instanceVariableNames: ''!

!LimitedElement class methodsFor: 'private' stamp: 'pg 10/14/2022 11:25:22'!
meetsYourRequirements: limitedBoolean

	^limitedBoolean = true! !


!classDefinition: #NoLimitedElement category: 'Stack-Exercise'!
Element subclass: #NoLimitedElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NoLimitedElement methodsFor: 'initialization' stamp: 'pg 10/14/2022 11:22:42'!
initializeTheElement: anElement withTheNumber: aNumber after: anotherElement andMaxSize: maxSizeNumber

	element := anElement.
	number:= aNumber.
	anterior := anotherElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoLimitedElement class' category: 'Stack-Exercise'!
NoLimitedElement class
	instanceVariableNames: ''!

!NoLimitedElement class methodsFor: 'private' stamp: 'pg 10/14/2022 11:25:31'!
meetsYourRequirements: boolean

	^boolean = false! !


!classDefinition: #Prefix category: 'Stack-Exercise'!
Object subclass: #Prefix
	instanceVariableNames: 'thePrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Prefix methodsFor: 'operations' stamp: 'pg 10/14/2022 11:50:45'!
getYourPrefix

	^thePrefix! !


!Prefix methodsFor: 'error handling' stamp: 'pg 10/14/2022 11:46:10'!
signalInvalidPrefixError

	self error: self class invalidPrefixErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prefix class' category: 'Stack-Exercise'!
Prefix class
	instanceVariableNames: ''!

!Prefix class methodsFor: 'error descriptions' stamp: 'pg 10/14/2022 11:46:19'!
invalidPrefixErrorDescription
	
	^ 'The prefix is not string,  is empty or contents blank spaces'! !


!Prefix class methodsFor: 'private' stamp: 'pg 10/14/2022 11:51:55'!
meetsYourRequirements: aPrefix
	
	self subclassResponsibility ! !

!Prefix class methodsFor: 'private' stamp: 'pg 10/14/2022 11:46:57'!
with: aPrefix

	^(Prefix subclasses detect: [:aPrefixSubclass | aPrefixSubclass meetsYourRequirements: aPrefix] ifNone: [^self]) 
	meetsYourSubclassesRequirements: aPrefix.! !


!classDefinition: #NotStringPrefix category: 'Stack-Exercise'!
Prefix subclass: #NotStringPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotStringPrefix methodsFor: 'initialization' stamp: 'pg 10/14/2022 11:45:18'!
initialize

	self signalInvalidPrefixError! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotStringPrefix class' category: 'Stack-Exercise'!
NotStringPrefix class
	instanceVariableNames: ''!

!NotStringPrefix class methodsFor: 'private' stamp: 'pg 10/14/2022 11:39:08'!
meetsYourRequirements: aPrefix

	^aPrefix isString not! !

!NotStringPrefix class methodsFor: 'private' stamp: 'pg 10/14/2022 11:44:46'!
meetsYourSubclassesRequirements: aPrefix

	self new.! !


!classDefinition: #StringPrefix category: 'Stack-Exercise'!
Prefix subclass: #StringPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StringPrefix methodsFor: 'initialization' stamp: 'pg 10/14/2022 11:56:46'!
initializeWith: aPrefix

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StringPrefix class' category: 'Stack-Exercise'!
StringPrefix class
	instanceVariableNames: ''!

!StringPrefix class methodsFor: 'private' stamp: 'pg 10/14/2022 11:42:03'!
meetsYourRequirements: aPrefix

	^aPrefix isString! !

!StringPrefix class methodsFor: 'private' stamp: 'pg 10/14/2022 11:48:56'!
meetsYourSubclassesRequirements: aPrefix

	^(StringPrefix subclasses detect: [:aStringPrefixSubclass | aStringPrefixSubclass meetsYourRequirements: aPrefix] ifNone: [ValidPrefix]) 
	new initializeWith: aPrefix! !


!classDefinition: #BlankSpacesPrefix category: 'Stack-Exercise'!
StringPrefix subclass: #BlankSpacesPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BlankSpacesPrefix methodsFor: 'initialization' stamp: 'pg 10/14/2022 11:48:10'!
initializeWith: aPrefix

	self signalInvalidPrefixError! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BlankSpacesPrefix class' category: 'Stack-Exercise'!
BlankSpacesPrefix class
	instanceVariableNames: ''!

!BlankSpacesPrefix class methodsFor: 'private' stamp: 'pg 10/14/2022 11:49:52'!
meetsYourRequirements: aPrefix

	^aPrefix includesSubString: ' '! !


!classDefinition: #EmptyPrefix category: 'Stack-Exercise'!
StringPrefix subclass: #EmptyPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyPrefix methodsFor: 'initialization' stamp: 'pg 10/14/2022 11:48:19'!
initializeWith: aPrefix

	self signalInvalidPrefixError! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyPrefix class' category: 'Stack-Exercise'!
EmptyPrefix class
	instanceVariableNames: ''!

!EmptyPrefix class methodsFor: 'private' stamp: 'pg 10/14/2022 11:49:36'!
meetsYourRequirements: aPrefix

	^aPrefix isEmpty! !


!classDefinition: #ValidPrefix category: 'Stack-Exercise'!
StringPrefix subclass: #ValidPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ValidPrefix methodsFor: 'initialization' stamp: 'pg 10/14/2022 11:48:36'!
initializeWith: aPrefix

	thePrefix := aPrefix! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPrefix class' category: 'Stack-Exercise'!
ValidPrefix class
	instanceVariableNames: ''!

!ValidPrefix class methodsFor: 'private' stamp: 'pg 10/14/2022 11:38:46'!
meetsYourRequirements: aPrefix

	^false! !


!classDefinition: #Result category: 'Stack-Exercise'!
Object subclass: #Result
	instanceVariableNames: 'finalResult'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Result methodsFor: 'operations' stamp: 'pg 10/13/2022 21:46:42'!
finalResult

	self subclassResponsibility ! !


!Result methodsFor: 'initialization' stamp: 'pg 10/13/2022 21:18:01'!
initializeWith: aResult

	finalResult := aResult! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Result class' category: 'Stack-Exercise'!
Result class
	instanceVariableNames: ''!

!Result class methodsFor: 'private' stamp: 'pg 10/13/2022 21:17:08'!
with: aResult 
	
	^(Result subclasses detect: [:aResultSubclass | aResultSubclass meetsYourRequirements: aResult] ifNone: [^self]) new initializeWith: aResult.! !


!classDefinition: #EmptyResult category: 'Stack-Exercise'!
Result subclass: #EmptyResult
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyResult methodsFor: 'operations' stamp: 'pg 10/13/2022 21:46:05'!
finalResult

	^nil! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyResult class' category: 'Stack-Exercise'!
EmptyResult class
	instanceVariableNames: ''!

!EmptyResult class methodsFor: 'private' stamp: 'pg 10/13/2022 21:18:27'!
meetsYourRequirements: aResult

	^aResult isEmpty! !


!classDefinition: #LargerThanOneResult category: 'Stack-Exercise'!
Result subclass: #LargerThanOneResult
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!LargerThanOneResult methodsFor: 'operations' stamp: 'pg 10/13/2022 21:46:17'!
finalResult

	^finalResult! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LargerThanOneResult class' category: 'Stack-Exercise'!
LargerThanOneResult class
	instanceVariableNames: ''!

!LargerThanOneResult class methodsFor: 'private' stamp: 'pg 10/13/2022 21:18:42'!
meetsYourRequirements: aResult

	^aResult size > 1! !


!classDefinition: #SizeOneResult category: 'Stack-Exercise'!
Result subclass: #SizeOneResult
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SizeOneResult methodsFor: 'operations' stamp: 'pg 10/13/2022 21:46:33'!
finalResult

	^finalResult at: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SizeOneResult class' category: 'Stack-Exercise'!
SizeOneResult class
	instanceVariableNames: ''!

!SizeOneResult class methodsFor: 'private' stamp: 'pg 10/13/2022 21:18:52'!
meetsYourRequirements: aResult

	^aResult size = 1! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack sentences result prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'pg 10/12/2022 15:20:23'!
with: aStack

	stack := aStack! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'pg 10/14/2022 11:57:32'!
find: aPrefix
	
	prefix := Prefix with: aPrefix.
	prefix := prefix getYourPrefix.
	sentences := self sentencesToOrderedCollection.
	result := Result with: (sentences select: [:aSentence | aSentence beginsWith: prefix]). 
	^result finalResult
	
	 ! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'pg 10/13/2022 23:13:38'!
sentencesToOrderedCollection

	| auxiliarStack resultSentences |
	
	auxiliarStack := OOStack new.
	resultSentences := OrderedCollection new.
	
	[stack isEmpty not] whileTrue: [ 
		auxiliarStack push: stack top .
		resultSentences add: stack pop ].
	
	[auxiliarStack isEmpty not] whileTrue: [ stack push: auxiliarStack pop].
	
	^resultSentences select: [:anElement | anElement isString]
	! !
