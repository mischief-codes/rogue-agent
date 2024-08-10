/@  game-params-ttt-give-up
|=  [=bowl:neo params=*]
  ^-  (list card:neo)
  =/  turn  ;;(game-params-ttt-give-up params)
  :~
      :-  (welp here.bowl turn)
      [%make %game-component-ttt-turn `[%game-component-ttt-turn !>(%done)] ~]
  ==
