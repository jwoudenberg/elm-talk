module MyCss exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)


type CssClasses
    = Counter
    | Button


darkBlue =
    hex "204a87"


lightBlue =
    hex "729fcf"


rectangle =
    mixin
        [ width (px 40)
        , height (px 40)
        , border3 (px 1) solid darkBlue
        , borderRadius (px 5)
        , boxSizing borderBox
        , margin (px 5)
        , lineHeight (px 40)
        , verticalAlign middle
        , textAlign center
        ]


css : Stylesheet
css =
    (stylesheet << namespace "buttons")
        [ (.) Counter
            [ rectangle
            , color darkBlue
            ]
        , (.) Button
            [ rectangle
            , backgroundColor lightBlue
            , hover
                [ backgroundColor darkBlue
                , color lightBlue
                ]
            ]
        ]
