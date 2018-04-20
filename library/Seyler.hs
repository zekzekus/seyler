module Seyler where

import           Lib.Prelude

type Key = Text

type Value = Text

type Parameter = (Key, Value)

type ParameterList = [Parameter]

data Action
    = Add           
    | AddProject    
    | Update        
    | UpdateProject
    | Show
    | Search        
    | Version       
    deriving (Show)

data Command = Command
    { action     :: Action
    , parameters :: ParameterList
    } deriving (Show)

main :: IO ()
main = putStrLn ("Initial version!" :: Text)
