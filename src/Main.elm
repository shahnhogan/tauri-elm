module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (alt, height, href, src, width)
import Html.Events exposing (onClick)



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { status = Ready }, Cmd.none )



-- MODEL


type alias Model =
    { status : Status }


type Status
    = Ready
    | NotReady


type Msg
    = NoOp



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Elm" ]
        , p []
            [ text "A delightful language for reliable web applications." ]
        , img
            [ src "assets/elm-logo.png"
            , height 256
            , width 256
            , alt "Elm language logo"
            ]
            []
        ]



-- SUBSCRIPTION


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
