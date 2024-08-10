/@  turn=game-component-ttt-turn
/@  role-assignment=game-component-ttt-role-assignment
|%
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
+$  mark-square-params  [turn=pith:neo grid=pith:neo x=@ud y=@ud]
--
