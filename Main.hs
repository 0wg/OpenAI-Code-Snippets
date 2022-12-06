-- Define a function to read and parse an expression from the input
readExpr :: String -> Either String (Double, String)
readExpr input =
  -- Read a double-precision number from the input
  case reads input of
    [(num, rest)] -> Right (num, rest)
    _ -> Left "Invalid number"

-- Define a function to evaluate a binary operator
evalOp :: (Double -> Double -> Double) -> Double -> Double -> Either String Double
evalOp op x y = Right (op x y)

-- Define a function to evaluate an expression
evalExpr :: String -> Either String Double
evalExpr input =
  -- Read the first number from the input
  case readExpr input of
    Left err -> Left err
    Right (num1, rest1) ->
      -- Check if there are any more numbers or operators in the input
      case rest1 of
        [] -> Right num1
        (op:rest2)
          | op == '+' ->
            -- Read the second number and evaluate the sum
            case readExpr rest2 of
              Left err -> Left err
              Right (num2, rest3) -> evalOp (+) num1 num2 >>= \result -> evalExpr (show result ++ rest3)
          | op == '-' ->
            -- Read the second number and evaluate the difference
            case readExpr rest2 of
              Left err -> Left err
              Right (num2, rest3) -> evalOp (-) num1 num2 >>= \result -> evalExpr (show result ++ rest3)
          | op == '*' ->
            -- Read the second number and evaluate the product
            case readExpr rest2 of
              Left err -> Left err
              Right (num2, rest3) -> evalOp (*) num1 num2 >>= \result -> evalExpr (show result ++ rest3)
          | op == '/' ->
            -- Read the second number and evaluate the quotient
            case readExpr rest2 of
              Left err -> Left err
              Right (num2, rest3) -> evalOp (/) num1 num2 >>= \result -> evalExpr (show result ++ rest3)
          | otherwise -> Left "Invalid operator"

-- Define the main program that reads and evaluates expressions
main :: IO ()
main = do
  -- Prompt the user for an expression
  putStr "Enter an expression: "
  input <- getLine

  -- Evaluate the expression
  case evalExpr input of
    Left err -> putStrLn err
    Right result -> putStrLn (show result)
