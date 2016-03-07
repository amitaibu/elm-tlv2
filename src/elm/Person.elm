module Person where

import Effects exposing (Effects)
import Html exposing (..)
import Html.Events exposing (onClick)


-- MODEL

type alias Model =
  { age  : Int
  , kids : Int
  , name : String
  }

initialModel : Model
initialModel =
  { age  = 37
  , kids = 3
  , name = "Amitai"
  }


init : (Model, Effects Action)
init =
  ( initialModel
  , Effects.none
  )


-- UPDATE

type Action = Decrement | Increment

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Decrement ->
      ( model
      , Effects.none
      )

    Increment ->
      ( model
      , Effects.none
      )


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ div [] [ text (toString model) ]
    , button [ onClick address Decrement ] [ text "-" ]
    , button [ onClick address Increment ] [ text "+" ]
    ]
