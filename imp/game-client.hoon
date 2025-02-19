/@  game-client-diff
/@  game-instance
/-  ttt-test=game-ttt-test
::
::
^-  kook:neo
|%
::
++  state
  ^-  curb:neo
  [%pro %game-client]
::
++  poke
  ^-  (set stud:neo)
  (sy %game-client-diff ~)
::
++  kids
  ^-  kids:neo
  %-  some
  :-  %y
  %-  ~(gas by *lads:neo)
  :~  :-  [&/%instance |/%tas |/%ud |]  [pro/%game-instance ~]
      :-  [&/%preset |/%t &]  [pro/%game-preset ~]
  ==
::
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
      |=  vas=(unit pail:neo)
      ^-  (quip card:neo pail:neo)
      :_  game-client/!>(~)
      =/  =pith:neo  (welp here.bowl #/tic-tac-toe/[ud/0])
      :~  :-  (welp here.bowl #/instance/tic-tac-toe/[ud/0])
            [%make %game-instance `[%game-instance !>(~)] ~]
          :-  (welp here.bowl #/preset/tic-tac-toe)
            [%make %game-preset `[%game-preset !>(~)] ~]
      ==
    ::
    ++  poke
      |=  [=stud:neo vax=vase]
      ^-  (quip card:neo pail:neo)
      ?>  ?=(%game-client-diff stud)
      =+  !<(diff=game-client-diff vax)
      :_  pail
      ?-    -.diff
          %add-game-instance
        =/  game-idx=@ud  (lent ~(tap of:neo kids.bowl))
        =/  =pith:neo  (welp here.bowl #/[name.diff]/[ud/game-idx])
        :~  :-  pith
            [%make %game-instance `[%game-instance !>(~)] ~]
        ==
      ::
          %del-game-instance
        :~  :-  (welp here.bowl #/[name.diff]/[ud/idx.diff])
            [%cull ~]
        ==
      ::
          %test
        =/  game-idx=@ud  (lent ~(tap of:neo kids.bowl))
        =/  test-instance=pith:neo   (welp here.bowl #/test/[ud/game-idx])
        =/  setup=(list card:neo)
        :~  :-  here.bowl
              [%poke %game-client-diff !>([%add-game-instance %test])]
            :-  test-instance
              [%poke %game-instance-diff !>([%setup ~])]
        ==
        =/  test-actions  (ttt-test test-instance)
        (welp setup test-actions)
      ==
  --
--
