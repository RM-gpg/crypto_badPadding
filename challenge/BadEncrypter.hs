module BadEncrypter where

{- Below is a badly designed ciphering system. The (small) flag has been encrypted as follows: encrypt $ strToInt "Intake24{...}"
 and the output is '5310858253221490373184263229499476712433226876487593018988645065740370966790495094296525692022496871691412218578581479707898725593959102178920203684460249'.
 You can obtain the flag without knowledge of d,p,q. -}

import Data.Foldable ( foldl' )
import Data.Bits ( shift, shiftR, (.|.), (.&.) )
import Math.NumberTheory.Moduli.Class

n :: Integer
n = 11997770751541995136355208095988361277984922494480821009332231757416686635683782741405600986572909624013681956284240670084123192395598387279736302853755871

e :: Integer
e = 3 -- suspiciously small?

k :: Integer
k = 669855764 -- used for padding (quite randomly chosen)

d :: Integer
d = undefined -- sorry :)

encrypt :: Integer -> Integer
encrypt m = case (powSomeMod (k*(n - m) `modulo` fromIntegral n) e) of
	SomeMod x -> getVal x

{- Obviously this won't work when 'd' is undefined -}
decrypt :: Integer -> Integer
decrypt c = case (powSomeMod (c `modulo` fromIntegral n) d) of
	SomeMod x -> getVal $ fromIntegral n - x / fromIntegral k

strToInt :: String -> Integer
strToInt = foldl' (\b a -> shift b 8 .|. toInteger (fromEnum a)) 0

intToStr :: Integer -> String 
intToStr x = intToStr' x ""
	where
		intToStr' 0 acc = acc
		intToStr' y acc = intToStr' (shiftR y 8) (toEnum (fromIntegral (y .&. 255)) : acc)
