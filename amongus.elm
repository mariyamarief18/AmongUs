-- share link: https://macoutreach.rocks/share/0493e6fa

import Html

import Html.Attributes

imageUrl = "https://wallpapercave.com/wp/wp7808371.png"

imageUrl1 = "https://i.pinimg.com/originals/7b/8b/9c/7b8b9cbc22da0f51cc6710d470a70abd.png"

imageUrl2 = "https://preview.redd.it/hwj417a0j1e51.png?auto=webp&s=1daf77cf06ec55938934dd298ffa6126f0253f0d"

adminTaskUrl = "https://1gamerdash.com/wp-content/uploads/2020/09/among-us-admin-swipe-card-800x450.jpg?x27450"

myShapes model =

     case model.state of

        Cafeteria  ->

            [background |> rotate (-1 *model.time)

            ,characters |> rotate model.time

            , rect 100 5

                |> filled (rgb 255 255 204)

                |> move (0,17)

            , rect 5 40

                |> filled (rgb 255 255 204)

                |> move (0,-1)

                

            ,group[

              roundedRect 60 18 2 

                    |> filled (rgb 255 255 204)

                    |> move (0,-1.5)

              ,text "Cafeteria"

                    |> centered

                    |> filled (rgb 102 102 0)

                    |> move (0,-5)

                   ]|> move(50,18)

            , group[

                transitionButton Right P1D

              , text "To MedBay"

                |> filled white

                |> scale 0.7

                |> move (40, 20)

                   ]|> move( -60,-45)

                    |> notifyTap P1D

                

            , group[

                transitionButton Left P1L

              , text "To UpperEngine"

                |> filled white

                |> scale 0.7

                |> move (-88, 20)

                   ]|> move(10,-5)

                    |> notifyTap P1L

            ]

        MedBay  ->

            [background |> rotate (-1 *model.time)

            ,characters |> rotate model.time

            ,group[

                 rect 50 5

                  |> filled (rgb 255 255 204)

                  |> move (-22.4,22)

                , rect 5 40

                  |> filled (rgb 255 255 204)

                  |> move (0,4)

            ]

            ,group[

                roundedRect 60 18 2 

                      |> filled (rgb 255 255 204)

                      |> move (0,-1.5)

                ,text "MedBay"

                      |> centered

                      |> filled (rgb 102 102 0)

                      |> move (0,-5)

                 ] |> move(0,-20)

            ,group[ 

                transitionButton Middle P1UL

                , text "Upper Engine"

                  |> filled white

                  |> scale 0.7

                  |> move (-25, 20)

                  ] |> move (-60,0)

                    |> notifyTap P1UL

            ]

        UpperEngine  ->

            [background |> rotate (-1 *model.time)

            ,characters |> rotate model.time

            , group[

                rect 100 5

                  |> filled (rgb 255 255 204)

                  |> move (0,3)

                ,rect 5 65

                  |> filled (rgb 255 255 204)

                  |> move (0,0)

            ]

            , group[

                roundedRect 80 18 2 

                    |> filled (rgb 255 255 204)

                    |> move (0,-1.5)

                ,text "UpperEngine"

                    |> centered

                    |> filled (rgb 102 102 0)

                    |> move (0,-5)

                  ] |> move (0,40)

            ,group[ 

                transitionButton Right P2DR

                  |> notifyTap P2DR

                , text "Security"

                  |> filled white

                  |> scale 0.7

                  |> move (46, 20)

                  ]|> move (0,-20)

                   |> notifyTap P2DR

            , group[

                transitionButton Middle P2D

                  |> notifyTap P2D

                , text "Lower Engine"

                  |> filled white

                  |> scale 0.7

                  |> move (-24, 20)

                  ]|> move (0,-60)

                   |> notifyTap P2D

            , group[

                transitionButton Left P2DL

                  |> notifyTap P2DL

                , text "Reactor"

                  |> filled white

                  |> scale 0.7

                  |> move (-72, 20)

                  ] |> move(0,-20)

                    |> notifyTap P2DL

            ]

        Reactor  ->

            [background |> rotate (-1 *model.time)

            ,characters |> rotate model.time

            ,text "Complete task to move forward"

              |> centered

              |> filled white

              |> move(0,30)

            , group[

                rect 100 5

                  |> filled (rgb 255 255 204)

                  |> move (0,2)

                ,rect 5 40

                  |> filled (rgb 255 255 204)

                  |> move (0,-20)

            ]

            , group[

                roundedRect 55 18 2 

                    |> filled (rgb 255 255 204)

                    |> move (0,1)

                ,text "Reactor"

                      |> centered

                      |> filled (rgb 102 102 0 )

                      |> move (0,-3)

                    ]

            , group[

                transitionButton Right P2R

                , text "Security"

                  |> filled white

                  |> scale 0.7

                  |> move (46, 20)

                  ] |> move (0,-20)

                    |> notifyTap P2R

            , group[

                transitionButton Middle RT

                , text "CleanUpTask"

                  |> filled white

                  |> scale 0.7

                  |> move (-23, 20)

                  ] |> move (-60,-20)

                    |> notifyTap RT

            , group[

                transitionButton Left P2RD

                  |> scaleX 1.1

                  |> move (12,0)

                , text "To LowerEngine"

                  |> filled white

                  |> scale 0.7

                  |> move (-82, 20)

                  ] |> move (55,-60)

                    |> notifyTap P2RD

            , if model.firstClean

              then group[]

              else group[

                    roundedRect 60 15 2 

                        |> filled grey

                        |> scaleX 1.1

                        |> makeTransparent 0.6

                        |> move (1,-38)

                   ,roundedRect 60 15 2 

                        |> filled grey

                        |> makeTransparent 0.6

                        |> move (60,2)

              ]

            ]

        ReactorTryAgain ->

            [ square 200 

                 |> filled black

            , text "Too Slow!"

                 |> centered

                 |> filled white

                 |> move (0,20)

            , group [transitionButton Middle CleanFailed

                     , text "Try Again"

                           |> centered 

                           |> filled white

                           |> move (0,19)

                        ]  |> notifyTap CleanFailed

                           |> move (0,-25)

             ]

        ReactorSuccess ->

             [square 200 

                 |> filled black

             ,text "Well Done!"

                 |> centered

                 |> filled white

                 |> move (0,20)

             ,group [roundedRect 80 15 2 

                        |> filled (rgb 255 255 204)

                     ,roundedRect 78 13 2

                         |>filled (rgb 102 102 0)

                     ,text "Back to Reactor"

                         |> size 11

                         |> centered 

                         |> filled white

                         |> move (0,-3)

                           

                    ]|> notifyTap RTB

             ]

        CleanUpTask  ->

            [ rect 498 498 

                    |> filled lightBlue

            , vent  

            , leaf1 

                    |> move (87,-33)

                    |> rotate (0.3*sin( 2*model.time))

                    |> scale 1.5

                    |> move model.pos1

                    |> move ( 5*sin(1*model.time+0), 5*sin(1*model.time+0))

                    |> notifyMouseDown ChangeDragState1 

                    |> notifyMouseUp ChangeDragState1

            , leaf2 

                    |> move (70,-43)

                    |> rotate (0.2*sin( 2*model.time))

                    |> scale 2.3

                    |> move model.pos2

                    |> move ( 3*sin(1*model.time+0), 3*sin(1*model.time+0))

                    |> notifyMouseDown ChangeDragState2

                    |> notifyMouseUp ChangeDragState2

           , leaf1 

                    |> move (80,-30)

                    |> rotate (0.1*sin( 2*model.time))

                    |> scale 1.5

                    |> move model.pos3

                    |> move ( 4*sin(1*model.time+0), 4*sin(1*model.time+0))

                    |> notifyMouseDown ChangeDragState3

                    |> notifyMouseUp ChangeDragState3

           , leaf2 

                    |> move (71,-46)

                    |> rotate (0.4*sin( 2*model.time))

                    |> scale 2.4

                    |> move ( 3*sin(1*model.time+0), 3*sin(1*model.time+0)) 

                    |> move model.pos4

                    |> notifyMouseDown ChangeDragState4

                    |> notifyMouseUp ChangeDragState4

            , leaf1 

                    |> move (85,-30)

                    |> rotate (0.2*sin( 2*model.time))

                    |> scale 1.2

                    |> move model.pos5 

                    |> move ( 6*sin(1*model.time+0), 6*sin(1*model.time+0))

                    |> notifyMouseDown ChangeDragState5

                    |> notifyMouseUp ChangeDragState5 

            ,      case model.dragState1 of                       

                       MouseDown1 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag1, 

                                            rect 50 70 |> filled darkCharcoal |> scaleX 0.5 |> move (-73,0) 

                                              |> notifyEnter (if ((model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)))

                                                                then CleanPassed

                                                                else LeafPassed1)]

                       Released1  -> group []

            ,       case model.dragState2 of                       

                       MouseDown2 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag2, 

                                            rect 50 70 |> filled darkCharcoal |> scaleX 0.5 |> move (-73,0)

                                              |> notifyEnter (if ((model.pos1 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)))

                                                                then CleanPassed

                                                                else LeafPassed2)]

                       Released2  -> group []

             ,      case model.dragState3 of                       

                       MouseDown3 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag3, 

                                            rect 50 70 |> filled darkCharcoal |> scaleX 0.5 |> move (-73,0) 

                                              |> notifyEnter (if ((model.pos2 == (500,500)) && (model.pos1 == (500,500)) && (model.pos4 == (500,500)) && (model.pos5 == (500,500)))

                                                                then CleanPassed

                                                                else LeafPassed3)]

                       Released3  -> group []       

              ,      case model.dragState4 of                       

                       MouseDown4 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag4, 

                                            rect 50 70 |> filled darkCharcoal |> scaleX 0.5 |> move (-73,0)

                                              |> notifyEnter (if ((model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos1 == (500,500)) && (model.pos5 == (500,500)))

                                                                then CleanPassed

                                                                else LeafPassed4)]

                       Released4  -> group []

              ,      case model.dragState5 of                       

                       MouseDown5 -> group [square 200 |> ghost |> notifyMouseMoveAt Drag5, 

                                            rect 50 70 |> filled darkCharcoal |> scaleX 0.5 |> move (-73,0)

                                              |> notifyEnter (if ((model.pos2 == (500,500)) && (model.pos3 == (500,500)) && (model.pos4 == (500,500)) && (model.pos1 == (500,500)))

                                                                then CleanPassed

                                                                else LeafPassed5)]

                       Released5  -> group []

             

              , rect 200 9

                  |> filled black

                  |> move (0,-60)

              , rect 200 7

                  |> filled white

                  |> move (0,-60)

              , rect 30 5

                  |> filled (rgb (153* (((model.time)-model.cleanTime)*2/25)) (153*(1-((model.time)-model.cleanTime)*2/25)) 0 )

                  |> scaleX (1-(30/(model.time-model.cleanTime) ))

                  |> move (0,-60)

              ,roundedRect 120 13 2

                  |> filled white

                  |> makeTransparent 0.8

                  |> move (-38,57)

              ,text "Drag the leaves to the vent to pass"

                  |> filled black

                  |> scale 0.7

                  |> move (-95,55)

              

              ]

        Security  ->

            [background |> rotate (-1 *model.time)

            ,characters |> rotate model.time

            , group[

                rect 100 5

                  |> filled (rgb 255 255 204)

                  |> move (0,4)

                ,rect 5 35

                  |> filled (rgb 255 255 204)

                  |> move (0,-15)

            ]

            , group[

                roundedRect 55 18 2 

                    |> filled (rgb 255 255 204)

                    |> move (50,4)

                ,text "Security"

                    |> centered

                    |> filled (rgb 102 102 0)

                    |> move (50,1)

                   ]

            ,group[ 

                transitionButton Middle P2LD 

                  |> move (0,-40) 

                , text "Lower Engine"

                  |> filled white

                  |> scale 0.7

                  |> move (-23, -20)

                  ] |> move (0,-12)  

                    |> notifyTap P2LD

            , group [ 

                transitionButton Left P2L

                , text "Reactor"

                  |> filled white

                  |> scale 0.7

                  |> move (-72, 20)

                  ] |> move (0,-18)

                    |> notifyTap P2L

            ]

        LowerEngine  ->

            [background |> rotate (-1 *model.time)

            ,characters |> rotate model.time

            , group[

                rect 100 5

                  |> filled (rgb 255 255 204)

                  |> move (0,4)

                ,rect 5 36

                  |> filled (rgb 255 255 204)

                  |> move (0,20)

            ]

            , group[

                roundedRect 75 18 2 

                    |> filled (rgb 255 255 204)

                    |> move (0,-1.5) 

                ,text "LowerEngine"

                    |> centered

                    |> filled (rgb 102 102 0)

                    |> move (0,-5)

                    ]|> move (-50,6)

                  

            ,group[ 

                transitionButton Middle P3RDRU

                  |> notifyTap P3RDRU 

                  |> move (0,10)

                , text "Electrical"

                  |> filled white

                  |> scale 0.7

                  |> move (-16, 30)

                  ] |> move (0,10)

                    |> notifyTap P3RDRU

            ,group [ 

                transitionButton Right P3RDR

                  |> notifyTap P3RDR

                , text "Storage"

                  |> filled white

                  |> scale 0.7

                  |> move (48, 20)

                  ] |> move (0,-18)

                    |> notifyTap P3RDR

            ]

        Electrical  ->

            [background |> rotate (-1 *model.time)

            ,characters |> rotate model.time

            , group[

                rect 50 5

                  |> filled (rgb 255 255 204)

                  |> move (22.5,-18)

                ,rect 5 42

                  |> filled (rgb 255 255 204)

                  |> move (0,1)

            ]

            , group[

                roundedRect 55 18 2 

                    |> filled (rgb 255 255 204)

                , text "Electrical"

                    |> centered

                    |> filled (rgb 102 102 0)

                    |> move (0,-4)

                    ]  |> move (0,30) 

            , group[

                transitionButton Middle P3DR

                  |> notifyTap P3DR

                , text "Storage"

                  |> filled white

                  |> scale 0.7

                  |> move (-12, 20)

                  ] |> move (50,-40)

                    |> notifyTap P3DR

            ]

        Storage  ->

            [background |> rotate (-1 *model.time)

            ,characters |> rotate model.time

            , group[

                rect 50 5

                  |> filled (rgb 255 255 204)

                  |> move (22.5,4)

                ,rect 5 65

                  |> filled (rgb 255 255 204)

                  |> move (0,3)

            ]

            , group[

                roundedRect 55 18 2 

                    |> filled (rgb 255 255 204)

                , text "Storage"

                    |> centered

                    |> filled (rgb 102 102 0)

                    |> move (0,-4)

                    ]|> move (0,-30)

            , group[ 

                transitionButton Right P4UR

                , text "Admin"

                  |> filled white

                  |> scale 0.7

                  |> move (48, 20)

                  ] |> move (0,-18)

                    |> notifyTap P4UR

            ,group[ 

                transitionButton Left P4U

                , text "Cafeteria"

                  |> filled white

                  |> scale 0.7

                  |> move (-77, 20)

                  ] |> move (60,20)

                    |> notifyTap P4U

            ]

        AdminSuccess ->

             [square 200 

                 |> filled black

             ,text "Well Done!"

                 |> centered

                 |> filled white

                 |> move (0,20)

             ,group [roundedRect 80 15 2 

                        |> filled (rgb 255 255 204)

                     ,roundedRect 78 13 2

                         |>filled (rgb 102 102 0)

                     ,text "Back to Admin"

                         |> size 11

                         |> centered 

                         |> filled white

                         |> move (0,-3)

                           

                    ]|> notifyTap ATB

             ]

        Admin  ->

            [background |> rotate (-1 *model.time)

            ,characters |> rotate model.time

            , group[

                rect 50 5

                  |> filled (rgb 255 255 204)

                  |> move (22,0)

                ,rect 5 40

                  |> filled (rgb 255 255 204)

                  |> move (-30,18)

            ]

            , group[

                roundedRect 55 18 2 

                    |> filled (rgb 255 255 204)

                , text "Admin"

                      |> centered

                      |> filled (rgb 102 102 0)

                      |> move (0,-4)

                      ] |>move(-30,0)

            ,group[ 

                transitionButton Right AT 

                , text "SwipeCardTask"

                  |> filled white

                  |> scale 0.7

                  |> move (34, 20)

                  ] |> notifyTap AT

                    |>move (0,-22)

            ,group[ 

                transitionButton Left P4LU

                , text "Cafeteria"

                  |> filled white

                  |> scale 0.7

                  |> move (-75, 20)

                  ] |> move (28,20)

                    |> notifyTap P4LU

            , if model.firstSwipe

              then group[]

              else group[

                    roundedRect 60 15 2 

                        |> filled grey

                        |> makeTransparent 0.6

                        |> move (-32,42)

                        ]

            ]

        SwipeCardTask  ->

           [ 

            

            ( html 10000000 10000000 <| Html.img [Html.Attributes.src adminTaskUrl] [] )

            -- background rendered by the Html Lib

               |> scale 0.4

               |> move (-130,70)   

            , swipeMachine 

            , button 

                |> filled (if model.button == Red then red else green) 

                |> move (40, 40)

            -- Just an additional feature, a timer

            , group 

                     [ rect model.time 10 

                         |> filled (rgb 0 model.time 255) 

                         |> move (-50 + 0.5 * (model.time - model.adminTime), 0)

                      , text (String.fromFloat (model.time - model.adminTime) |> String.left 6)

                         |> filled black

                         |> move (60,-4)

                      ] |> move (-10, 25)

            , card 

               |> move (model.cardPos)

               |> notifyTap Card

               |> notifyMouseDown CardDragState

               |> notifyMouseUp CardDragState

            , roundedRect 150 10 2 

               |> filled (rgb (6*model.time) 110 90)

               |> move (0,57)

            , text (model.swipeText)

                |> sansserif

                |> outlined (solid 1) black

                |> scale 0.6    

                |> move (-50, 55)

 

            , wallet

               |> move (0,-30)

 

            , photo

               |> move (0,-30)

            , rect 55 40

               |> filled (rgb 223 125 50)

               |> move (-30,-30)

            , lines

               |> move (0,-30) 

            -- To keep the track of the key presses 

            , case model.dragState of                       

                       CardDragging -> square 350 

                                        |> ghost 

                                        |> notifyMouseMoveAt DragCard 

                                        |> notifyMouseUp CardDragState

   

                       CardReleased  -> group []

         ]




type Msg = Tick Float GetKeyState

         | P1D

         | P1UL

         | P1L

         | P2DR

         | P2DL

         | P2D

         | P2L

         | P2LD

         | P2R

         | P2RD

         | RT

         | RTB

         | P3RDRU

         | P3RDR

         | P3DR

         | P4UR

         | P4U

         | P4LU

         | AT

         | ATB

         | Drag (Float, Float)

         | Drag1 (Float, Float)

         | Drag2 (Float, Float)

         | Drag3 (Float, Float)

         | Drag4 (Float, Float)

         | Drag5 (Float, Float)

         | ChangeDragState1 

         | ChangeDragState2 

         | ChangeDragState3 

         | ChangeDragState4 

         | ChangeDragState5

         | LeafPassed1

         | LeafPassed2

         | LeafPassed3

         | LeafPassed4

         | LeafPassed5

         | Dragx (Float, Float)

         | CleanFailed 

         | CleanPassed

         | AdminPassed

         | Card

         | CardDragState

         | DragCard (Float, Float)




type State = Cafeteria 

           | MedBay 

           | UpperEngine 

           | Reactor 

           | CleanUpTask 

           | Security

           | LowerEngine

           | Electrical 

           | Storage 

           | Admin 

           | SwipeCardTask 

           | ReactorTryAgain

           | ReactorSuccess

           | AdminSuccess




update msg model =

    case msg of

        Tick t _ ->

            if model.state == CleanUpTask && (model.time - model.cleanTime)>=30

            then { model | cleanTime = model.time, state = ReactorTryAgain}

            else {model | time = t}

            

        P1D ->

            case model.state of

                Cafeteria  ->

                    { model | state = MedBay  }

                otherwise ->

                    model                                                      

        P1UL ->

            case model.state of

                MedBay  ->

                    { model | state = UpperEngine  }

                otherwise ->

                    model

        P1L ->

            case model.state of

                Cafeteria  ->

                    { model | state = UpperEngine  }

                otherwise ->

                    model

        P2DR ->

            case model.state of

                UpperEngine  ->

                    { model | state = Security  }

                otherwise ->

                    model

        P2DL ->

            case model.state of

                UpperEngine  ->

                    { model | state = Reactor, firstClean=False}

                otherwise ->

                    model

        P2D ->

            case model.state of

                UpperEngine  ->

                    { model | state = LowerEngine  }

                otherwise ->

                    model

        P2L ->

            case model.state of

                Security  ->

                    { model | state = Reactor}

                otherwise ->

                    model

        P2LD ->

            case model.state of

                Security  ->

                    { model | state = LowerEngine  }

                otherwise ->

                    model

        P2R ->

            if model.firstClean

            then case model.state of

                  Reactor  ->

                      { model | state = Security  }

                  otherwise ->

                      model

             else

               model

        P2RD ->

            if model.firstClean

            then case model.state of

                    Reactor  ->

                        { model | state = LowerEngine  }

                    otherwise ->

                        model

            else 

                model

        RT ->

            case model.state of

                Reactor  ->

                    { model | state = CleanUpTask

                    , time=0 

                    , cleanTime = model.time  }

                otherwise ->

                    model

        RTB ->

            case model.state of

                ReactorSuccess  ->

                    { model | state = Reactor, mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5

                     , pos1 = (30,50)

                     , pos2 = (70,-5)

                     , pos3 = (-15,10)

                     , pos4 = (20,15)

                     , pos5 = (10,-35)  }

                otherwise ->

                    model

        Drag1 (x, y) -> { model | pos1 = (x, y) }

        Drag2 (x, y) -> { model | pos2 = (x, y) }

        Drag3 (x, y) -> { model | pos3 = (x, y) }

        Drag4 (x, y) -> { model | pos4 = (x, y) }

        Drag5 (x, y) -> { model | pos5 = (x, y) }

        Drag  (x, y) ->  { model | pos = (x, y) }

        Dragx (x, y) -> { model | posx = (x, 0) }

        

        P3RDRU ->

            case model.state of

                LowerEngine  ->

                    { model | state = Electrical  }

                otherwise ->

                    model

        P3RDR ->

            case model.state of

                LowerEngine  ->

                    { model | state = Storage  }

                otherwise ->

                    model

        P3DR ->

            case model.state of

                Electrical  ->

                    { model | state = Storage  }

                otherwise ->

                    model

        P4UR ->

            case model.state of

                Storage  ->

                    { model | state = Admin, firstSwipe=False  }

                otherwise ->

                    model

        P4U ->

            case model.state of

                Storage  ->

                    { model | state = Cafeteria  }

                otherwise ->

                    model

        P4LU ->

            case model.state of

                Admin  ->

                    { model | state = Cafeteria  }

                otherwise ->

                    model

        AT ->

            case model.state of

                Admin  ->

                    { model | state = SwipeCardTask, adminTime=model.time  }

                otherwise ->

                    model

        ATB ->

            case model.state of

                AdminSuccess  ->

                    { model | state = Admin  }

                otherwise ->

                    model

        CleanFailed ->

            case model.state of

                ReactorTryAgain  ->

                    { model | state   = CleanUpTask

                    , mouse           = Released

                    , dragState1      = Released1

                    , dragState2      = Released2

                    , dragState3      = Released3

                    , dragState4      = Released4

                    , dragState5      = Released5

                    , pos1 = (30,50)

                    , pos2 = (70,-5)

                    , pos3 = (-15,10)

                    , pos4 = (20,15)

                    , pos5 = (10,-35)

                    , leavesCompleted = 0

                    , time            = 0

                    , cleanTime       = model.time

                    }

                otherwise ->

                    model

        CleanPassed ->

            case model.state of

                CleanUpTask  ->

                    { model | state = ReactorSuccess, firstClean=True, mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5   

                     , pos1 = (30,50)

                     , pos2 = (70,-5)

                     , pos3 = (-15,10)

                     , pos4 = (20,15)

                     , pos5 = (10,-35)

                       }

                otherwise ->

                    model    

        AdminPassed ->

              case model.state of

                  SwipeCardTask ->

                     { model |state = AdminSuccess, firstSwipe= True

                     }

                  otherwise ->

                      model

                    

        ChangeDragState1 -> 

         { model | dragState1 = 

      

               case model.dragState1 of

                    Released1  -> MouseDown1

                    MouseDown1 -> Released1 }

        ChangeDragState2 ->

         { model | dragState2 = 

      

               case model.dragState2 of

                    Released2  -> MouseDown2

                    MouseDown2 -> Released2 }

        ChangeDragState3 ->

         { model | dragState3 = 

      

               case model.dragState3 of

                    Released3  -> MouseDown3

                    MouseDown3 -> Released3 }

        ChangeDragState4 ->

         { model | dragState4 = 

      

               case model.dragState4 of

                    Released4  -> MouseDown4

                    MouseDown4 -> Released4 }

        ChangeDragState5 ->

         { model | dragState5 = 

      

               case model.dragState5 of

                    Released5  -> MouseDown5

                    MouseDown5 -> Released5 }

        LeafPassed1 ->

         { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, pos1 = (500,500) }

        LeafPassed2 ->

         { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, pos2 = (500,500) }

        LeafPassed3 ->

         { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, pos3 = (500,500) }

        LeafPassed4 ->

         { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, pos4 = (500,500) }

        LeafPassed5 ->

         { model | mouse = Released, dragState1 = Released1, dragState2 = Released2, dragState3 = Released3, dragState4 = Released4, dragState5 = Released5, pos5 = (500,500) }

        -- Brings the card to the swiping slot on tapping 

        -- Uses the notifyTap library function 

        -- https://package.elm-lang.org/packages/MacCASOutreach/graphicsvg/latest/GraphicSVG#notifyTap

        Card -> 

         {model | cardPos = (-60, 40)}

        -- To control the dragging state of the card

        CardDragState ->

             case model.dragState of 

                 CardReleased -> {model | dragState = CardDragging}

                 CardDragging -> {model | dragState = CardReleased, cardPos = (-60, 40) , swipeText = "BAD READ ERROR!"}

        -- if time < 1 => Too fast, if time > 2 => Too slow         

        DragCard (x, y) ->

          if x < -30

            then { model | cardPos = (-60, 40) }

            else if model.swipeText == "BAD READ ERROR!"

                 then {model | swipeText = "PLEASE INSERT CARD HERE!"}

                 else if (x > 50 ) && (model.time - model.adminTime) > 2 

                      then { model | cardPos = (-60, 40)

                               , swipeText = "TOO SLOW!"

                               , adminTime=model.time

                               , dragState = CardReleased }

                      else if (x > 60 ) && (model.time - model.adminTime) < 1 

                           then { model | cardPos = (-60, 40)

                                    , adminTime=model.time

                                    , swipeText = "TOO FAST!" 

                      -- On the basis of the constraints specified in the lab notes

                                      , dragState = CardReleased}              

                           else if (x > 60 ) && (model.time - model.adminTime) < 2 && (model.time - model.adminTime) > 1 

                                then { model | cardPos = (-30, -10), swipeText = "TASK COMPLETE!"

                                    , state = AdminSuccess

                                    , firstSwipe= True

                                    , dragState = CardReleased

                                    , adminTime = 0

                                    , time = 0

                                    , button = Green } -- Red light turns to Green on completion of the task 

                

                               else {model | cardPos = (x,40)} 

              

  

type alias Model =

    { time : Float

    , cleanTime : Float

    , firstClean :Bool

    , firstSwipe :Bool

    , state : State

    , mouse: MousePressStates

    , dragState1 : MousePressStates1

    , dragState2 : MousePressStates2

    , dragState3 : MousePressStates3

    , dragState4 : MousePressStates4

    , dragState5 : MousePressStates5

    , pos1: (Float,Float)

    , pos2: (Float,Float)

    , pos3: (Float,Float)

    , pos4: (Float,Float)

    , pos5: (Float,Float)

    , leavesCompleted : Float

    , pos: (Float, Float)

    , posx: (Float,Float)

    , cardPos: (Float, Float)

    , dragState: CardDragState

    , adminTime: Float

    , swipeText: String

    , button: States

    }

    

type MousePressStates = Released | MouseDown

type MousePressStates1 = Released1 | MouseDown1

type MousePressStates2 = Released2 | MouseDown2

type MousePressStates3 = Released3 | MouseDown3

type MousePressStates4 = Released4 | MouseDown4

type MousePressStates5 = Released5 | MouseDown5

type CardDragState = CardDragging | CardReleased 

type States = Green | Red

 

init : Model     

init = { time = 0 

       , cleanTime = 0

       , state = Cafeteria

       , mouse = Released

       , dragState1 = Released1

       , dragState2 = Released2

       , dragState3 = Released3

       , dragState4 = Released4

       , dragState5 = Released5

       , pos1 = (30,50)

       , pos2 = (70,-5)

       , pos3 = (-15,10)

       , pos4 = (20,15)

       , pos5 = (10,-35)

       , leavesCompleted = 0

       , pos = (0,0)

       , posx = (0,0)

       , firstClean = False 

       , firstSwipe = False

       , cardPos = (-30, -10)

       , dragState = CardReleased

       , adminTime = 0

       , swipeText = "PLEASE INSERT CARD HERE!"

       , button = Red

       }

       




       

type ButtonPosition = Left | Right | Middle

 

transitionButton : ButtonPosition -> Msg -> Shape Msg

transitionButton pos msg = case pos of 

      Left   -> group [roundedRect 60 15 2 

                        |> filled (rgb 255 255 204)

                       ,roundedRect 58 13 2

                         |>filled (rgb 102 102 0)

                      ] |> move (-60, 22)

                        |> notifyTap msg

                       

      Right  -> group [roundedRect 60 15 2 

                        |> filled (rgb 255 255 204)

                       ,roundedRect 58 13 2

                         |>filled (rgb 102 102 0)

                      ] |> move (60, 22)

                        |> notifyTap msg

      Middle -> group [roundedRect 60 15 2 

                        |> filled (rgb 255 255 204)

                       ,roundedRect 58 13 2

                         |>filled (rgb 102 102 0)

                      ] |> move (0, 22)

                        |> notifyTap msg  




background = group [square 300

                      |> filled black

                    ,( html 100000 10000 <| Html.img [Html.Attributes.src imageUrl] [] )

                      |> scale 0.1

                      |> move (-95,60)

                   ]

characters = group[( html 100000 10000 <| Html.img [Html.Attributes.src imageUrl1] [] )

                      |> scale 0.012

                      |> move (-95,-29)

                   ,( html 100000 10000 <| Html.img [Html.Attributes.src imageUrl2] [] )

                      |> scale 0.05

                      |> move (60,-29)

                      ]

 

drop = group [ circle 30

                     |> filled (rgb 150 150 150)

                   , ngon 3 30

                     |> filled (rgb 150 150 150)

                     |> rotate (degrees 90)

                     |> move (0,30)

             ]

             

leaf1 = group [

           curve (-77.93,44.659) [Pull (-77.31,45.649) (-76.70,46.639),Pull (-76.57,46.515) (-76.45,46.391),Pull (-75.83,46.886) (-75.21,47.381),Pull (-74.59,45.896) (-73.97,44.412),Pull (-73.36,44.783) (-72.74,45.154),Pull (-71.13,44.041) (-69.52,42.927),Pull (-70.02,44.288) (-70.51,45.649),Pull (-70.39,46.020) (-70.26,46.391),Pull (-70.02,46.515) (-69.77,46.639),Pull (-70.26,48) (-70.76,49.360),Pull (-69.77,49.360) (-68.78,49.360),Pull (-67.42,49.113) (-66.06,48.865),Pull (-66.92,49.979) (-67.79,51.092),Pull (-68.28,51.711) (-68.78,52.329),Pull (-68.65,52.701) (-68.53,53.072),Pull (-69.89,53.443) (-71.25,53.814),Pull (-71.13,54.804) (-71.01,55.793),Pull (-72.24,55.298) (-73.48,54.804),Pull (-73.48,54.927) (-73.48,55.051),Pull (-74.22,54.309) (-74.96,53.567),Pull (-76.32,56.659) (-77.69,59.752),Pull (-76.45,56.783) (-75.21,53.814),Pull (-76.08,53.814) (-76.94,53.814),Pull (-78.18,53.072) (-79.42,52.329),Pull (-78.80,51.711) (-78.18,51.092),Pull (-78.80,49.855) (-79.42,48.618),Pull (-79.05,48.371) (-78.68,48.123),Pull (-78.80,47.381) (-78.92,46.639),Pull (-78.55,45.154) (-77.93,44.659)]

            |> filled darkRed

            |> move (16,-30)

           ,curve (-77.93,44.659) [Pull (-77.31,45.649) (-76.70,46.639),Pull (-76.57,46.515) (-76.45,46.391),Pull (-75.83,46.886) (-75.21,47.381),Pull (-74.59,45.896) (-73.97,44.412),Pull (-73.36,44.783) (-72.74,45.154),Pull (-71.13,44.041) (-69.52,42.927),Pull (-70.02,44.288) (-70.51,45.649),Pull (-70.39,46.020) (-70.26,46.391),Pull (-70.02,46.515) (-69.77,46.639),Pull (-70.26,48) (-70.76,49.360),Pull (-69.77,49.360) (-68.78,49.360),Pull (-67.42,49.113) (-66.06,48.865),Pull (-66.92,49.979) (-67.79,51.092),Pull (-68.28,51.711) (-68.78,52.329),Pull (-68.65,52.701) (-68.53,53.072),Pull (-69.89,53.443) (-71.25,53.814),Pull (-71.13,54.804) (-71.01,55.793),Pull (-72.24,55.298) (-73.48,54.804),Pull (-73.48,54.927) (-73.48,55.051),Pull (-74.22,54.309) (-74.96,53.567),Pull (-76.32,56.659) (-77.69,59.752),Pull (-76.45,56.783) (-75.21,53.814),Pull (-76.08,53.814) (-76.94,53.814),Pull (-78.18,53.072) (-79.42,52.329),Pull (-78.80,51.711) (-78.18,51.092),Pull (-78.80,49.855) (-79.42,48.618),Pull (-79.05,48.371) (-78.68,48.123),Pull (-78.80,47.381) (-78.92,46.639),Pull (-78.55,45.154) (-77.93,44.659)]

            |> filled red

            |> scale 0.8

            |> move (1,-19.5)

            ]|>scale 1.5

            

leaf2 = group [

         curve (-72.03,38.787) [Pull (-70.78,39.480) (-69.54,40.173),Pull (-69.40,40.034) (-69.26,39.896),Pull (-68.57,40.450) (-67.87,41.004),Pull (-67.32,39.896) (-66.77,38.787),Pull (-66.35,40.034) (-65.93,41.281),Pull (-65.93,42.251) (-65.93,43.220),Pull (-65.52,43.082) (-65.10,42.943),Pull (-65.66,43.774) (-66.21,44.606),Pull (-66.77,44.467) (-67.32,44.329),Pull (-66.35,45.714) (-65.38,47.099),Pull (-65.52,47.099) (-65.66,47.099),Pull (-66.49,45.852) (-67.32,44.606),Pull (-67.46,45.021) (-67.60,45.437),Pull (-68.29,45.714) (-68.98,45.991),Pull (-69.12,45.575) (-69.26,45.160),Pull (-69.95,45.160) (-70.64,45.160),Pull (-71.61,44.467) (-72.58,43.774),Pull (-71.61,43.359) (-70.64,42.943),Pull (-70.92,42.112) (-71.20,41.281),Pull (-71.06,41.004) (-70.92,40.727),Pull (-71.48,39.619) (-72.03,38.787)]

            |> filled darkRed

            |> move (20.4,-12.7)

        ,curve (-72.03,38.787) [Pull (-70.64,39.480) (-69.26,40.173),Pull (-69.26,40.034) (-69.26,39.896),Pull (-68.70,40.311) (-68.15,40.727),Pull (-67.32,39.757) (-66.49,38.787),Pull (-66.21,40.034) (-65.93,41.281),Pull (-65.93,42.112) (-65.93,42.943),Pull (-65.52,42.943) (-65.10,42.943),Pull (-65.66,43.774) (-66.21,44.606),Pull (-66.90,44.606) (-67.60,44.606),Pull (-67.74,45.160) (-67.87,45.714),Pull (-68.57,45.714) (-69.26,45.714),Pull (-69.12,45.437) (-68.98,45.160),Pull (-69.81,45.160) (-70.64,45.160),Pull (-70.64,45.021) (-70.64,44.883),Pull (-71.61,44.190) (-72.58,43.497),Pull (-71.61,43.220) (-70.64,42.943),Pull (-71.06,41.974) (-71.48,41.004),Pull (-71.20,40.865) (-70.92,40.727),Pull (-71.48,39.619) (-72.03,38.787)]

            |> filled red

            |> scale 0.7

            ]|>scale 1.5

 

vent = group [

    rect 100 250

    |> filled grey

    |> move (-100,0) ,

    rect 100 250

    |> outlined (solid 1) black 

    |> move (-100,0) ,

    rect 50 70

    |> filled darkCharcoal

    |> scaleX 0.5

    |> move (-73,0),

    triangle 5

    |> filled lightCharcoal

    |> rotate (degrees 180)

    |> move (-55,0),

    triangle 5

    |> filled lightCharcoal

    |> rotate (degrees 120)

    |> move (-91,0)

   ] 

 

    

card = group [ roundedRect 60 45 5

               |> filled darkBlue

               |> addOutline (solid 0.5) black

             ,rect 60 30

               |> filled lightBlue

             , text "CARD"

               |> filled white

               |> scaleX 0.7

               |> scaleY 0.6

               |> move (-10,16)

             , rect 15 20

               |> filled white 

               |> addOutline (dotted 1) lightGray

               |> move (-15,0)

             , group [circle 3 |> filled darkGray |> move(0,5)

             , rect 2 10|> filled darkGray |> move(0,3)

             , roundedRect 10 11.5 3|> filled darkGray|>move (0,-4.5)

             , rect 10 5 |> filled darkGray|>move (0,-7.5)]|>move (-15,0)

             , roundedRect 22 5 2|> filled white |>move(10,-7)

             , roundedRect 22 5 2|> filled white |>move(10,0)

             , roundedRect 22 5 2|> filled white |>move(10,7)

             ]

             

 

             

rectangle = rect 60 60 

  |> filled black

  |> scaleX 2

  

smallrect = roundedRect 100 15 2

  |> filled darkGreen 

  

outline = rect 100 15

  |> outlined (solid 1.5) black 

  

button = circle 4

 

   

wallet = group [rect 125 55

  |> filled (rgb 223 125 50)

  |> addOutline (solid 1) darkBrown,

  rect 1 55 |> filled darkBrown]

 

photo = group [ 

  roundedRect 40 40 5

  |> filled lightBlue

  |> makeTransparent 0.5

  |> move (32,0)

  |> addOutline (solid 1) darkBrown,

  roundedRect 15 1 1 

  |> filled white

  |> rotate (degrees 30)

  |> makeTransparent 0.5

  |> move (32,5),

  roundedRect 15 1 1

  |> filled white

  |> rotate (degrees 30)

  |> makeTransparent 0.5

  |> move (32,-5)]

 

lines = group [rect 55 1 |> filled darkBrown |> move (-30,20),

               rect 55 1 |> filled darkBrown |> move (-30,10),

               rect 55 1 |> filled darkBrown |> move (-30,0)]




swipeMachine = group [ roundedRect 150 45 10 |> filled (rgb 56 56 56) |> move (0,55)

            , roundedRect 90 8 5 |> filled black |> move (-29, 40)

            , triangle 8 |> filled black |> move (16,40)         

            , roundedRect 100 80 8

                |> filled darkGray

                |> makeTransparent 0.700

                |> move (0, -15.2)

                |> scaleX 1.5

                |> scaleY 1.3

            ]