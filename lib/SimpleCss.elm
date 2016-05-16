module SimpleCss exposing (..)

import String


type alias Stylesheet =
    List Snippet


type alias Snippet =
    { selector : Selector
    , properties : List Property
    }


type Selector
    = ClassSelector String
    | IdSelector String


type alias Property =
    { key : String
    , value : String
    }


(.) : class -> List Property -> Snippet
(.) class properties =
    { selector = ClassSelector (toString class)
    , properties = properties
    }


type Compatible
    = Compatible


type alias ColorValue compatible =
    { compatible | value : String, color : Compatible }


type alias LengthValue compatible =
    { compatible | value : String, length : Compatible }


compile : Stylesheet -> String
compile snippets =
    let
        compileSelector : Selector -> String
        compileSelector selector =
            case selector of
                ClassSelector class ->
                    "." ++ class

                IdSelector id ->
                    "#" ++ id

        compileProperties : List Property -> String
        compileProperties properties =
            List.map compileProperty properties
                |> String.join "\n"

        compileProperty : Property -> String
        compileProperty property =
            "  " ++ property.key ++ ": " ++ property.value ++ ";"

        compileSnippet : Snippet -> String
        compileSnippet snippet =
            (compileSelector snippet.selector)
                ++ " {\n"
                ++ (compileProperties snippet.properties)
                ++ "\n}"
    in
        List.map compileSnippet snippets
            |> String.join "\n\n"


red : ColorValue {}
red =
    { value = "red"
    , color = Compatible
    }


px : Int -> LengthValue {}
px length =
    { value = (toString length) ++ "px"
    , length = Compatible
    }


inherit : { value : String, color : Compatible, length : Compatible }
inherit =
    { value = "inherit"
    , color = Compatible
    , length = Compatible
    }


backgroundColor : ColorValue compatible -> Property
backgroundColor colorValue =
    { key = "backgroundColor"
    , value = colorValue.value
    }


width : LengthValue compatible -> Property
width lengthValue =
    { key = "width"
    , value = lengthValue.value
    }
