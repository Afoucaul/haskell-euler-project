-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ?

prime 2 = True
prime n = not $ any prime [d | d <- [2..(floor $ sqrt $ fromIntegral n)], n `mod` d == 0]

largestPrimeFactor n
    | prime n   = n
    | otherwise = head [d | d <- (n : [m, m-1..]), prime d, n `mod` d == 0]
    where m = floor $ sqrt $ fromIntegral n


solution = largestPrimeFactor 600851475143
