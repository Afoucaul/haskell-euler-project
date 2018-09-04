-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

prime n
    | n == 2    = True
    | otherwise = all (\x -> n `rem` x /= 0) [s, (s-1)..2]
                  where s = (floor $ sqrt $ fromIntegral n)

greatestPower boundary n
    | n > boundary      = 1
    | otherwise         = n * greatestPower (boundary `div` n) n


smallestProduct n = product $ map (greatestPower n) $ takeWhile (<=n) primes
                    where primes = filter prime [2..]


solution = smallestProduct 20
