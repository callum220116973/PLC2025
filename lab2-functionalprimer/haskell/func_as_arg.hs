applicatorFunc :: [Int] -> Char -> Double
applicatorFunc inpFunc s
  | s == 's'  = fromIntegral (sum inpFunc)  -- Sum of numbers in inpFunc
  | s == 'a'  = fromIntegral (sum inpFunc) / fromIntegral (length inpFunc)  -- Average of numbers in inpFunc
  | otherwise = error "Invalid operation"  -- Error for invalid operation

main :: IO ()
main = do
  -- Prompt the user for the start and end numbers of the range
  putStrLn "Please enter the start number of your range"
  a <- readLn :: IO Int
  putStrLn "Please enter the end number of your range"
  b <- readLn :: IO Int

  -- Create the list [a..b]
  let inpFunc = [a..b]

  -- Call the applicatorFunc with 'a' for average
  let result = applicatorFunc inpFunc 'a'  -- You can change 'a' to 's' for sum

  -- Output the result
  putStrLn ("Result: " ++ show(result))
