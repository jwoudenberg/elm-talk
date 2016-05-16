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
