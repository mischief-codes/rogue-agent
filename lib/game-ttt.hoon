/@  turn=game-component-ttt-turn
/@  role-assignment=game-component-ttt-role-assignment
/@  square=game-component-ttt-square
/@  role=game-component-ttt-role
::
=<
|%
+$  give-up-params  pith:neo
++  give-up
|=  [=bowl:neo raw=*]
  ^-  (list card:neo)
  =/  tur  ;;(give-up-params raw)
  :~
      :-  (welp here.bowl tur)
      [%make %game-component-ttt-turn `[%game-component-ttt-turn !>(%done)] ~]
  ==
::
+$  is-my-turn-params  [turn=pith:neo roles=pith:neo]
++  is-my-turn
  |=  [=bowl:neo raw=*]
  ^-  ?
  =/  params  ;;(is-my-turn-params raw)
  =/  turn-shrub  (~(got of:neo kids.bowl) turn.params)
  =+  !<(tur=turn q.q.saga.turn-shrub)
  ?:  =(tur %done)  |
  =/  role-shrub  (~(got of:neo kids.bowl) (snoc roles.params tur))
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
++  mark-square
  |=  [=bowl:neo raw=*]
  ^-  (list card:neo)
  =/  params  ;;(mark-square-params raw)
  =/  turn-shrub  (~(got of:neo kids.bowl) turn.params)
  =+  !<(tur=turn q.q.saga.turn-shrub)
  ?:  =(%done tur)  !!
  =/  next-turn=turn  ?+(tur !! %o %x, %x %o)
  =/  role=role  ?+(tur !! %o %o, %x %x)
  =/  sqr=square  ?+(tur !! %o %o, %x %x)
  =/  square-pith=pith  (welp grid.params #/[ud/x.params]/[ud/y.params])
  =/  square-shrub  (~(got of:neo kids.bowl) square-pith)
  =.  q.q.saga.square-shrub  !>(sqr)
  =.  kids.bowl  (~(put of:neo kids.bowl) square-pith square-shrub)
  =/  cards=(list card:neo)
  :~
    :-  (welp here.bowl square-pith)
      [%make %game-component-ttt-square `[%game-component-ttt-square !>(sqr)] ~]
  ==
  =/  next-turn=card:neo
      :-  (welp here.bowl turn.params)
      [%make %game-component-ttt-turn `[%game-component-ttt-turn !>(next-turn)] ~]
  =/  end-game=card:neo
      :-  (welp here.bowl turn.params)
      [%make %game-component-ttt-turn `[%game-component-ttt-turn !>(%done)] ~]
  =/  win=?  (check-win bowl grid.params role)
  ~&  'win?'  ~&  win
  ?:  win  (snoc cards end-game)
  (snoc cards next-turn)
--
::
::  check win
::
|%
++  check-win
  |=  [=bowl:neo grid=pith player=role]
  ^-  ?
  ?:  (check-rows bowl grid player)  &
  ?:  (check-columns bowl grid player)  &
  (check-diagonals bowl grid player)
::
++  check-rows
  |=  [=bowl:neo grid=pith player=role]
  ^-  ?
  =/  row=@ud  0
  |-
  ?:  (gth row 2)  |
  =/  win=?  (check-row bowl grid player row)
  ?:  win  &
  %=($ row +(row))
::
++  check-row
  |=  [=bowl:neo grid=pith player=role row=@ud]
  ^-  ?
  =/  col=@ud  0
  |-
  =/  square-shrub  (~(got of:neo kids.bowl) (welp grid #/[ud/col]/[ud/row]))
  =+  !<(sqr=square q.q.saga.square-shrub)
  ?.  (match sqr player)  |
  ?:  =(col 2)  &
  %=($ col +(col))
::
++  check-columns
  |=  [=bowl:neo grid=pith player=role]
  ^-  ?
  =/  col=@ud  0
  |-
  ?:  (gth col 2)  |
  =/  win=?  (check-column bowl grid player col)
  ?:  win  &
  %=($ col +(col))
::
++  check-column
  |=  [=bowl:neo grid=pith player=role col=@ud]
  ^-  ?
  =/  row=@ud  0
  |-
  =/  square-shrub  (~(got of:neo kids.bowl) (welp grid #/[ud/col]/[ud/row]))
  =+  !<(sqr=square q.q.saga.square-shrub)
  ?.  (match sqr player)  |
  ?:  =(row 2)  &
  %=($ row +(row))
::
++  check-diagonals
  |=  [=bowl:neo grid=pith player=role]
  ^-  ?
  ?:  (check-up-diagonal bowl grid player)  &
  (check-down-diagonal bowl grid player)
::
++  check-up-diagonal
  |=  [=bowl:neo grid=pith player=role]
  ^-  ?
  =/  row=@ud  0
  =/  col=@ud  0
  |-
  =/  square-shrub  (~(got of:neo kids.bowl) (welp grid #/[ud/col]/[ud/row]))
  =+  !<(sqr=square q.q.saga.square-shrub)
  ?.  (match sqr player)  |
  ?:  =(row 2)  &
  %=($ row +(row), col +(col))
::
++  check-down-diagonal
  |=  [=bowl:neo grid=pith player=role]
  ^-  ?
  =/  row=@ud  2
  =/  col=@ud  0
  |-
  =/  square-shrub  (~(got of:neo kids.bowl) (welp grid #/[ud/col]/[ud/row]))
  =+  !<(sqr=square q.q.saga.square-shrub)
  ?.  (match sqr player)  |
  ?:  =(col 2)  &
  %=($ row (sub row 1), col +(col))
::
++  match
  |=  [square=square player=role]
  ?:  =(square %empty)  |
  =/  square-player=role  ?+(square !! %x %x, %o %o)
  =(square-player player)
::
--
