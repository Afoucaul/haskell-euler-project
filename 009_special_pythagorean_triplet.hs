-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
-- For example, 32 + 42 = 9 + 16 = 25 = 52.
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.Find the product abc.

unfoldr (x:t) f = x:(unfoldr (y:t) f) where y = f x

nextCouple (a, b)
    | a == b    = (a + 1, 1)
    | otherwise = (a, b + 1)

isPerfectSquare n = (==) n $ (flip (^)) 2 $ floor $ sqrt $ fromIntegral n

pythagoreanTriplets = [(a, b, cs) | (a, b) <- unfoldr [(1, 1)] nextCouple, 
                       let c = a^2 + b^2, 
                       let cs = floor $ sqrt $ fromIntegral c,
                       isPerfectSquare c]
