/@  game-component
/@  game-component-grid
/@  game-component-root-diff
::
^-  kook:neo
|%
::
++  state
  ^-  curb:neo
  [%pro %game-component]
::
++  poke
  ^-  (set stud:neo)
  (sy %game-component-root-diff ~)
::
++  kids
  ^-  kids:neo
  %-  some
  :-  %z
  %-  ~(gas by *lads:neo)
  :~  [& pro/%game-component ~]
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
      |=  pal=(unit pail:neo)
      ^-  (quip card:neo pail:neo)
      :_  game-component/!>(1)
      :~
        :-  (snoc here.bowl %grid)
          [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
      ==
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      =/  grid  (~(get of:neo kids.bowl) #/grid)
      ~&  grid
      =/  grid-square  (~(get of:neo kids.bowl) #/grid/[ud/0]/[ud/0])
      ~&  grid-square
      `game-component/!>(1)
  --
--
