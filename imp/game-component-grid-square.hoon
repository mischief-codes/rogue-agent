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
      ?~  pal  `game-component/!>(~)
      =/  [=stud:neo =vase]  (need pal)
      `game-component/vase
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
