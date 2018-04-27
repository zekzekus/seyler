module Seyler
    ( toCommandURL
    , Action(..)
    , Command(..)
    ) where

import           Lib.Prelude

import qualified Data.Text   as T

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

toCommandURL :: Command -> Text
toCommandURL (Command act params) =
    protocol <> partAction <> firstParamSeparator <> partParameters
  where
    partAction = (toKebab . show) act
    partParameters = T.intercalate "&" $ toArg <$> params
    toArg (k, v) = k <> "=" <> v
    protocol = "things:///" :: Text
    firstParamSeparator = "?" :: Text
    toKebab "AddProject"    = "add-project"
    toKebab "UpdateProject" = "update-project"
    toKebab a               = T.toLower a
