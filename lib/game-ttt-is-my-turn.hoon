/@  game-params-ttt-is-my-turn
/@  game-component-ttt-turn
/@  game-component-ttt-role-assignment

|=  [=bowl:neo params=*]
  ^-  ?
  =/  typed-params  ;;(game-params-ttt-is-my-turn params)
  =/  turn-shrub  (~(got of:neo kids.bowl) turn.typed-params)
  =+  !<(turn=game-component-ttt-turn q.q.saga.turn-shrub)
  ?:  =(turn %done)  |
  =/  role-shrub  (~(got of:neo kids.bowl) (snoc roles.typed-params turn))
  =+  !<(role-assignment=game-component-ttt-role-assignment q.q.saga.role-shrub)
  =(ship.src.bowl p.role-assignment)
