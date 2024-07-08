/@  game-condition
/@  game-component-grid-square
/@  game-component-grid-index
::
=>
|%
++  square-empty
|=  [=bowl:neo square=lore:neo params=(map @tas vase)]
  ^-  ?
  =/  vax=vase  (~(got by params) %grid-index)
  =/  idx=game-component-grid-index  !<(game-component-grid-index vax)
  =/  =pith  (welp here.bowl #/board/[ud/x.idx]/[ud/y.idx]/x)
  =/  square-contents  (~(get of:neo kids.bowl) pith)
  ?~  square-contents  &  |
--
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
      :_  game-condition/!>(square-empty)
      :~  :-   (snoc here.bowl %ttt-resolution-move)
            [%make %game-resolution-ttt-move ~ ~]
      ==
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
