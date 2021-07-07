-- EIGENE DATENTYPEN
-- mit dem "data"-Keyword kann man eigene Typen basteln

-- Man kann Typen definieren, indem man die Werte aufzählt
data Day = Montag | Dienstag | Mittwoch | Freitag | Samstag | Sonntag

isWeekend:: Day -> Bool
isWeekend Samstag = True
isWeekend Sonntag = True
isWeekend d = False

-- isWeekend Freitag ergibt False
-- isWeekend Samstag ergibt True


-- Syntax:
-- 'data' Name = Konstruktor Parameter1(Typ) Parameter2(Typ) ...
-- mit | kann man mehere Konstruktoren aneinander hängen
data Shape = Circle Float | Square Float | Rectangle Float Float

area:: Shape -> Float
area (Circle r) = pi*r^2
area (Square a) = a^2
area (Rectangle a b) = a*b

-- area (Circle 4) ergibt 50.265484
-- area (Square 3) ergibt 9
-- area (Rectange 5 6) ergibt 30
-- area 3 ergibt error, weil 3 keine "Shape" ist

circumference:: Shape -> Float
circumference (Circle r) = 2*pi*r
circumference (Square a) = 4*a
circumference (Rectangle a b) = 2*a + 2*b

