module Main exposing (..)

import Html exposing (Html)
import Html.Attributes
import Html.App as Html
import SimpleCss exposing (..)


type Classes
    = Foo
    | Bar


main : Program Never
main =
    Html.beginnerProgram { model = model, view = view, update = \x _ -> x }


model : Stylesheet
model =
    [ (.) Foo
        [ backgroundColor red ]
    ]


view : Stylesheet -> Html msg
view stylesheet =
    Html.textarea
        [ Html.Attributes.placeholder (compile stylesheet)
        ]
        []
