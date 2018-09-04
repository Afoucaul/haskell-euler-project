-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
-- What is the 10 001st prime number?

prime n
    | n == 2    = True
    | otherwise = all (\x -> n `mod` x /= 0) [2..m]
                  where m = floor $ sqrt $ fromIntegral n

nthPrime n = (filter prime [1..]) !! n

solution = nthPrime 10001
