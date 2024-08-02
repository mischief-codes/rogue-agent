/@  game-params-ttt-mark-square
/@  game-component-ttt-role

|=  [=bowl:neo params=*]
  ^-  (list card:neo)
  =/  typed-params  ;;(game-params-ttt-mark-square params)
  =/  turn-shrub  (~(got of:neo kids.bowl) turn.typed-params)
  =+  !<(symbol=game-component-ttt-role q.q.saga.turn-shrub)
  :~
    :-  :(welp here.bowl board.typed-params #/[ud/x.typed-params]/[ud/y.typed-params])
    [%make %game-component-grid-square `[%game-component-gr0d-square !>(`symbol)] ~]
  ==
