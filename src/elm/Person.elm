module Person where

import Effects exposing (Effects)
import Html exposing (..)
import Html.Events exposing (onClick)


-- MODEL

type Kids = Kids Int

type alias Model =
  { age  : Int
  , kids : Kids
  , name : String
  }

initialModel : Model
initialModel =
  { age  = 38
  , kids = Kids 3
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
    [ div [] [ text (toString model.name) ]
    , div [] [ text (toString model.age) ]
    , div [] [ text (toString model.kids) ]
    , button [ onClick address Decrement ] [ text "-" ]
    , button [ onClick address Increment ] [ text "+" ]
    , pre [] [ text (toString model) ]
    ]

viewAge : Int -> Html
viewAge age =
  div [] [text (toString age)]


viewKids : Kids -> Html
viewKids kids =
  let
    (Kids val) = kids
  in
    div [] [text (toString val)]
