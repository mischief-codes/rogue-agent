/@  game-condition
^-  kook:neo
|%
::
++  state
  ^-  curb:neo
  [%pro %game-condition]
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
      =+  !<(test=game-condition q:(need pal))
      `game-condition/!>(test)
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
