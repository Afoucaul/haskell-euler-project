-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
-- Find the sum of all the primes below two million.

isPrime 2 = True
isPrime n = all (> 0) $ map (n `rem`) [2..s]
            where s = floor $ sqrt $ fromIntegral n

primes = filter isPrime [2..]

solution = sum $ takeWhile (<= 2000000) primes
