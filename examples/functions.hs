helloWorld = "Hallo Welt!"

inc x = x + 1

double x = x + x

square x = x**2

fläche r = pi * r**2

doubles x y = double x + double y

doubleSmall x = if x < 10 then x * 2 else 4

conanO'Brien = "It's a-me, Conan O'Brien!"

-- Definition mit Typ
greetings:: String -> String
greetings name =
    if length name > 10 then
        "Hello mate!"
    else
        "Hello " ++ name ++ "!" 

-- Listen
einkaufsListe = ["Nudeln", "Äpfel", "Salz", "Eier", "Schokolade"]
eggs =  einkaufsListe !! 3
firstTwo = take 2 einkaufsListe

erste = head [4, 2, 8, 9, 3, 1]
rest = tail [4, 2, 8, 9, 3, 1]
listMax = maximum [4, 2, 8, 9, 3, 1]
listMin = minimum [4, 2, 8, 9, 3, 1]


-- Ranges
twenty = [1.. 20]
alphabet = ['a' .. 'z']
fToM = ['F' .. 'M']
interval = [0.1, 0.2 .. 1]

-- Beispiel Rekursion

halbiereBisEins x = 
    if x <= 1 then
        0
    else
        1 + halbiereBisEins (x / 2)


-- Boolesche Ausdrücke
-- eine Zahl ist eine glückliche Zahl, wenn sie nicht durch 2 7 oder 9 teilbar ist
isLucky n = (mod n 2) /= 0 && (mod n 7) /= 0 && (mod n 9) /= 0


{-- | Gegeben sind a, b und c. Gib die Anzahl der reellen Lösungen für die 
quadratische Gleichung 0 = a * x^2 + b * x + c aus.
-}
numOfSolutions :: (Ord a, Num a) => a -> a -> a -> Int
numOfSolutions a b c
    | disc > 0 = 2
    | disc == 0 = 1
    | otherwise = 0
    where disc = b^2 - 4*a*c


-- Rekursiv und mit Pattern matching
maximum' :: (Ord a) => [a] -> a  
maximum' [] = error "maximum of empty list"  
maximum' [x] = x  
maximum' (x:xs) = max x (maximum' xs)

