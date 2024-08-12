=>
|%
++  move-tic-tac-toe
  |=  [[x=@ud y=@ud] instance=pith:neo]
  ^-  card:neo
  =/  context  %-  ~(gas by *(map @tas *))  :~([%ttt-arg-coordinates [x y]])
  =/  mechanic=pith:neo  #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/ttt-square-empty/ttt-mark-square
  :-  instance
    [%poke %game-instance-diff !>([%interact mechanic context])]
::
++  test-tic-tac-toe
  |=  instance=pith:neo
  ^-  (list card:neo)
  =/  test-moves=(list [@ud @ud])  ~[[2 0] [1 2] [1 1] [2 1] [0 2]]
  %+  turn  test-moves  (curr move-tic-tac-toe instance)
--
::
|=  instance=pith:neo
(test-tic-tac-toe instance)
