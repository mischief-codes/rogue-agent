/@  game-instance-diff
/@  game-player
/@  game-component
/@  game-fog
^-  kook:neo
|%
++  state
  ^-  curb:neo
  [%pro %game-instance]
::
++  poke
  ^-  (set stud:neo)
  (sy %game-instance-diff ~)
::
++  kids
  ^-  kids:neo
  %-  some
  :-  %y
  %-  ~(gas by *lads:neo)
  :~  [[[&/%player |/%p |]] pro/%game-player ~]
      [[&/%mechanics |/%t |] pro/%game-mechanic ~]
      [[&/%fog |/%t |] pro/%game-fog ~]
      [[&/%components |/%t |] pro/%game-component ~]
  ==
::
++  deps
  ^-  deps:neo
  *deps:neo
::
++  form
  ^-  form:neo
  |_  [=bowl:neo =aeon:neo =pail:neo]
    +*  state  !<(number state-vase)
    ::
    ++  init
      |=  old=(unit pail:neo)
      ^-  (quip card:neo pail:neo)
      `game-instance/!>(~)
      ::  :~  :-  (snoc here.bowl 'config')
          :: [%make %game-config ~ ~]
      :: ==
    ::
    ++  poke
      |=  [=stud:neo vax=vase]
      ^-  (quip card:neo pail:neo)
      ?>  ?=(%game-instance-diff stud)
      =/  diff  !<(game-instance-diff vax)
      :_  pail
      ?-    -.diff
          %join
        :~  :-  (snoc here.bowl p/our.bowl)
            [%make %game-player `[%game-player !>(our.bowl)] ~]
        ==
          %add-player
        :~  :-  (snoc here.bowl p/who.diff)
            [%make %game-player `[%game-player !>(who.diff)] ~]
        ==
          %kick-player
        :~  :-  (snoc here.bowl p/who.diff)
            [%cull ~]
        ==
          %add-component
        :~  :-  (welp here.bowl pith.diff)
            [%make stud.diff init.diff ~]
        ==
      ==
  --
--
