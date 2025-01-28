-- Define applicatorFunc with 2 arguments: inpFunc and s
applicatorFunc :: [Int] -> Char -> Float
applicatorFunc inpFunc s = 
    if s == 's' 
    then fromIntegral (sum inpFunc)  -- sum as Float
    else fromIntegral (sum inpFunc) / 5  -- division by 5 as Float (hardcoded)

main :: IO ()
main = do
    putStrLn "Enter the start number of the range:"
    a <- readLn :: IO Int
    putStrLn "Enter the end number of the range:"
    b <- readLn :: IO Int  -- b is still taken from the input, but not used in the division

    let inpFunc = [a..b]  -- Generate the range list from a to b

    -- Call applicatorFunc with inpFunc, 'a' (or 's'), and hardcoded 5
    let result = applicatorFunc inpFunc 'a'  -- 'a' means divide, 's' means sum
    putStrLn ("Result: " ++ show result)  -- Display the result as a Float