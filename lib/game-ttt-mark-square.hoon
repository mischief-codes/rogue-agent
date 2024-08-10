/@  game-component-ttt-turn
/@  game-component-ttt-square
/@  game-component-ttt-role

=>
|%
+$  mark-square-params
  [turn=pith:neo grid=pith:neo x=@ud y=@ud]
++  check-win
  |=  [=bowl:neo grid=pith player=game-component-ttt-role]
  ^-  ?
  ?:  (check-rows bowl grid player)  &
  ?:  (check-columns bowl grid player)  &
  (check-diagonals bowl grid player)
::
++  check-rows
  |=  [=bowl:neo grid=pith player=game-component-ttt-role]
  ^-  ?
  =/  row=@ud  0
  |-
  ?:  (gth row 2)  |
  =/  win=?  (check-row bowl grid player row)
  ?:  win  &
  %=($ row +(row))
::
++  check-row
  |=  [=bowl:neo grid=pith player=game-component-ttt-role row=@ud]
  ^-  ?
  =/  col=@ud  0
  |-
  =/  square-shrub  (~(got of:neo kids.bowl) (welp grid #/[ud/col]/[ud/row]))
  =+  !<(square=game-component-ttt-square q.q.saga.square-shrub)
  ?.  (match square player)  |
  ?:  =(col 2)  &
  %=($ col +(col))
::
++  check-columns
  |=  [=bowl:neo grid=pith player=game-component-ttt-role]
  ^-  ?
  =/  col=@ud  0
  |-
  ?:  (gth col 2)  |
  =/  win=?  (check-column bowl grid player col)
  ?:  win  &
  %=($ col +(col))
::
++  check-column
  |=  [=bowl:neo grid=pith player=game-component-ttt-role col=@ud]
  ^-  ?
  =/  row=@ud  0
  |-
  =/  square-shrub  (~(got of:neo kids.bowl) (welp grid #/[ud/col]/[ud/row]))
  =+  !<(square=game-component-ttt-square q.q.saga.square-shrub)
  ?.  (match square player)  |
  ?:  =(row 2)  &
  %=($ row +(row))
::
++  check-diagonals
  |=  [=bowl:neo grid=pith player=game-component-ttt-role]
  ^-  ?
  ?:  (check-up-diagonal bowl grid player)  &
  (check-down-diagonal bowl grid player)
::
++  check-up-diagonal
  |=  [=bowl:neo grid=pith player=game-component-ttt-role]
  ^-  ?
  =/  row=@ud  0
  =/  col=@ud  0
  |-
  =/  square-shrub  (~(got of:neo kids.bowl) (welp grid #/[ud/col]/[ud/row]))
  =+  !<(square=game-component-ttt-square q.q.saga.square-shrub)
  ?.  (match square player)  |
  ?:  =(row 2)  &
  %=($ row +(row), col +(col))
::
++  check-down-diagonal
  |=  [=bowl:neo grid=pith player=game-component-ttt-role]
  ^-  ?
  =/  row=@ud  2
  =/  col=@ud  0
  |-
  =/  square-shrub  (~(got of:neo kids.bowl) (welp grid #/[ud/col]/[ud/row]))
  =+  !<(square=game-component-ttt-square q.q.saga.square-shrub)
  ?.  (match square player)  |
  ?:  =(col 2)  &
  %=($ row (sub row 1), col +(col))
::
++  match
  |=  [square=game-component-ttt-square player=game-component-ttt-role]
  ?:  =(square %empty)  |
  =/  square-player=game-component-ttt-role  ?+(square !! %x %x, %o %o)
  =(square-player player)
::
--
|=  [=bowl:neo raw=*]
  ^-  (list card:neo)
  =/  params  ;;(mark-square-params raw)
  =/  turn-shrub  (~(got of:neo kids.bowl) turn.params)
  =+  !<(turn=game-component-ttt-turn q.q.saga.turn-shrub)
  ?:  =(%done turn)  !!
  =/  next-turn=game-component-ttt-turn  ?+(turn !! %o %x, %x %o)
  =/  role=game-component-ttt-role  ?+(turn !! %o %o, %x %x)
  =/  square=game-component-ttt-square  ?+(turn !! %o %o, %x %x)
  =/  square-pith=pith  (welp grid.params #/[ud/x.params]/[ud/y.params])
  =/  square-shrub  (~(got of:neo kids.bowl) square-pith)
  =.  q.q.saga.square-shrub  !>(square)
  =.  kids.bowl  (~(put of:neo kids.bowl) square-pith square-shrub)
  =/  cards=(list card:neo)
  :~
    :-  (welp here.bowl square-pith)
      [%make %game-component-grid-square `[%game-component-grid-square !>(square)] ~]
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
