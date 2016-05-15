-- A modified version of the Buttons example in the Elm-guide: http://guide.elm-lang.org/architecture/user_input/buttons.html


module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)
import Html.CssHelpers
import MyCss


{ class } =
    Html.CssHelpers.withNamespace "buttons"
main : Program Never
main =
    Html.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    Int


model : Model
model =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button
            [ class [ MyCss.Button ]
            , onClick Decrement
            ]
            [ text "-" ]
        , div [ class [ MyCss.Counter ] ] [ text (toString model) ]
        , button
            [ class [ MyCss.Button ]
            , onClick Increment
            ]
            [ text "+" ]
        ]
