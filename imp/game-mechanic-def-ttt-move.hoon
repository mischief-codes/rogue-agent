/@  game-component-grid-square
/@  game-condition
/@  game-resolution
::
^-  kook:neo
|%
::
::  condition
::  effect
::
++  state
  ^-  curb:neo
  [%pro %game-mechanic]
::
++  poke
  ^-  (set stud:neo)
  *(set stud:neo)
::
++  kids
  ^-  kids:neo
  %-  some
  :-  %y
  %-  ~(gas by *lads:neo)
  :~  :-  [&/%condition |]    [[%pro %game-condition] ~]
      :-  [&/%resolution |]   [[%pro %game-resolution] ~]
  ==
::
++  deps
  ^-  deps:neo
  *deps:neo
::
++  form
  ^-  form:neo
  |_  [=bowl:neo =aeon:neo =pail:neo]
    ::
    ++  init
      |=  vax=(unit pail:neo)
      ^-  (quip card:neo pail:neo)
      :_  game-mechanic/!>([jurisdiction=game-component-grid-square])
      :~  [(snoc here.bowl %condition) %make %game-condition-ttt-move `game-condition/!>(~) ~]
          [(snoc here.bowl %resolution) %make %game-resolution-ttt-move `game-resolution/!>(~) ~]
      ==
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
