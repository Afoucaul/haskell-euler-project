-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
-- Find the largest palindrome made from the product of two 3-digit numbers.

palindrome s = take n s == take n (reverse s)
               where n = ceiling ((fromIntegral (length s)) / 2)

palindromic n = palindrome $ show n

solution = maximum [x | a <- l, b <- takeWhile (>=a) l, let x = a * b, palindromic x]
           where l = [999, 998..100]
