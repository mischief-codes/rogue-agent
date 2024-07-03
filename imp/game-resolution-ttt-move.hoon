^-  kook:neo
|%
::
++  state
  ^-  curb:neo
  [%pro %game-resolution]
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
      |=  vax=(unit pail:neo)
      ^-  (quip card:neo pail:neo)
      `game-resolution/!>(~)
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
