{-# LANGUAGE UnicodeSyntax, LinearTypes, Arrows, TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-star-is-type #-}
import Control.Arrow (ArrowChoice, returnA)
import Language.Haskell.TH
import Language.Haskell.TH.Syntax

untilA ∷ ArrowChoice a ⇒ a (e,s) () → a (e,s) Bool → a (e,s) ()
untilA body cond = proc x → do
        b ← cond ⤙ x
        if b then returnA ⤙ ()
        else do
                body ⤙ x
                untilA body cond ⤙ x

branchArrow :: ArrowChoice a => a Int Int
branchArrow = proc x -> do
  if even x
    then ⦇ (add1 >>> mult2) ⦈ -< x  -- 偶数路径
    else ⦇ mult2 ⦈ -< x 

id' ∷ ∀ a. a ⊸ a
id' = undefined    

class Functor (f :: ★ → ★) where
    map :: f a

genAdd :: Q Exp
genAdd = do
  a <- newName "a"
  b <- newName "b"
  let expr = [| $(varE a) + $(varE b) |]
  return expr
