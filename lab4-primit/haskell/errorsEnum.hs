module Main where

import System.IO (hSetBuffering, stdout, BufferMode(..))

main =
    do
    initialiseIO
    -- Lines 9 and 11 are where conversions happens turning Enumerated values into strings
    -- error is an Error enum value error2Result error returns a result enum value, show error
    -- converts error to a string for example FP_Overflow, show error2Result error converts the result to a string
    -- reults in is a string  and  ++ concatenates everything, show is requried because both Error and Result are not
    -- not strings by default, haskell enums are not strings, they are custom data types, so show is required for conversion.
    putStrLn ("known errors = " ++ show allErrors)
    error <- getElement "error"
    putStrLn (show error ++ " results in: " ++ show (error2Result error))
    
initialiseIO =
    do
    hSetBuffering stdout NoBuffering
        -- ensure any console output is shown asap

data Error = FP_Rounding | FP_Overflow | FP_Underflow | Int_Overflow
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)
data Result = Zero | Infinity | ABitDifferent | VeryDifferent
    deriving (Show, -- default formatting
              Read, -- default parsing
              Eq,   -- default equality testing
              Bounded, -- default minBound and maxBound
              Enum) -- default sequencing (needed for .. ranges)

allErrors :: [Error] -- ie it is a list of PL elements
allErrors = [minBound .. maxBound]

error2Result FP_Rounding = ABitDifferent
error2Result FP_Overflow = Infinity
error2Result FP_Underflow = Zero
error2Result Int_Overflow = VeryDifferent

-- The code below should not be changed and does not need to be fully understood.

{-
  `getElement'
  queries the user for one element until the user types something 
  that can be interpreted as the correct type of element (eg integer)
-}
getElement elementTypeName =
    do
    hSetBuffering stdout NoBuffering -- print to console in real time, not in batches
    putStr ("Input one " ++ elementTypeName ++ ": ") -- print the prompt
    line <- getLine -- get whatever user types as a string
    case parseElement line of
         Just element -> 
            do
            return element
         Nothing -> 
            do
            putStrLn ("Invalid " ++ elementTypeName ++ ", try again")
            getElement elementTypeName -- try again - using recursion

parseElement line =
    case reads line of
        [] -> -- no valid interpretation of the line as an element ([] = the empty list)
            Nothing
        -- [pattern 2:]
        ((e,_) : _) -> -- found at least one interpretation, call it "e"
            Just e -- type of e is derived from context
                   -- where getElement is used
