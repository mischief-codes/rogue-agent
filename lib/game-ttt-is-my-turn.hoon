/@  game-params-ttt-is-my-turn
/@  game-component-ttt-role
/@  game-component-ttt-role-assignment

|=  [=bowl:neo params=*]
  ^-  ?
  =/  typed-params  ;;(game-params-ttt-is-my-turn params)
  =/  turn-shrub  (~(got of:neo kids.bowl) turn.typed-params)
  =+  !<(active-player=game-component-ttt-role q.q.saga.turn-shrub)
  =/  role-shrub  (~(got of:neo kids.bowl) (snoc roles.typed-params active-player))
  =+  !<(role-assignment=game-component-ttt-role-assignment q.q.saga.role-shrub)
  =(ship.src.bowl p.role-assignment)
