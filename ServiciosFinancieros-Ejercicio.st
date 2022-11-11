!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'pg 11/10/2022 11:08:48'!
test01PortfolioHaveZeroAsBalanceWhenCreated
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'pg 11/10/2022 11:12:45'!
test02PortfolioBalanceEqualsTheReceptiveAccountAddedBalance

	| account1  portfolio|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	portfolio := Portfolio new.
	portfolio add: account1.
	
	self assert: 100*peso equals: portfolio balance.
	
	
		
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'pg 11/10/2022 11:10:15'!
test03PortfolioBalanceEqualsAllTheAccountsAddedBalance

	| account1 account2 portfolio|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	Deposit register: 50 * peso on: account2.
	
	portfolio := Portfolio new.
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: 150*peso equals: portfolio balance.
	
	
		
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'pg 11/10/2022 11:13:44'!
test04PortfolioKnowsRegisteredTransactionsFromAccounts

	| account deposit portfolio|
	
	account := ReceptiveAccount new.	
	deposit := Deposit register: 50 * peso on: account.
	
	portfolio := Portfolio new.
	portfolio add: account.
	
	self assert: (portfolio hasRegistered: deposit)
	
	
		
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'pg 11/10/2022 11:12:00'!
test05PortfolioDoNotKnowNotRegisteredTransactionsFromAccounts

	| account1 account2 deposit1 deposit2 portfolio|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 * peso on: account1.
	deposit2 := Deposit register: 50 * peso on: account2.
	
	portfolio := Portfolio new.
	portfolio add: account1.
	
	self assert: (portfolio hasRegistered: deposit1).
	self deny: (portfolio hasRegistered: deposit2)
	
	
		
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'pg 11/11/2022 11:24:50'!
test06PortfolioKnowsTransactionsFromAccounts

	| account1 account2 deposit1 deposit2 portfolio portfolio2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 * peso on: account1.
	deposit2 :=Deposit register: 50 * peso on: account2.
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio2 add: account1.
	portfolio add: account2.
	portfolio add: portfolio2.
	
	self assert: (Set with: deposit1 with: deposit2) equals: portfolio transactions.
	! !


!PortfolioTest methodsFor: 'tests extra' stamp: 'pg 11/10/2022 14:00:43'!
test07PortfolioCanNotAddTheSameAccountRepeatdly

	| portfolio account |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	
	portfolio add: account.
	
	self should: [portfolio add: account]
	raise: Error
	withExceptionDo: [:anError | self assert: Portfolio accountAlreadyIncludedErrorMessage equals: anError messageText].

		! !

!PortfolioTest methodsFor: 'tests extra' stamp: 'pg 11/10/2022 13:59:20'!
test08PortfolioCanNotAddAccountAlreadyIncludedInAnotherPortfolioAddedBefore

	| portfolio1 portfolio2 account |
	
	account := ReceptiveAccount new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio2 add: account.
	portfolio1 add: portfolio2.
	
	self should: [portfolio1 add: account]
	raise: Error
	withExceptionDo: [:anError | self assert: Portfolio accountAlreadyIncludedErrorMessage equals: anError messageText].

		! !

!PortfolioTest methodsFor: 'tests extra' stamp: 'pg 11/10/2022 13:59:35'!
test09PortfolioCanNotAddItself

	| portfolio |
	
	portfolio := Portfolio new.
	
	self should: [portfolio add: portfolio]
	raise: Error
	withExceptionDo: [:anError | self assert: Portfolio accountAlreadyIncludedErrorMessage equals: anError messageText].

		! !

!PortfolioTest methodsFor: 'tests extra' stamp: 'pg 11/10/2022 14:00:37'!
test10PortfolioCanNotAddAccountAlreadyAddedInAParentOfPortfolio

	| portfolio1 portfolio2 account |
	
	account := ReceptiveAccount new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 add: account.
	portfolio1 add: portfolio2.
	
	self should: [portfolio2 add: account]
	raise: Error
	withExceptionDo: [:anError | self assert: Portfolio accountAlreadyIncludedErrorMessage equals: anError messageText].

		! !

!PortfolioTest methodsFor: 'tests extra' stamp: 'pg 11/10/2022 14:01:26'!
test11PortfolioCanNotAddPortfolioThatHaveAnAccountRepeatdly

	| portfolio1 portfolio2 account |
	
	account := ReceptiveAccount new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	portfolio1 add: account.
	portfolio2 add: account.
	
	self should: [portfolio1 add: portfolio2]
	raise: Error
	withExceptionDo: [:anError | self assert: Portfolio accountAlreadyIncludedErrorMessage equals: anError messageText].

		! !

!PortfolioTest methodsFor: 'tests extra' stamp: 'pg 11/10/2022 14:45:00'!
test12CanBeMoreThanOneTopParentAndExtraTestsNeedsToContinueWorking

	| portfolio1 portfolio2 portfolio3 portfolio4 portfolio5 account |
	
	account := ReceptiveAccount new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	portfolio5 := Portfolio new.
	
	portfolio1 add: portfolio2.
	portfolio2 add: portfolio5.
	portfolio3 add: portfolio2.
	portfolio3 add: account.
	portfolio4 add: portfolio3.
	
	self should: [portfolio5 add: account]
	raise: Error
	withExceptionDo: [:anError | self assert: Portfolio accountAlreadyIncludedErrorMessage equals: anError messageText].

		! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'pg 11/7/2022 15:27:41'!
test01TransferAffectsAccountsInvolvedBalance

	| destinationAccount originAccount |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: originAccount.
	
	Transfer from: originAccount to: destinationAccount for: 10*peso.
	
	self assert: 90*peso equals: originAccount balance.
	self assert: 10*peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'pg 11/7/2022 15:28:05'!
test02TransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: originAccount.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 10*peso.
	
	self assert: 10*peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'pg 11/7/2022 15:28:26'!
test03DepositLegKnowsItsCounterpart

	| destinationAccount originAccount transfer |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: originAccount.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 10*peso.
	
	self assert: transfer withdrawLeg equals: (transfer depositLeg) counterpart.! !

!TransferTest methodsFor: 'tests' stamp: 'pg 11/7/2022 15:28:41'!
test04WithdrawLegKnowsItsCounterpart

	| destinationAccount originAccount transfer |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	Deposit register: 100*peso on: originAccount.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 10*peso.
	
	self assert: transfer depositLeg equals: (transfer withdrawLeg) counterpart.! !

!TransferTest methodsFor: 'tests' stamp: 'pg 11/7/2022 15:29:07'!
test05TransferZeroPesosIsInvalid

	| destinationAccount originAccount |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	self 
		should: [Transfer from: originAccount to: destinationAccount for: 0*peso ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Transfer transferAmountIsInvalidErrorMessage equals: anError messageText ]! !

!TransferTest methodsFor: 'tests' stamp: 'pg 11/7/2022 15:29:18'!
test06TransferNegativesValuesIsInvalid

	| destinationAccount originAccount |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	
	self 
		should: [Transfer from: originAccount to: destinationAccount for: -100*peso ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Transfer transferAmountIsInvalidErrorMessage equals: anError messageText ]! !

!TransferTest methodsFor: 'tests' stamp: 'pg 11/7/2022 15:29:38'!
test07TransferBewteenSameAccountIsInvalid

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 100*peso on: originAccount.
	
	self 
		should: [Transfer from: originAccount to: originAccount for: 50*peso ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Transfer transferAccountsAreInvalidErrorMessage equals: anError messageText ]! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'pg 11/10/2022 11:18:23'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'pg 11/10/2022 11:18:53'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'pg 11/10/2022 11:19:10'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'pg 11/10/2022 14:06:14'!
hasTheAccount: anAccount

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'pg 11/10/2022 13:38:12'!
add: anAccount
	
	self validateTheAccountCanBeAdded: anAccount.
	accounts add: anAccount.
	(anAccount isKindOf: Portfolio) ifTrue: [anAccount addedTo: self].! !

!Portfolio methodsFor: 'main protocol' stamp: 'pg 11/8/2022 20:17:40'!
balance

	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [0*peso].! !

!Portfolio methodsFor: 'main protocol' stamp: 'pg 11/8/2022 20:26:48'!
hasRegistered: aTransaction

	^accounts anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'main protocol' stamp: 'pg 11/11/2022 11:24:34'!
transactions

	| transactions |
	transactions := Set new.
	
	^accounts inject: transactions addingAll: [:anAccount | anAccount transactions].! !


!Portfolio methodsFor: 'initialization' stamp: 'pg 11/11/2022 11:24:00'!
initialize

	accounts := Set new.
	parents := Set new.! !


!Portfolio methodsFor: 'errors' stamp: 'pg 11/10/2022 11:28:38'!
signalAccountAlreadyIncludedError
	
	self error: self class accountAlreadyIncludedErrorMessage! !


!Portfolio methodsFor: 'private' stamp: 'pg 11/10/2022 14:43:15'!
addAllYourTopParentsTo: topParents

	parents ifEmpty: [topParents add: self] 
	ifNotEmpty: [parents do: [:aParent | aParent addAllYourTopParentsTo: topParents]].! !

!Portfolio methodsFor: 'private' stamp: 'pg 11/10/2022 12:17:51'!
addedTo: aPortfolio

	parents add: aPortfolio.

	! !

!Portfolio methodsFor: 'private' stamp: 'pg 11/10/2022 14:44:05'!
getTopParents

	| topParents | 
	topParents := Set new.

	self addAllYourTopParentsTo: topParents.
	
	^topParents.! !

!Portfolio methodsFor: 'private' stamp: 'pg 11/10/2022 14:37:01'!
hasTheAccount: anAccountToValidate

	^ self = anAccountToValidate or: 
	[accounts anySatisfy: 
	[:anAccount | (anAccountToValidate hasTheAccount: anAccount) or: 
	[anAccount hasTheAccount: anAccountToValidate
		]]].! !

!Portfolio methodsFor: 'private' stamp: 'pg 11/10/2022 14:38:45'!
validateTheAccountCanBeAdded: anAccount

	(self getTopParents) do: [:aTopParent | (aTopParent hasTheAccount: anAccount) ifTrue: [self signalAccountAlreadyIncludedError]].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errors' stamp: 'pg 11/10/2022 11:28:58'!
accountAlreadyIncludedErrorMessage

	^'The account is already included in the portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'pg 11/11/2022 11:24:07'!
initialize

	transactions := Set new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'pg 11/8/2022 21:21:03'!
balance
	
	^transactions inject: 0*peso into: [:balance :aTransaction | aTransaction valueAppliedForBalance: balance].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'pg 11/10/2022 11:38:14'!
hasTheAccount: anAccountToValidate

	^self = anAccountToValidate ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance operations' stamp: 'pg 11/5/2022 19:24:09'!
valueAppliedForBalance: aBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'pg 11/7/2022 15:26:18'!
register: anAmountOfPesos on: account

	| transaction |
	
	transaction := self for: anAmountOfPesos.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance operations' stamp: 'pg 11/5/2022 19:24:09'!
valueAppliedForBalance: aBalance

	^aBalance + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'pg 11/7/2022 15:26:34'!
for: anAmountOfPesos

	^ self new initializeFor: anAmountOfPesos ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'value' stamp: 'pg 11/7/2022 14:58:45'!
value

	^transfer value! !


!TransferLeg methodsFor: 'accessing' stamp: 'pg 11/7/2022 15:03:13'!
counterpart

	self subclassResponsibility ! !


!TransferLeg methodsFor: 'initialization' stamp: 'pg 11/7/2022 14:57:39'!
initializeWith: aTransfer

	transfer := aTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'pg 11/7/2022 14:57:17'!
on: anAccount fromTransfer: aTransfer

	| transaction |
	
	transaction := self new initializeWith: aTransfer.
	anAccount register: transaction.
	^transaction! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'balance operations' stamp: 'pg 11/7/2022 14:58:59'!
valueAppliedForBalance: aBalance

	^aBalance - self value! !


!DepositLeg methodsFor: 'accessing' stamp: 'pg 11/7/2022 15:03:25'!
counterpart

	^transfer withdrawLeg ! !


!classDefinition: #WithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #WithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawLeg methodsFor: 'balance operations' stamp: 'pg 11/7/2022 14:59:06'!
valueAppliedForBalance: aBalance

	^aBalance + self value! !


!WithdrawLeg methodsFor: 'accessing' stamp: 'pg 11/7/2022 15:03:35'!
counterpart

	^transfer depositLeg ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'pg 11/5/2022 19:24:09'!
valueAppliedForBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'pg 11/7/2022 15:26:51'!
for: anAmountOfPesos

	^ self new initializeFor: anAmountOfPesos ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'accessing' stamp: 'pg 11/7/2022 15:02:45'!
depositLeg

	^depositLeg ! !

!Transfer methodsFor: 'accessing' stamp: 'pg 11/7/2022 14:59:16'!
value

	^value! !

!Transfer methodsFor: 'accessing' stamp: 'pg 11/7/2022 15:03:02'!
withdrawLeg

	^withdrawLeg ! !


!Transfer methodsFor: 'initialization' stamp: 'pg 11/7/2022 14:53:16'!
initializeWith: anAmountOfPesos depositLeg: aDepositLeg withdrawLeg: aWithdrawLeg

	value := anAmountOfPesos.
	depositLeg := aDepositLeg.
	withdrawLeg := aWithdrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'validations' stamp: 'pg 11/7/2022 15:20:04'!
originAccount: anOriginAccount differsFromDestinationAccount: aDestinationAccount.

	^(anOriginAccount = aDestinationAccount) ifTrue: [ self signalTransferAccountsAreInvalidErrorMessage]! !

!Transfer class methodsFor: 'validations' stamp: 'pg 11/7/2022 15:15:44'!
transferAmountIsValid: anAmountOfPesos

	^(anAmountOfPesos <= 0) ifTrue: [self signalTransferAmountIsInvalidError].! !


!Transfer class methodsFor: 'error handling' stamp: 'pg 11/7/2022 15:20:04'!
signalTransferAccountsAreInvalidErrorMessage

	self error: self transferAccountsAreInvalidErrorMessage ! !

!Transfer class methodsFor: 'error handling' stamp: 'pg 11/7/2022 15:11:26'!
signalTransferAmountIsInvalidError

	self error: self transferAmountIsInvalidErrorMessage! !

!Transfer class methodsFor: 'error handling' stamp: 'pg 11/7/2022 15:17:08'!
transferAccountsAreInvalidErrorMessage

	^'The accounts in the transfer must be different'! !

!Transfer class methodsFor: 'error handling' stamp: 'pg 11/7/2022 15:11:54'!
transferAmountIsInvalidErrorMessage

	^'The transfer amount is not valid (it must be > 0)'! !


!Transfer class methodsFor: 'instance creation' stamp: 'pg 11/7/2022 15:18:52'!
from: anOriginAccount to: aDestinationAccount for: anAmountOfPesos
	
	| depositLeg withdrawLeg transfer|
	
	self transferAmountIsValid: anAmountOfPesos.
	self originAccount: anOriginAccount differsFromDestinationAccount: aDestinationAccount.
	
	transfer := self new.
	depositLeg := DepositLeg on: anOriginAccount fromTransfer: transfer.
	withdrawLeg := WithdrawLeg on: aDestinationAccount fromTransfer: transfer.
	
	^transfer initializeWith: anAmountOfPesos depositLeg: depositLeg withdrawLeg: withdrawLeg.! !
