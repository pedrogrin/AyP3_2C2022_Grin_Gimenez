!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 9/26/2022 21:57:34'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	customerBook := CustomerBook new.
	self should: [customerBook addCustomerNamed: 'John Lennon'] notTakeMoreThan: 50 milliSeconds.
	"Abstracción de la clase Test Case, que recibe un objeto de la clase Duration, por eso no podemos usar 50 * millisecond (que es más potente)"! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 9/26/2022 21:56:51'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook with: 'Paul McCartney'.
	self should: [customerBook removeCustomerNamed: 'Paul McCartney'.] notTakeMoreThan: 100 milliSeconds. 
	"Abstracción de la clase Test Case, que recibe un objeto de la clase Duration, por eso no podemos usar 100 * millisecond (que es más potente)"
 ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 9/26/2022 21:11:24'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	self should: [ customerBook addCustomerNamed: ''] raise: Error 
	withMessageText: CustomerBook customerCanNotBeEmptyErrorMessage.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 9/26/2022 21:54:12'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook with: 'John Lennon'.
	
	self should:  [customerBook removeCustomerNamed: 'Paul McCartney'] 
	raise: NotFound 
	withExceptionDo: [:anError | self assertThatIn: customerBook thereAre: 1 customersWhereIs: 'John Lennon'].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 9/26/2022 21:54:12'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook with: 'Paul McCartney'.
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	
	self assertThatIn: customerBook activeCustomersAre: 0 suspendedCustomersAre: 1 allCustomersAre: 1.
	self assert: (customerBook includesCustomerNamed: 'Paul McCartney').
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 9/26/2022 21:54:12'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook with: 'Paul McCartney'.
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self assertThatIn: customerBook activeCustomersAre: 0 suspendedCustomersAre: 0  allCustomersAre: 0.
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 9/26/2022 21:54:12'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook with: 'John Lennon'.

	self should:  [customerBook suspendCustomerNamed: 'Paul McCartney'] 
	raise: CantSuspend 
	withExceptionDo: [:anError | self assertThatIn: customerBook thereAre: 1 customersWhereIs: 'John Lennon'].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'PG 9/26/2022 21:54:12'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
			
	customerBook := CustomerBook with: 'John Lennon'.
	customerBook suspendCustomerNamed: 'John Lennon'.

	self should:  [customerBook suspendCustomerNamed: 'John Lennon'] 
	raise: CantSuspend 
	withExceptionDo: [:anError | self assertThatIn: customerBook thereAre: 1 customersWhereIs: 'John Lennon'].
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'PG 9/26/2022 16:46:39'!
assertThatIn: customerBook activeCustomersAre: expectedActiveCustomers suspendedCustomersAre: expectedSuspendedCustomers allCustomersAre: expectedAllCustomers

	self assert: expectedActiveCustomers equals: customerBook numberOfActiveCustomers.
	self assert: expectedSuspendedCustomers equals: customerBook numberOfSuspendedCustomers.
	self assert: expectedAllCustomers equals: customerBook numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'PG 9/26/2022 20:51:18'!
assertThatIn: customerBook thereAre: aNumberOfCustomers customersWhereIs: aName
	self assert: customerBook numberOfCustomers = aNumberOfCustomers.	
	self assert: (customerBook includesCustomerNamed: aName ).! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'PG 9/26/2022 17:38:56'!
includesCustomerNamed: aName
	
	^self allCustomers includes: aName.! !

!CustomerBook methodsFor: 'testing' stamp: 'PG 9/26/2022 17:38:56'!
isEmpty
	^self allCustomers isEmpty
! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'PG 9/25/2022 21:30:27'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	active add: aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'PG 9/26/2022 17:38:56'!
allCustomers
	^active union: suspended! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'PG 9/24/2022 17:32:58'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'PG 9/26/2022 21:33:33'!
removeCustomerNamed: aName 
 	
	active remove: aName ifAbsent: [ suspended remove: aName ifAbsent: [^NotFound signal]].

! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'PG 9/25/2022 21:04:17'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	suspended add: aName.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!CustomerBook class methodsFor: 'instance creation' stamp: 'PG 9/26/2022 21:54:12'!
with: aName
	| customerBook |
	customerBook := self new.
	customerBook addCustomerNamed: aName.
	^customerBook! !
