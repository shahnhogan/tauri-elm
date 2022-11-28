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
    ( { side = Light }, Cmd.none )



-- MODEL


type alias Model =
    { side : Side }


type Side
    = Light
    | Dark


type Msg
    = ToggledBackground



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggledBackground ->
            ( { model | side = toggleSide model.side }, Cmd.none )


toggleSide : Side -> Side
toggleSide side =
    if side == Dark then
        Light

    else
        Dark



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ class "container"
        , classList
            [ ( "light", isLight model.side )
            , ( "dark", isDark model.side )
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
            [ "Toggle " ++ (model.side |> toggleSide |> sideToLabel) |> text ]
        ]


sideToLabel : Side -> String
sideToLabel side =
    case side of
        Light ->
            "light side"

        Dark ->
            "dark side"


isDark : Side -> Bool
isDark side =
    side == Dark


isLight : Side -> Bool
isLight side =
    side == Light



-- SUBSCRIPTION


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
