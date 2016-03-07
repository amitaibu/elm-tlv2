module PersonTest where

import ElmTest exposing (..)

import Person exposing (initialModel, Model, Kids)

decrementActionSuite : Test
decrementActionSuite =
  suite "Decerment action"
    [ test "negative count" (assertEqual 0 (updateCounter Person.Decrement -1))
    , test "zero count" (assertEqual 0 (updateCounter Person.Decrement 0))
    , test "positive count" (assertEqual 0 (updateCounter Person.Decrement 1))
    , test "top limit count" (assertEqual 4 (updateCounter Person.Decrement 5))
    ]

incrementActionSuite : Test
incrementActionSuite =
  suite "Incerment action"
    [ test "negative count" (assertEqual 0 (updateCounter Person.Increment -1))
    , test "zero count" (assertEqual 1 (updateCounter Person.Increment 0))
    , test "positive count" (assertEqual 2 (updateCounter Person.Increment 1))
    , test "top limit count" (assertEqual 5 (updateCounter Person.Increment 5))
    ]

updateCounter : Person.Action -> Int -> Int
updateCounter action initialKidsNum =
  let
    model = {initialModel | kids = (Person.Kids initialKidsNum)}
    model' = fst <| Person.update action model
    (Person.Kids kids') = model.kids
  in
    kids'


all : Test
all =
  suite "Person tests"
    [ decrementActionSuite
    , incrementActionSuite
    ]
