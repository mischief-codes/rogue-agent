/@  game-component-grid
/@  game-component
::
=>
|%
++  make-squares
  |=  [=bowl:neo columns=@ud rows=@ud]
  ^-  (list card:neo)
  %-  zing
  %+  turn  (gulf 0 (sub columns 1))
  |=  col=@ud
  ^-  (list card:neo)
  %-  zing
  %+  turn  (gulf 0 (sub rows 1))
  |=  row=@ud
  (make-square bowl row col)
::
++  make-square
  |=  [=bowl:neo row=@ud col=@ud]
  ^-  (list card:neo)
  =/  =pith:neo  (welp here.bowl #/[ud/row]/[ud/col])
  :~  [pith %make %game-component-grid-square ~ ~]
  ==
--
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
  *(set stud:neo)
::
++  kids
  ^-  kids:neo
  *kids:neo
  :: %-  some
  :: :-  %z
  :: %-  ~(gas by *lads:neo)
  :: :~  :-  [&/%ud |/%ud &]  [[pro/%game-component] ~]
  :: ==
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
    ~&  'grid'
    ~&  'pal'
    ~&  q:(need pal)
    =+  !<(grid=game-component-grid q:(need pal))
    [(make-squares bowl x.grid y.grid) game-component/!>(~)]
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
