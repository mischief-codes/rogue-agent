/@  game-computation
/@  game-condition
/@  game-resolution
::
^-  kook:neo
|%
::
++  state
  ^-  curb:neo
  [%pro %game-mechanics-config]
::
++  poke
  ^-  (set stud:neo)
  *(set stud:neo)
++  kids
  ^-  kids:neo
  %-  some
  :-  %z
  %-  ~(gas by *lads:neo)
  :~  :-  &  [[%or :~(pro/%game-computation pro/%game-condition pro/%game-resolution)] ~]
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
      :_  game-mechanics-config/!>(~)
      :~  :-  (welp here.bowl #/ttt-square-empty)
             [%make %game-condition-ttt-square-empty ~ ~]
      ==
    ::
    ++  poke
      |=  =pail:neo
      ^-  (quip card:neo pail:neo)
      !!
  --
--
