/@  game-component-ttt-role-assignment
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
      =+  !<(assignment=game-component-ttt-role-assignment q:(need pal))
      `game-component/!>(assignment)
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
