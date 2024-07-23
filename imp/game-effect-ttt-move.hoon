:: /@  game-component-grid-index
^-  kook:neo
=>
|%
++  resolve-ttt-move
   |=  [=bowl:neo =lore:neo params=(map @tas vase)]
   &
  ::  ^-  (list card:neo)
  ::  *(list card:neo)
  ::  =/  vax=vase  (~(got by params) %grid-index)
  ::  =/  idx=game-component-grid-index  !<(game-component-grid-index vax)
  ::  :~  :-  (welp here.bowl #/components/board/[ud/x.idx]/[ud/y.idx])
  ::    [%make %game-component-ttt-x `[%game-component-ttt-x !>(~)] ~]
  ::  ==
--
|%
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
      `game-mechanic/!>([%condition resolve-ttt-move])
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
