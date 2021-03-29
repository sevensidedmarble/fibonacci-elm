module Main exposing (..)

import Html exposing (Html, div, h1, h2, ul, li, aside, strong, header, a, text)
import Html.Attributes exposing (href, tabindex)
import List exposing (range, map)
import String exposing (fromInt)
import Ordinal exposing (ordinal)

fibHelper : Int -> Int -> Int -> Int
fibHelper n acc acc2 =
    case n of
        0 ->
            acc
        1 ->
            acc2
        _ ->
            fibHelper (n - 1) acc2 (acc + acc2)

fib : Int -> Int
fib n =
    fibHelper n 0 1

show x =
  li [ tabindex 0 ]
    [ strong [] [(text <| fromInt <| fib x)]
    , aside [] [(text <| ordinal x)]
    ]

main : Html msg
main =
  div []
    [ header []
      [ h1 [] [ text "42 Digits of the Fibonacci Sequence" ]
      , h2 []
        [ text "("
        , a [ href "https://github.com/sevensidedmarble/fibonacci-elm" ] [ text "in Elm" ]
        , text ")"
        ]
      ]
    , ul [] <| map show <| range 0 42
    ]
