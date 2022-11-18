!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-2'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: 'newLine'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 15:42:40'!
test01ReceptiveAccountSummaryIsOnlyTheBalanceWhenCreated

	| account |
	account := ReceptiveAccount new.
	AccountSummary from: account.

	self assert: 'Balance = 0 * pesos' equals: (AccountSummary from: account) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:00:10'!
test02WhenADepositIsRegisteredItAppearsOnReceptiveAccountSummary

	| account expectedSummary|
	
	account := ReceptiveAccount new.
	Deposit register: 100*peso on: account.
	expectedSummary := 'Deposit for 100 * pesos', newLine, 'Balance = 100 * pesos'.

	self assert: expectedSummary equals: (AccountSummary from: account) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:00:21'!
test03WhenAWithdrawIsRegisteredItAppearsOnReceptiveAccountSummary

	| account expectedSummary|
	
	account := ReceptiveAccount new.
	Withdraw register: 100*peso on: account.
	expectedSummary := 'Withdraw for 100 * pesos', newLine, 'Balance = -100 * pesos'.

	self assert: expectedSummary equals: (AccountSummary from: account) compute. ! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:00:27'!
test04WhenADepositByTransferIsRegisteredItAppearsOnReceptiveAccountSummary

	| destinationAccount originAccount expectedSummary |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	expectedSummary := 'Deposit by transfer for 100 * pesos', newLine, 'Balance = 100 * pesos'.

	self assert: expectedSummary equals: (AccountSummary from: destinationAccount) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:00:33'!
test05WhenAWithdrawByTransferIsRegisteredItAppearsOnReceptiveAccountSummary

	| destinationAccount originAccount expectedSummary |
	
	destinationAccount := ReceptiveAccount new.
	originAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	expectedSummary :=  'Withdraw by transfer for 100 * pesos', newLine, 'Balance = -100 * pesos'.

	self assert: expectedSummary equals: (AccountSummary from: originAccount) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:00:59'!
test06WhenMultipleTransactionsAreRegisteredAllAppearsOnReceptiveAccountSummary

	| account account2  expectedSummary |
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100*peso on: account.
	Withdraw register: 50*peso on: account.
	Transfer amount: 20*peso from: account to: account2.
	Transfer amount: 30*peso from: account2 to: account.
	expectedSummary := 'Deposit for 100 * pesos', newLine, 'Withdraw for 50 * pesos', newLine, 'Withdraw by transfer for 20 * pesos', newLine, 'Deposit by transfer for 30 * pesos', newLine, 'Balance = 60 * pesos'.

	self assert: expectedSummary equals: (AccountSummary from: account) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 15:59:30'!
test07PortfolioSummaryIsOnlyTheBalanceWhenCreated

	| portfolio |
	portfolio := Portfolio new.
	self assert: 'Balance = 0 * pesos' equals: (AccountSummary from: portfolio) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:02:06'!
test08WhenADepositIsRegisteredItAppearsOnPortfolioSummary

	| portfolio account expectedResult|
	account:= ReceptiveAccount new.
	portfolio := Portfolio with: account.
	Deposit register: 100 * peso on: account.
	expectedResult := 'Deposit for 100 * pesos', newLine, 'Balance = 100 * pesos'.
	
	self assert: expectedResult equals: (AccountSummary from: portfolio) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:03:10'!
test09WhenAWithdrawIsRegisteredItAppearsOnPortfolioSummary

	| portfolio account expectedResult |
	account:= ReceptiveAccount new.
		portfolio := Portfolio with: account.
	Withdraw register: 100 * peso on: account.
	expectedResult := 'Withdraw for 100 * pesos', newLine,  'Balance = -100 * pesos'.
	self assert: expectedResult equals: (AccountSummary from: portfolio) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:04:06'!
test10WhenAWithdrawByTransferIsRegisteredItAppearsOnPortfolioSummary

	| portfolio account account2 expectedResult |
	account:= ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	Transfer amount: 100*peso from: account to: account2.
	
	expectedResult:= 'Withdraw by transfer for 100 * pesos', newLine, 'Balance = -100 * pesos'.
	self assert: expectedResult equals: (AccountSummary from: portfolio) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:05:03'!
test11WhenADepositByTransferIsRegisteredItAppearsOnPortfolioSummary

	| portfolio account account2 expectedResult |
	account:= ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	Transfer amount: 100*peso from: account2 to: account.
	expectedResult := 'Deposit by transfer for 100 * pesos', newLine, 'Balance = 100 * pesos'.
	self assert: expectedResult equals: (AccountSummary from: portfolio) compute.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'pg 11/16/2022 16:06:53'!
test12WeCanAddTransactionsAndComputeWillDifferFromBefore

	| account accountSummary expectedResult|
	
	account := ReceptiveAccount new.
	accountSummary := AccountSummary from: account.
	Deposit register: 100*peso on: account.
	expectedResult := 'Deposit for 100 * pesos', newLine, 'Balance = 100 * pesos'.
	
	self assert: expectedResult equals: accountSummary compute.
	
	Withdraw register: 50*peso on: account.
	expectedResult := 'Deposit for 100 * pesos', newLine, 'Withdraw for 50 * pesos', newLine, 'Balance = 50 * pesos'.
	self assert: expectedResult equals: accountSummary compute.
! !


!AccountSummaryTest methodsFor: 'setUp' stamp: 'pg 11/17/2022 00:34:31'!
setUp

	newLine := String newLineString ! !


!classDefinition: #PortfolioDetailedTreePrinterTest category: 'ServiciosFinancieros-2'!
TestCase subclass: #PortfolioDetailedTreePrinterTest
	instanceVariableNames: 'newLine tab'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!PortfolioDetailedTreePrinterTest methodsFor: 'setUp/tearDown' stamp: 'pg 11/17/2022 16:28:18'!
setUp
	
	newLine := String newLineString .
	tab := String tab
! !


!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 17:24:16'!
test01PortfolioDetailedTreeShowsItsNameAndBalanceWhenCreated

	| algo3Portfolio expectedTree|
	
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3'.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Balance = 0 * pesos'.
	
	self assert: expectedTree equals: (PortfolioDetailedTreePrinter from: algo3Portfolio) compute.! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 17:33:42'!
test02PortfolioDetailedTreeShowsReceptiveAccountNameAndBalanceWhenAdded

	| algo3Portfolio  claudiosAccount expectedTree |

	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: claudiosAccount.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Cuenta de Claudio', newLine, tab, tab, 'Balance = 0 * pesos', newLine, tab, 'Balance = 0 * pesos'.
	
	self assert: expectedTree equals: (PortfolioDetailedTreePrinter from: algo3Portfolio) compute.! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 17:30:20'!
test03PortfolioDetailedTreeShowsReceptiveAccountTransactions

	| algo3Portfolio  claudiosAccount expectedTree |

	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	Deposit register: 50 * peso on: claudiosAccount.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: claudiosAccount.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Cuenta de Claudio', newLine, tab, tab, 'Deposit for 50 * pesos', newLine, tab, tab, 'Balance = 50 * pesos', newLine, tab, 'Balance = 50 * pesos'.
	
	self assert: expectedTree equals: (PortfolioDetailedTreePrinter from: algo3Portfolio) compute.! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 17:33:35'!
test04PortfolioDetailedTreeShowsPortfolioNameAndBalanceWhenAdded

	| algo3Portfolio  petersPortfolio expectedTree |

	petersPortfolio := Portfolio named: 'Portfolio de Pedro'.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: petersPortfolio .
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Portfolio de Pedro',newLine, tab, tab, 'Balance = 0 * pesos', newLine, tab, 'Balance = 0 * pesos'.
	
	self assert: expectedTree equals: (PortfolioDetailedTreePrinter from: algo3Portfolio) compute.! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 17:34:42'!
test05PortfolioDetailedTreeWithTwoLevelDepthShowsAppropiateIndentationSpace

	| algo3Portfolio  petersPortfolio claudiosAccount expectedTree |
	
	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	Deposit register: 100 * peso on: claudiosAccount.
	petersPortfolio := Portfolio named: 'Portfolio de Pedro' with: claudiosAccount.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: petersPortfolio .
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Portfolio de Pedro',newLine, tab, tab, 'Cuenta de Claudio', newLine, tab, tab, tab, 'Deposit for 100 * pesos',  newLine, tab, tab, tab, 'Balance = 100 * pesos', newLine, tab, tab, 'Balance = 100 * pesos', newLine, tab, 'Balance = 100 * pesos'.
	
	self assert: expectedTree equals: (PortfolioDetailedTreePrinter from: algo3Portfolio) compute.! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 17:35:13'!
test06PortfolioDetailedTreeShowsAppropiateIndentationSpaceAccordingEachAccountDepth

	| algo3Portfolio  petersPortfolio claudiosAccount  myAccount expectedTree |
	
	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	Deposit register: 100 * peso on: claudiosAccount.
	Deposit register: 100 * peso on: myAccount.
	petersPortfolio := Portfolio named: 'Portfolio de Pedro' with: claudiosAccount.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: petersPortfolio with: myAccount.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Portfolio de Pedro',newLine, tab, tab, 'Cuenta de Claudio', newLine, tab, tab, tab, 'Deposit for 100 * pesos',  newLine, tab, tab, tab, 'Balance = 100 * pesos', newLine, tab, tab, 'Balance = 100 * pesos', newLine, tab, 'Cuenta mia', newLine, tab, tab, 'Deposit for 100 * pesos', newLine, tab, tab, 'Balance = 100 * pesos', newLine, tab, 'Balance = 200 * pesos'.
	
	self assert: expectedTree equals: (PortfolioDetailedTreePrinter from: algo3Portfolio) compute.! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 17:29:26'!
test07WeCanAddAccountAndComputeWillDiffer

	| algo3Portfolio claudiosAccount expectedTree|
	
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3'.
	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Balance = 0 * pesos'.
	
	self assert: expectedTree equals: (PortfolioDetailedTreePrinter from: algo3Portfolio) compute.
	
	algo3Portfolio add: claudiosAccount.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Cuenta de Claudio', newLine, tab, tab, 'Balance = 0 * pesos', newLine, tab, 'Balance = 0 * pesos'.
	
	self assert: expectedTree equals: (PortfolioDetailedTreePrinter from: algo3Portfolio) compute.! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-2'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: 'newLine tab'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!PortfolioTreePrinterTest methodsFor: 'setUp/tearDown' stamp: 'pg 11/17/2022 00:34:01'!
setUp
	
	newLine := String newLineString .
	tab := String tab
! !


!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 01:14:40'!
test01PortfolioTreePrinterIsJustHisNameWhenCreated

	| algo3Portfolio|
	
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3'.
	
	self assert: 'Portfolio de algoritmos 3' equals: (PortfolioTreePrinter from: algo3Portfolio) compute.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 01:16:54'!
test02PortfolioTreePrinterWithAccountShowsAccountWithIndentationSpace

	| algo3Portfolio  claudiosAccount expectedTree |

	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: claudiosAccount.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Cuenta de Claudio'.
	
	self assert: expectedTree equals: (PortfolioTreePrinter from: algo3Portfolio) compute.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 01:16:43'!
test03PortfolioTreePrinterWithPortfolioShowsPortfolioWithIndentationSpace

	| algo3Portfolio  petersPortfolio expectedTree |

	petersPortfolio := Portfolio named: 'Portfolio de Pedro'.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: petersPortfolio .
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Portfolio de Pedro'.
	
	self assert: expectedTree equals: (PortfolioTreePrinter from: algo3Portfolio) compute.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 01:17:54'!
test04PortfolioTreePrinterWithMultipleAccountsShowsThemAtTheSameIndentaitionSpace

	| algo3Portfolio  petersPortfolio claudiosAccount expectedTree |

	petersPortfolio := Portfolio named: 'Portfolio de Pedro'.
	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: petersPortfolio with: claudiosAccount.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Portfolio de Pedro', newLine, tab, 'Cuenta de Claudio'.
	
	self assert: expectedTree equals: (PortfolioTreePrinter from: algo3Portfolio) compute.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 01:21:10'!
test05PortfolioTreePrinterWithTwoLevelDepthShowsAppropiateIndentationSpace

	| algo3Portfolio  petersPortfolio claudiosAccount expectedTree |

	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	petersPortfolio := Portfolio named: 'Portfolio de Pedro' with: claudiosAccount.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: petersPortfolio.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Portfolio de Pedro', newLine, tab, tab, 'Cuenta de Claudio'.
	
	self assert: expectedTree equals: (PortfolioTreePrinter from: algo3Portfolio) compute.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 01:20:34'!
test06PortfioTreePrinterShowsAppropiateIndentationSpaceAccordingEachAccountDepth

	| algo3Portfolio  petersPortfolio claudiosAccount johnsPortfolio myAccount expectedTree |

	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	johnsPortfolio := Portfolio named: 'Portfolio de Juan' with: myAccount.
	petersPortfolio := Portfolio named: 'Portfolio de Pedro' with: claudiosAccount with: johnsPortfolio.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: petersPortfolio..
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Portfolio de Pedro', newLine, tab, tab, 'Cuenta de Claudio',  newLine, tab, tab, 'Portfolio de Juan', newLine, tab, tab, tab, 'Cuenta mia'.
	
	self assert: expectedTree equals: (PortfolioTreePrinter from: algo3Portfolio) compute.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 01:21:53'!
test07PortfolioTreePrinterShowsAppropiateIndentationSpaceAccordingToEachAccountDepthAndOrder

	| algo3Portfolio  petersPortfolio claudiosAccount johnsPortfolio myAccount lastPortfolio expectedTree |

	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	myAccount := ReceptiveAccount named: 'Cuenta mia'.
	johnsPortfolio := Portfolio named: 'Portfolio de Juan' with: myAccount.
	petersPortfolio := Portfolio named: 'Portfolio de Pedro' with: claudiosAccount with: johnsPortfolio.
	lastPortfolio := Portfolio named: 'Portfolio ultimo'.
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3' with: petersPortfolio with: lastPortfolio.
	expectedTree := 'Portfolio de algoritmos 3', newLine, tab, 'Portfolio de Pedro', newLine, tab, tab, 'Cuenta de Claudio',  newLine, tab, tab, 'Portfolio de Juan', newLine, tab, tab, tab, 'Cuenta mia', newLine, tab, 'Portfolio ultimo' .
	
	self assert: expectedTree equals: (PortfolioTreePrinter from: algo3Portfolio) compute.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'pg 11/17/2022 17:26:57'!
test08WeCanAddAccountAndComputeWillDiffer

	| algo3Portfolio claudiosAccount|
	
	algo3Portfolio := Portfolio named: 'Portfolio de algoritmos 3'.
	
	self assert: 'Portfolio de algoritmos 3' equals: (PortfolioTreePrinter from: algo3Portfolio) compute.
	
	claudiosAccount := ReceptiveAccount named: 'Cuenta de Claudio'.
	algo3Portfolio add: claudiosAccount.
	
	self assert: ('Portfolio de algoritmos 3', newLine, tab, 'Cuenta de Claudio') equals: (PortfolioTreePrinter from: algo3Portfolio) compute.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

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


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-2'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 19:02:47'!
test01ReceptiveAccountTransferNetIsZeroWhenRepectiveAccountIsCreated

	| account |
	
	account := ReceptiveAccount new.
	
	self assert: 0*peso equals: (TransferNet from: account) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 19:02:54'!
test02ReceptiveAccountTransferNetIsAffectedByATransferWIthdraw

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	
	self assert: -100*peso equals: (TransferNet from: originAccount) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 19:03:04'!
test03ReceptiveAccountTransferNetIsAffectedByATransferDeposit

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	
	self assert: 100*peso equals: (TransferNet from: destinationAccount) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 19:03:11'!
test04ReceptiveAccountTransferNetIsNotAffectedByADeposit

	| account  |
	
	account := ReceptiveAccount new.
	Deposit register: 100*peso on: account.
	
	self assert: 0*peso equals: (TransferNet from: account) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 19:03:18'!
test05ReceptiveAccountTransferNetIsNotAffectedByAWithdraw

	| account |
	
	account := ReceptiveAccount new.
	Withdraw register: 100*peso on: account.
	
	self assert: 0*peso equals: (TransferNet from: account) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 18:43:58'!
test06TransferNetWorksWithMultipleTransactions

	| account account2|
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Withdraw register: 100*peso on: account.
	Deposit register: 20*peso on: account.
	Transfer amount: 30*peso from: account to: account2.
	Transfer amount: 10*peso from: account2 to: account.
	
	self assert: -20*peso equals: (TransferNet from: account) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 18:59:28'!
test07PortfolioTransferNetIsZeroWhenRepectiveAccountIsCreated

	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0*peso equals: (TransferNet from: portfolio) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 19:00:19'!
test08PortfolioTransferNetIsAffectedByATransferWIthdraw

	| originAccount destinationAccount portfolio|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	portfolio := Portfolio new.
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	portfolio add: originAccount.
	
	self assert: -100*peso equals: (TransferNet from: portfolio) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 19:01:00'!
test09PortfolioTransferNetIsAffectedByATransferDeposit

	| originAccount destinationAccount portfolio|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	portfolio := Portfolio new.
	Transfer amount: 100*peso from: originAccount to: destinationAccount.
	portfolio add: destinationAccount.
	
	self assert: 100*peso equals: (TransferNet from: portfolio) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 19:02:01'!
test10PortfolioTransferNetIsNotAffectedByADeposit

	| account  portfolio|
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	Deposit register: 100*peso on: account.
	portfolio add: account.
	
	self assert: 0*peso equals: (TransferNet from: portfolio) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/13/2022 19:02:36'!
test11PortfolioTransferNetIsNotAffectedByAWithdraw

	| account portfolio|
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	Withdraw register: 100*peso on: account.
	portfolio add: account.
	
	self assert: 0*peso equals: (TransferNet from: portfolio) compute.! !

!TransferNetTest methodsFor: 'tests' stamp: 'pg 11/15/2022 23:03:32'!
test12WeCanAddTransactionsAndComputeWillDifferFromBefore

	| originAccount destinationAccount|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	Withdraw register: 100*peso on: originAccount.
	
	self assert: 0*peso equals: (TransferNet from: originAccount) compute.
	
	Transfer amount: 110*peso from: originAccount  to: destinationAccount.
	
	self assert: -110*peso equals: (TransferNet from: originAccount) compute.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-2'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'visitor special reports' stamp: 'pg 11/17/2022 00:09:04'!
accept: aSpecialReport

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!Portfolio methodsFor: 'initialization' stamp: 'pg 11/16/2022 18:24:53'!
initialize

	^self initializeNamed: 'Portfolio'! !

!Portfolio methodsFor: 'initialization' stamp: 'pg 11/16/2022 18:15:44'!
initializeNamed: aName

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	name := aName.! !


!Portfolio methodsFor: 'main protocol' stamp: 'pg 11/11/2022 20:17:51'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'pg 11/16/2022 23:49:51'!
name

	^name ! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'pg 11/17/2022 00:01:02'!
accounts

	^accounts copy! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'visitor special reports' stamp: 'pg 11/17/2022 00:09:23'!
accept: aSpecialReport

	^aSpecialReport visitPortfolio: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errors' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'pg 11/16/2022 18:24:28'!
named: aName

	^self new initializeNamed: aName! !

!Portfolio class methodsFor: 'instance creation' stamp: 'pg 11/16/2022 18:17:53'!
named: aName with: anAccount
	^self new
		initializeNamed: aName;
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'pg 11/16/2022 18:17:37'!
named: aName with: anAccount with: anotherAccount

	^self new
		initializeNamed: aName;
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'pg 11/16/2022 18:19:11'!
with: anAccount

	^self named: 'Portfolio' with: anAccount.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'pg 11/16/2022 18:18:56'!
with: anAccount with: anotherAccount

	^self named: 'Portfolio' with: anAccount with: anotherAccount! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'pg 11/16/2022 18:25:14'!
initialize

	^self initializeNamed: 'Account'! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'pg 11/16/2022 18:23:06'!
initializeNamed: aName

	name := aName.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'pg 11/11/2022 20:16:12'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'pg 11/16/2022 23:50:22'!
name

	^name! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'visitor special reports' stamp: 'pg 11/17/2022 00:09:36'!
accept: aSpecialReport

	^aSpecialReport visitReceptiveAccount: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-2'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'pg 11/16/2022 18:22:51'!
named: aName

	^self new initializeNamed: aName! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'visitor reports' stamp: 'pg 11/18/2022 10:36:34'!
accept: aReport

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'visitor reports' stamp: 'pg 11/15/2022 21:27:41'!
accept: aReport

	^aReport visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-2'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-2'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-2'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'visitor reports' stamp: 'pg 11/15/2022 21:28:07'!
accept: aReport

	^aReport visitDepositByTransfer: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-2'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'visitor reports' stamp: 'pg 11/15/2022 21:28:23'!
accept: aReport

	^aReport visitWithdrawByTransfer: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'visitor reports' stamp: 'pg 11/15/2022 21:28:47'!
accept: aReport

	^aReport visitWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-2'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!Report methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:28:36'!
visitDeposit: aDeposit

	self subclassResponsibility ! !

!Report methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:28:45'!
visitDepositByTransfer: aDepositByTransfer

	self subclassResponsibility ! !

!Report methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:29:03'!
visitWithdraw: aWithdraw

	self subclassResponsibility ! !

!Report methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:28:56'!
visitWithdrawByTransfer: aWithdrawByTransfer

	self subclassResponsibility ! !


!Report methodsFor: 'initialization' stamp: 'pg 11/18/2022 12:28:23'!
initializeWith: anAccount

	self subclassResponsibility ! !


!Report methodsFor: 'compute' stamp: 'pg 11/18/2022 12:28:28'!
compute

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-2'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'pg 11/18/2022 12:26:10'!
from: anAccount

	^self new initializeWith: anAccount! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-2'!
Report subclass: #AccountSummary
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!AccountSummary methodsFor: 'compute' stamp: 'pg 11/17/2022 00:35:00'!
compute

	|summary|
	summary := ''.
	(account transactions) do: [:aTransaction | summary := summary, (aTransaction accept: self), String newLineString].
	summary := summary,('Balance = ',  account balance asString).
	^summary.! !


!AccountSummary methodsFor: 'visitor transactions' stamp: 'pg 11/15/2022 21:32:18'!
visitDeposit: aDeposit
	
	^'Deposit for ', (aDeposit value asString)! !

!AccountSummary methodsFor: 'visitor transactions' stamp: 'pg 11/15/2022 21:32:36'!
visitDepositByTransfer: aDepositByTransfer

	^'Deposit by transfer for ', (aDepositByTransfer value asString)! !

!AccountSummary methodsFor: 'visitor transactions' stamp: 'pg 11/15/2022 21:32:53'!
visitWithdraw: aWithdraw

	^'Withdraw for ', (aWithdraw value asString)! !

!AccountSummary methodsFor: 'visitor transactions' stamp: 'pg 11/15/2022 21:33:10'!
visitWithdrawByTransfer: aWithdrawByTransfer

	^'Withdraw by transfer for ', (aWithdrawByTransfer value asString)! !


!AccountSummary methodsFor: 'initialization' stamp: 'pg 11/18/2022 12:27:04'!
initializeWith: anAccount

	account := anAccount! !


!classDefinition: #PortfolioTreePrinterReports category: 'ServiciosFinancieros-2'!
Report subclass: #PortfolioTreePrinterReports
	instanceVariableNames: 'portfolio tabCounter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!PortfolioTreePrinterReports methodsFor: 'initialization' stamp: 'pg 11/17/2022 17:49:08'!
initializeWith: aPortfolio

	portfolio := aPortfolio.
	tabCounter := 1.! !


!PortfolioTreePrinterReports methodsFor: 'compute' stamp: 'pg 11/17/2022 18:05:56'!
computeBasicTree
	
	|resultingTree |
	resultingTree := portfolio name.
	(portfolio accounts) do: 
	[:anAccount | resultingTree := resultingTree, String newLineString, String tab, (anAccount accept: self).
		tabCounter := 1.].
	
	^resultingTree! !


!PortfolioTreePrinterReports methodsFor: 'visitor accounts' stamp: 'pg 11/17/2022 18:05:22'!
basicVisitPortfolio: aPortfolio

	|resultingTree |
	resultingTree := aPortfolio name.
	tabCounter := tabCounter + 1.
	(aPortfolio accounts) do: 
	[:anAccount | resultingTree := resultingTree, String newLineString. 
		tabCounter timesRepeat: [resultingTree:= resultingTree, String tab].
		resultingTree:= resultingTree, (anAccount accept: self).
		tabCounter := tabCounter - 1.].
	
	^resultingTree! !

!PortfolioTreePrinterReports methodsFor: 'visitor accounts' stamp: 'pg 11/18/2022 12:24:33'!
basicVisitReceptiveAccount: aReceptiveAccount

	| resultingTree transactionsSummary|
	resultingTree := aReceptiveAccount name.
	tabCounter := tabCounter + 1.
	transactionsSummary := self getTransactionsFrom: aReceptiveAccount.
	transactionsSummary do: 
	[:aTransactionSummaryLine | 
		resultingTree := resultingTree, String newLineString.
		tabCounter timesRepeat: [resultingTree:= resultingTree, String tab].
		resultingTree := resultingTree, aTransactionSummaryLine].
	
	^resultingTree! !

!PortfolioTreePrinterReports methodsFor: 'visitor accounts' stamp: 'pg 11/17/2022 18:08:02'!
visitPortfolio: aPortfolio

	self subclassResponsibility ! !

!PortfolioTreePrinterReports methodsFor: 'visitor accounts' stamp: 'pg 11/18/2022 12:11:12'!
visitReceptiveAccount: aReceptiveAccount

	self subclassResponsibility ! !


!PortfolioTreePrinterReports methodsFor: 'private' stamp: 'pg 11/18/2022 12:11:54'!
getTransactionsFrom: aReceptiveAccount

	| transactions |
	
	transactions := OrderedCollection new.
	
	(aReceptiveAccount transactions) do: [:aTransaction | transactions add: (aTransaction accept: self)].
	^transactions
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinterReports class' category: 'ServiciosFinancieros-2'!
PortfolioTreePrinterReports class
	instanceVariableNames: ''!

!PortfolioTreePrinterReports class methodsFor: 'instance creation' stamp: 'pg 11/17/2022 17:41:14'!
from: aPortfolio

	^self new initializeWith: aPortfolio! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-2'!
PortfolioTreePrinterReports subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!PortfolioDetailedTreePrinter methodsFor: 'visitor accounts' stamp: 'pg 11/17/2022 18:05:22'!
visitPortfolio: aPortfolio

	|resultingTree |
	resultingTree := self basicVisitPortfolio: aPortfolio.
	resultingTree := resultingTree, String newLineString.
	tabCounter timesRepeat: [resultingTree:= resultingTree, String tab]. 
	resultingTree:= resultingTree, 'Balance = ', ((aPortfolio balance) asString).
	^resultingTree.! !

!PortfolioDetailedTreePrinter methodsFor: 'visitor accounts' stamp: 'pg 11/18/2022 12:15:19'!
visitReceptiveAccount: aReceptiveAccount

	|resultingTree|
	resultingTree := self basicVisitReceptiveAccount: aReceptiveAccount.
	resultingTree := resultingTree, String newLineString.
	tabCounter timesRepeat: [resultingTree:= resultingTree, String tab].
	resultingTree := resultingTree, ('Balance = ',  aReceptiveAccount balance asString).
	^resultingTree 
	

! !


!PortfolioDetailedTreePrinter methodsFor: 'compute' stamp: 'pg 11/17/2022 18:05:56'!
compute

	| resultingTree |
	
	resultingTree := self computeBasicTree.
	
	resultingTree := resultingTree, String newLineString, String tab, 'Balance = ', ((portfolio balance) asString).
	
	^resultingTree
	! !


!PortfolioDetailedTreePrinter methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:03:27'!
visitDeposit: aDeposit
	
	^'Deposit for ', (aDeposit value asString)! !

!PortfolioDetailedTreePrinter methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:03:36'!
visitDepositByTransfer: aDepositByTransfer

	^'Deposit by transfer for ', (aDepositByTransfer value asString)! !

!PortfolioDetailedTreePrinter methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:03:49'!
visitWithdraw: aWithdraw

	^'Withdraw for ', (aWithdraw value asString)! !

!PortfolioDetailedTreePrinter methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:03:58'!
visitWithdrawByTransfer: aWithdrawByTransfer

	^'Withdraw by transfer for ', (aWithdrawByTransfer value asString)! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-2'!
PortfolioTreePrinterReports subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!PortfolioTreePrinter methodsFor: 'visitor accounts' stamp: 'pg 11/17/2022 18:05:22'!
visitPortfolio: aPortfolio

	^self basicVisitPortfolio: aPortfolio
	
! !

!PortfolioTreePrinter methodsFor: 'visitor accounts' stamp: 'pg 11/18/2022 12:11:36'!
visitReceptiveAccount: aReceptiveAccount

	^self basicVisitReceptiveAccount: aReceptiveAccount.
	
! !


!PortfolioTreePrinter methodsFor: 'compute' stamp: 'pg 11/17/2022 18:05:56'!
compute
	
	^self computeBasicTree
	
	! !


!PortfolioTreePrinter methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:04:48'!
visitDeposit: aDeposit! !

!PortfolioTreePrinter methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:04:59'!
visitDepositByTransfer: aDepositByTransfer! !

!PortfolioTreePrinter methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:05:29'!
visitWithdraw: aWithdraw! !

!PortfolioTreePrinter methodsFor: 'visitor transactions' stamp: 'pg 11/18/2022 12:05:22'!
visitWithdrawByTransfer: aWithdrawByTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-2'!
PortfolioTreePrinter class
	instanceVariableNames: 'tabCounter'!


!classDefinition: #TransferNet category: 'ServiciosFinancieros-2'!
Report subclass: #TransferNet
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!TransferNet methodsFor: 'compute' stamp: 'pg 11/15/2022 23:00:48'!
compute

	| transferNetBalance |
	
	transferNetBalance := 0*peso.
	account transactions do: [:aTransaction | transferNetBalance := transferNetBalance + (aTransaction accept: self)].
	^transferNetBalance
		
! !


!TransferNet methodsFor: 'visitor transactions' stamp: 'pg 11/15/2022 22:59:43'!
visitDeposit: aDeposit

	^ 0*peso! !

!TransferNet methodsFor: 'visitor transactions' stamp: 'pg 11/15/2022 22:59:37'!
visitDepositByTransfer: aDepositByTransfer

	^aDepositByTransfer value! !

!TransferNet methodsFor: 'visitor transactions' stamp: 'pg 11/15/2022 22:59:27'!
visitWithdraw: aWithdraw

	^0 *peso! !

!TransferNet methodsFor: 'visitor transactions' stamp: 'pg 11/15/2022 22:59:19'!
visitWithdrawByTransfer: aWithdrawByTransfer

	^aWithdrawByTransfer value negated! !


!TransferNet methodsFor: 'initialization' stamp: 'pg 11/18/2022 12:27:14'!
initializeWith: anAccount

	account := anAccount! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-2'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-2'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
