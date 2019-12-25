module Main exposing (Msg(..), main, update, view)

import Browser
import Html exposing (Html, button, div, text, input)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)


main = Browser.sandbox { init = 0, update = update, view = view }


type Msg
    = Increment
    | Decrement
    | Reset
    | Set String


update : Msg -> Int -> Int
update msg model =
    case msg of
        Increment ->
            model + 1
        Decrement ->
            model - 1
        Reset ->
            0
        Set number ->
            case String.toInt number of
                Just a ->
                    a
                Nothing ->
                    0


view : Int -> Html Msg
view model =
    div []
        [
            button [onClick Increment ] [text "+"],
            button [onClick Decrement ] [text "-"],
            button [onClick Reset ] [text "0"],
            input [value (String.fromInt model), onInput Set] [],
            div [] [text (String.fromInt model)]
        ]
