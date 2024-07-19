/@  game-mechanic

^-  kook:neo
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
  %-  some
  :-  %y
  %-  ~(gas by *lads:neo)
  :~  [[&/%params |/%ud |] pro/%game-param-assignment ~]
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
      =/  [=stud:neo =vase]  (need pal)
      =+  !<(mechanic=game-mechanic vase)
      :_  game-mechanic/!>(mechanic)
      :~  :-  (welp here.bowl #/params/[ud/0])  [%make %game-param-assignment `[%game-param-assignment !>([%bind value=[1 ~]])] ~]
      ==
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
