import System.IO -- for file IO functions below

{--
Monaden
- IO ist eine Monade
- mathematischer Begriff
- Typklasse (wie Eq, Num), die return und bind kann
--}

{-- 
return :: a -> IO a
(>>=) :: IO a -> (a -> IO b) -> IO b   -- Bind

- Bind gibt das Ergebnis einer IO Aktion an die nächste IO Aktion weiter
- Return fügt an einen String, Char etc. den IO "Tag" hinzu
--}

printReverse:: IO ()
printReverse = getLine >>= (return . reverse) >>= putStrLn
--              IO String >>= (String -> IO String) >>= (String -> IO ()) ----> IO ()


printTwo :: IO ()
printTwo = putStrLn "Zeile 1" >>= (\ _ -> return "Zeile 2") >>= putStrLn 



{-- do-Schreibweise
Alternative zu bind (>>=), funktioniert wie imperative Programmiersprache. Jede Zeile ist eins von:
- eine Aktion
- eine Bindung
- return
--}

printReverse':: IO ()
printReverse' = do
    s <- getLine
    putStrLn (reverse s)


myGetLine:: IO String
myGetLine = do
    x <- getChar
    if x == '\n' then
        return ""
    else
        do
            xs <- myGetLine
            return (x:xs)


strLen:: IO()
strLen = do
    putStr "Enter a string: "
    xs <- getLine
    putStr "The string has "
    putStr (show (length xs))
    putStrLn " charachters"


strLen':: IO()
strLen' =
    let
        message x = "The string has " ++ show (length x) ++ " characters"
    in
    putStr "Enter a string: " 
    >>= (\ () -> getLine)
    >>= (return . message)
    >>= putStrLn


-- Liest die erste Zeile aus einer Textdatei.
firstLine:: FilePath -> IO String
firstLine filePath = do
    handle <- openFile filePath ReadMode
    ln <- hGetLine handle
    hClose handle
    return ln


firstLine' filePath = withFile filePath ReadMode hGetLine

{--
ghci> foo = firstLine "lorem.txt"
ghci> foo
"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor "
--}