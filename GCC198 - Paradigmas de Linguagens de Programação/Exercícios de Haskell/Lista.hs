raizes :: Float -> Float -> Float -> (Float, Float)
raizes a b c = ((- b + sqrt (delta)) / (2 * a) , (- b - sqrt (delta)) / (2 * a))
  where delta = b ^ 2 - 4 * a * c


maioresMedia :: Float -> Float -> Float -> Int
maioresMedia a b c = sum [1 | x <- [a, b, c], x > media]
  where media = (a + b + c) / 3
  

somaIntervalo :: Int -> Int -> (Int, Int)
somaIntervalo a b = (sum [x | x <- [a .. b]], sum [x | x <- [(a + 1) .. (b - 1)]])


mmc :: Int -> Int -> Int
mmc a b = minimum [x | x <- [(maximum[a, b]) .. (a * b)], (mod x a == 0) && (mod x b == 0)]
  

mmcLista :: [Int] -> Int
mmcLista [] = error "Lista Vazia"
mmcLista (h:t)
  | t == [] = h
  | otherwise = mmc h (mmcLista t)


mdc :: Int -> Int -> Int
mdc a b = maximum [x | x <- [1 .. (minimum [a, b])], (mod a x == 0) && (mod b x == 0)]


mdcLista :: [Int] -> Int
mdcLista lista = maximum [x | x <- [1 .. (minimum lista)], (length [y | y <- lista, mod y x == 0]) == (length lista)]


produtoIntervalo :: Int -> Int -> Int
produtoIntervalo m n = product [x | x <- [m .. n]]

produtoRec :: Int -> Int -> Int
produtoRec m n
  | m == n = n
  | otherwise = m * produtoRec (m + 1) n


raizInteira :: Int -> Int
raizInteira n
  | n == 0 = 0
  | n == 1 = 1
  | n >= 2 = maximum [x | x <- [1 .. (div n 2)], x * x <= n]


-- ERA PRA DAR CERTO MAS DÁ ERRO
-- concatenaListas :: [a] -> [a] -> [a]
-- concatenaListas (h:t) l2
--   | (t == []) = h : l2
--   | otherwise = h : concatenaListas t l2

concatenaListas :: [a] -> [a] -> [a]
concatenaListas [] l2 = l2
concatenaListas [x] l2 = x : l2
concatenaListas l1 l2 = h : concatenaListas t l2
  where (h:t) = l1


removeEspacos :: String -> String
removeEspacos [] = []
removeEspacos (h:t)
  | (t == []) = [h]
  | ((h == ' ') && (head t == ' ')) = removeEspacos t
  | otherwise = [h] ++ removeEspacos t


menoresQueMedia :: [Float] -> [Float]
menoresQueMedia list = [x | x <- list, x < media]
  where media = (sum list) / (sum [1 | x <- list])


-- QUESTÃO 13 EM OUTRO ARQUIVO


zip33 :: [a] -> [b] -> [c] -> [(a, b, c)]
zip33 [] _ _ = []
zip33 _ [] _ = []
zip33 _ _ [] = []
zip33 (ha:ta) (hb:tb) (hc:tc) = [(ha, hb, hc)] ++ (zip33 (ta) (tb) (tc))

zip44 :: [a] -> [b] -> [c] -> [d] -> [(a, b, c, d)]
zip44 [] _ _ _ = []
zip44 _ [] _ _ = []
zip44 _ _ [] _ = []
zip44 _ _ _ [] = []
zip44 (ha:ta) (hb:tb) (hc:tc) (hd:td) = [(ha, hb, hc, hd)] ++ (zip44 (ta) (tb) (tc) (td))


bissexto :: Int -> Bool
bissexto ano = (mod ano 400 == 0) || ((mod ano 4 == 0) && (mod ano 100 /= 0))


-- QUESTÃO 17 EM OUTRO ARQUIVO


somaImpares :: Int -> Int
somaImpares n
  | n == 1 = 1
  | mod n 2 == 0 = somaImpares (n - 1)
  | otherwise = n + somaImpares (n - 1)

ackermann :: Int -> Int -> Int
ackermann m n
  | m == 0 = n + 1
  | m /= 0 && n == 0 = ackermann (m - 1) n
  | otherwise = ackermann (m - 1) (ackermann m (n - 1))
