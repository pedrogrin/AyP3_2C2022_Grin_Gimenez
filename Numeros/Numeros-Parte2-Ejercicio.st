!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'pg 10/2/2022 16:50:42'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'PG 9/29/2022 00:42:31'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'pg 10/2/2022 18:19:22'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'pg 10/2/2022 18:21:18'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'pg 10/2/2022 16:51:39'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:46:52'!
multiplicarConElEntero: unEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:47:17'!
multiplicarConLaFraccion: unaFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:47:52'!
seLeDivideALaFraccion: unaFraccion

	self subclassResponsibility 
	! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:48:19'!
seLeDivideAlEntero: unEntero

	self subclassResponsibility! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:48:50'!
seRestaALaFraccion: unaFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:49:07'!
seRestaAlEntero: unEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:49:27'!
sumarConElEntero: unEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:49:53'!
sumarConLaFraccion: unaFraccion
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'pg 10/2/2022 16:20:25'!
* aMultiplier 
	
	^aMultiplier multiplicarConElEntero: self
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'PG 9/30/2022 18:49:47'!
+ anAdder 
	
	^anAdder sumarConElEntero: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pg 10/2/2022 16:38:38'!
- aSubtrahend 
	
	^aSubtrahend seRestaAlEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pg 10/2/2022 16:32:57'!
/ aDivisor 
	
	^aDivisor seLeDivideAlEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pg 10/3/2022 20:19:44'!
fibonacci

	^self calcularFibonacci
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'pg 10/3/2022 20:12:36'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/3/2022 20:14:16'!
calcularFibonacci

	self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:37:16'!
multiplicarConElEntero: unEntero

	^unEntero class with: value * unEntero integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:42:22'!
multiplicarConLaFraccion: unaFraccion
	
	^self * unaFraccion numerator / unaFraccion denominator! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:45:32'!
seLeDivideALaFraccion: unaFraccion

	^unaFraccion numerator/ (unaFraccion denominator * self)! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:41:18'!
seLeDivideAlEntero: unEntero

	^Fraccion with: unEntero over: self! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:44:15'!
seRestaALaFraccion: unaFraccion
	
	^unaFraccion numerator - (unaFraccion denominator * self) / unaFraccion denominator! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:39:17'!
seRestaAlEntero: unEntero

	^unEntero class with: unEntero integerValue - self integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:36:18'!
sumarConElEntero: unEntero
	
	^unEntero class with: value + unEntero integerValue ! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:43:16'!
sumarConLaFraccion: unaFraccion

	^unaFraccion denominator * self + unaFraccion numerator / unaFraccion denominator! !


!Entero methodsFor: 'fraccion - initialization' stamp: 'pg 10/4/2022 13:07:27'!
accionParaElDenominadorConElNumerador: unNumerador

	^Fraccion new initializeWith: unNumerador over: self.! !

!Entero methodsFor: 'fraccion - initialization' stamp: 'pg 10/4/2022 13:08:06'!
accionParaElDividendoConElDivisor: unDivisor

	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := self greatestCommonDivisorWith: unDivisor. 
	numerator := self // greatestCommonDivisor.
	denominator := unDivisor // greatestCommonDivisor.
	
	^denominator accionParaElDenominadorConElNumerador: numerator! !

!Entero methodsFor: 'fraccion - initialization' stamp: 'pg 10/4/2022 13:08:32'!
accionParaElDivisorConElDividendo: unDividendo

	^unDividendo accionParaElDividendoConElDivisor: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'error descriptions' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !


!Entero class methodsFor: 'instance creation' stamp: 'pg 10/3/2022 20:09:15'!
cumpleTusRequisitos: unValor

	self subclassResponsibility ! !

!Entero class methodsFor: 'instance creation' stamp: 'pg 10/3/2022 20:10:44'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^(Entero subclasses detect: [:anEnteroSubclass | anEnteroSubclass cumpleTusRequisitos: aValue] ifNone: [^self]) new initializeWith: aValue. ! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'arithmetic operations - private' stamp: 'pg 10/3/2022 20:19:27'!
calcularFibonacci

	^Entero with: 1.! !


!Cero methodsFor: 'fraccion - initialization' stamp: 'pg 10/4/2022 12:54:22'!
accionParaElDividendoConElDivisor: unDivisor

	^self! !

!Cero methodsFor: 'fraccion - initialization' stamp: 'pg 10/4/2022 12:54:42'!
accionParaElDivisorConElDividendo: unDividendo

	^self error: Numero canNotDivideByZeroErrorDescription ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'instance creation' stamp: 'pg 10/3/2022 20:06:51'!
cumpleTusRequisitos: unValor
	
	^unValor = 0.! !


!classDefinition: #Negativos category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negativos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negativos methodsFor: 'arithmetic operations - private' stamp: 'pg 10/3/2022 20:16:25'!
calcularFibonacci

	^self error: Entero negativeFibonacciErrorDescription! !


!Negativos methodsFor: 'fraccion - initialization' stamp: 'pg 10/4/2022 12:56:41'!
accionParaElDivisorConElDividendo: unDividendo

	^unDividendo negated / self negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negativos class' category: 'Numeros-Parte2-Ejercicio'!
Negativos class
	instanceVariableNames: ''!

!Negativos class methodsFor: 'instance creation' stamp: 'pg 10/3/2022 20:07:08'!
cumpleTusRequisitos: unValor

	^unValor < 0! !


!classDefinition: #Positivos category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Positivos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Positivos methodsFor: 'arithmetic operations - private' stamp: 'pg 10/3/2022 20:19:02'!
calcularFibonacci
	| uno dos |
	uno := Entero with: 1.
	dos := Entero with: 2.
	
	^ (self - uno) fibonacci + (self - dos) fibonacci! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Positivos class' category: 'Numeros-Parte2-Ejercicio'!
Positivos class
	instanceVariableNames: ''!

!Positivos class methodsFor: 'instance creation' stamp: 'pg 10/3/2022 20:07:25'!
cumpleTusRequisitos: unValor

	^unValor > 1! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'arithmetic operations - private' stamp: 'pg 10/3/2022 20:19:32'!
calcularFibonacci

	^Entero with: 1.! !


!Uno methodsFor: 'fraccion - initialization' stamp: 'pg 10/4/2022 12:57:55'!
accionParaElDenominadorConElNumerador: unNumerador

	^unNumerador
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance creation' stamp: 'pg 10/3/2022 20:07:35'!
cumpleTusRequisitos: unValor

	^unValor = 1! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'pg 10/2/2022 16:20:17'!
* aMultiplier 
	
	^aMultiplier multiplicarConLaFraccion: self
	

	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PG 9/30/2022 18:51:17'!
+ anAdder 
	
	^anAdder sumarConLaFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'pg 10/2/2022 17:16:59'!
- aSubtrahend 
	
	^aSubtrahend seRestaALaFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'pg 10/2/2022 16:35:12'!
/ aDivisor 
	
	^aDivisor seLeDivideALaFraccion: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 17:13:09'!
multiplicarConElEntero: unEntero

	^unEntero multiplicarConLaFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:42:08'!
multiplicarConLaFraccion: unaFraccion

	^(unaFraccion numerator * numerator) / (unaFraccion denominator * denominator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:44:39'!
seLeDivideALaFraccion: unaFraccion

	^(unaFraccion numerator * denominator) / (unaFraccion denominator * numerator)! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 17:18:34'!
seLeDivideAlEntero: unEntero

	^unEntero * denominator / numerator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:43:57'!
seRestaALaFraccion: unaFraccion
	
	| newNumerator newDenominator |
	
	newNumerator := (unaFraccion numerator * denominator) - (unaFraccion denominator * numerator).
	newDenominator := unaFraccion denominator * denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:41:33'!
seRestaAlEntero: unEntero

	^unEntero * self denominator - self numerator / self denominator! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 17:15:13'!
sumarConElEntero: unEntero
	
	^unEntero sumarConLaFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations - private' stamp: 'pg 10/2/2022 16:42:52'!
sumarConLaFraccion: unaFraccion
	
	| newNumerator newDenominator |
	
	newNumerator := (unaFraccion numerator * denominator) + (unaFraccion denominator * numerator).
	newDenominator := unaFraccion denominator * denominator.
	
	^newNumerator / newDenominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'pg 10/4/2022 13:01:49'!
with: aDividend over: aDivisor
	
	^aDivisor accionParaElDivisorConElDividendo: aDividend
	! !
