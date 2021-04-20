import System.Environment

functionFromString :: String -> Double -> Double
functionFromString "sin" = sin
functionFromString "tan" = tan
functionFromString "log" = log
functionFromString "cos" = cos
functionFromString "sqrt" = sqrt
functionFromString "exp" = exp

grid :: Double -> Double -> Double -> [Double]
grid a b h = [a, (a + h) .. b]

main = do
    argv <- getArgs
    let func = functionFromString (argv !! 0)
    let a = read (argv !! 1)
    let b = read (argv !! 2)
    let h = read (argv !! 3)
    print (map func (grid a b h))