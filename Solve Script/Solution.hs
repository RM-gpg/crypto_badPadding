import BadEncrypter
import Math.NumberTheory.Roots

altDecrypt :: Integer -> String
altDecrypt c = altDecrypt' c 1
        where
                altDecrypt' c i = let x = intToStr $ integerRoot 3 ((i*n - c) `div` k^3) in
                        if take 6 x == "Intake" then x else altDecrypt' c (i+1)

{- flag: Intake24{6879760#}, d: 7998513834361330090903472063992240851989948329653880672888154504944457757122375558455276694403560429863056484656685322744762767509310586731462022383062363 -}
