module MyCss exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)


type CssClasses
    = Counter
    | Button


css : Stylesheet
css =
    (stylesheet << namespace "buttons")
        [ (.) Counter
            [ color (hex "FF0000")
            ]
        ]
