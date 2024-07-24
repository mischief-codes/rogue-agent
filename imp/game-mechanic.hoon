/@  game-mechanic
/@  game-mechanic-diff

^-  kook:neo
|%
::
++  state
  ^-  curb:neo
  [%pro %game-mechanic]
::
++  poke
  ^-  (set stud:neo)
  (sy %game-mechanic-diff ~)
::
++  kids
  ^-  kids:neo
  %-  some
  :-  %y
  %-  ~(gas by *lads:neo)
  :~  [[|/%ud |] pro/%game-param-assignment ~]
      [[|/%tas |] pro/%game-mechanic ~]
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
      `game-mechanic/!>(mechanic)
    ::
    ++  poke
      |=  [=stud:neo vax=vase]
      ^-  (quip card:neo pail:neo)
      ?>  ?=(%game-mechanic-diff stud)
      =/  diff=game-mechanic-diff  !<(game-mechanic-diff vax)
      :_  pail
      ?-    -.diff
          %debug
        =/  whatever
        %+  turn
            ~(tap of:neo kids.bowl)
            |=  [=pith:neo =idea:neo]
            ~&  >>  'PITH:'  ~&  >>  pith
            ~
        *(list card:neo)
      ::
          %bind
        :~
          :-  (snoc here.bowl [%ud idx.diff])
              [%make %game-param-assignment `[%game-param-assignment !>([%bind value.diff])] ~]
        ==
      ::
          %add-child
        :~
          :-  (snoc here.bowl name.diff)
              [%make %game-mechanic `[%game-mechanic !>([%condition f.diff])] ~]
        ==

      ==
  --
--
