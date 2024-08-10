/@  turn=game-component-ttt-turn
/@  role-assignment=game-component-ttt-role-assignment
/@  square=game-component-ttt-square
/-  f-mark-square=game-ttt-mark-square
|%
+$  give-up-params  pith:neo
++  give-up
|=  [=bowl:neo raw=*]
  ^-  (list card:neo)
  =/  turn  ;;(give-up-params raw)
  :~
      :-  (welp here.bowl turn)
      [%make %game-component-ttt-turn `[%game-component-ttt-turn !>(%done)] ~]
  ==
::
+$  is-my-turn-params  [turn=pith:neo roles=pith:neo]
++  is-my-turn
  |=  [=bowl:neo raw=*]
  ^-  ?
  =/  params  ;;(is-my-turn-params raw)
  =/  turn-shrub  (~(got of:neo kids.bowl) turn.params)
  =+  !<(=turn q.q.saga.turn-shrub)
  ?:  =(turn %done)  |
  =/  role-shrub  (~(got of:neo kids.bowl) (snoc roles.params turn))
  =+  !<(=role-assignment q.q.saga.role-shrub)
  =(ship.src.bowl p.role-assignment)
::
+$  get-square-params  [grid=pith:neo x=@ud y=@ud]
++  get-square
  |=  [=bowl:neo raw=*]
  ^-  square
  =/  params  ;;(get-square-params raw)
  =/  square-pith  (welp grid.params #/[ud/x.params]/[ud/y.params])
  =/  square-shrub  (~(got of:neo kids.bowl) square-pith)
  =+  !<(=square q.q.saga.square-shrub)
  square
::
+$  square-empty-params  square
++  square-empty
  |=  [=bowl:neo raw=*]
  ^-  ?
  =/  square  ;;(square-empty-params raw)
  =(%empty square)
::
+$  mark-square-params  [turn=pith:neo grid=pith:neo x=@ud y=@ud]
++  mark-square  f-mark-square
--
