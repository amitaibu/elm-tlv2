module Person where

import Effects exposing (Effects)
import Html exposing (button, div, pre, text, Html)
import Html.Events exposing (onClick)


-- MODEL

type alias Model =
  { age  : Int
  , kids : Int
  , name : String
  }

initialModel : Model
initialModel =
  { age  = 38
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
      ( { model | kids = model.kids - 1 }
      , Effects.none
      )

    Increment ->
      ( { model | kids = model.kids + 1 }
      , Effects.none
      )


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ div [] [ text <| "Name: " ++ model.name ]
    , div [] [ text <| "Age: " ++ (toString model.age) ]
    , div [] [ text <| "Kids num: " ++ (toString model.kids) ]
    , button [ onClick address Decrement ] [ text "-" ]
    , button [ onClick address Increment ] [ text "+" ]
    , pre [] [ text (toString model) ]
    ]
