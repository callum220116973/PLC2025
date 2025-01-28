-- Define applicatorFunc with 2 arguments: inpFunc and s
applicatorFunc :: [Int] -> Char -> Float
applicatorFunc inpFunc s = 
    if s == 's' 
    then fromIntegral (sum inpFunc)  
    else fromIntegral (sum inpFunc) / 5  

main :: IO ()
main = do
    putStrLn "Enter the start number of the range:"
    a <- readLn :: IO Int
    putStrLn "Enter the end number of the range:"
    b <- readLn :: IO Int  

    let inpFunc = [a..b] 

    -- Call applicatorFunc with inpFunc, 'a' (or 's'), and hardcoded 5
    let result = applicatorFunc inpFunc 'a'  -- 'a' means divide, 's' means sum
    putStrLn ("Result: " ++ show result)  -- Display the result as a Float
