/@  game-component-ttt-role
/@  game-component-ttt-turn

^-  kook:neo
|%
::
++  state
  ^-  curb:neo
  [%pro %game-component]
::
++  poke
  ^-  (set stud:neo)
  *(set stud:neo)
::
++  kids
  ^-  kids:neo
  *kids:neo
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
      |=  pal=(unit pail:neo)
      ^-  (quip card:neo pail:neo)
      ?~  pal  `game-component/!>(%x)
      =/  [=stud:neo =vase]  (need pal)
      =+  !<(turn=game-component-ttt-turn vase)
      `game-component/!>(turn)
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
