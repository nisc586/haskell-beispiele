-- PATTERN MATCHING UND REKURSION

-- Fibbonacci Folge: nächste Zahl ergibt sich aus seinen beiden Vorgängern
-- fibonacci n ergibt die n-te Fibonaccizahl
fibonacci:: Integer -> Integer
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n
    | n < 0 = error "negative index"
    | otherwise = fibonacci (n-1) + fibonacci (n-2)

-- f 5 ergibt 8
-- f 20 ergibt 10946

-- isEven und isOdd sind verschränkt rekursiv
isEven :: Integer -> Bool
isEven 0 = True
isEven n = isOdd (n-1)


isOdd:: Integer -> Bool
isOdd 1 = True
isOdd n = isEven (n-1)

-- Pattern Matching mit Listen
einkaufsliste = ["Chips", "Gurken", "Kakao", "Bananen", "Milch"]
-- Listen können mit dem Constructor gebaut werden (: heißt Constructor)
einkaufsliste' = "Chips":"Gurken":"Kakao":"Bananen":"Milch":[]

-- "Mehl":einkaufsliste ergibt ["Mehl","Chips","Gurken","Kakao","Bananen","Milch"]

-- Strings sind Listen von Characters --> [Char] = String
name = "Bob"
name' = 'B':'o':'b':[]


-- Beginnt ein Wort mit B?
bWord:: String -> Bool
bWord ('b':rest) = True
bWord ('B':rest) = True
bWord _ = False  -- _ ist eine wild card, matcht mit allem, wird nicht gespeichert


-- Hat jemand einen Doktortitel?
isDoctor:: String -> Bool
isDoctor ('D':'r':'.':rest) = True
isDoctor x = False
-- isDoctor "Dr. Frankenstein" ergibt True
-- isDoctor "Herr Hase" ergibt False
-- isDoctor "Prof. Dr. Stark" ergibt False


-- verbesserte Version
isDoctor':: String -> Bool
isDoctor' ('D':'r':'.':rest) = True
isDoctor' (x:rest) = isDoctor' rest
isDoctor' [] = False
-- isDoctor "Prof. Dr. Stark" ergibt True


-- elem Funktion selbst schreiben
elem':: String -> [String] -> Bool
elem' e [] = False
elem' e (x:xs) = (e == x || elem' e xs)
-- elem "Kakao" einkaufliste ergibt True

