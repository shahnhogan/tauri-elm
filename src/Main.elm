module Main exposing (..)

import Accessibility exposing (..)
import Browser
import Html.Attributes exposing (class, classList, height, src, type_, width)
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
    ( { force = Light }, Cmd.none )



-- MODEL


type alias Model =
    { force : Force }


type Force
    = Light
    | Dark


type Msg
    = ToggledBackground



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggledBackground ->
            ( { model | force = toggleForce model.force }, Cmd.none )


toggleForce : Force -> Force
toggleForce force =
    if force == Dark then
        Light

    else
        Dark



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ class "container"
        , classList
            [ ( "light", isLight model.force )
            , ( "dark", isDark model.force )
            ]
        ]
        [ h1 [] [ text "Elm" ]
        , p []
            [ text "A delightful language for reliable web applications." ]
        , img "Elm language logo"
            [ src "assets/elm-logo.png"
            , height 256
            , width 256
            ]
        , button
            [ onClick ToggledBackground
            , type_ "button"
            ]
            [ "Toggle " ++ (model.force |> toggleForce |> forceToLabel) |> text ]
        ]


forceToLabel : Force -> String
forceToLabel force =
    case force of
        Light ->
            "light side"

        Dark ->
            "dark side"


isDark : Force -> Bool
isDark force =
    force == Dark


isLight : Force -> Bool
isLight force =
    force == Light



-- SUBSCRIPTION


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
