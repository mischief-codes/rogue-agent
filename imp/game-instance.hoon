/@  game-instance-diff
/@  game-player
/@  game-component
/@  game-fog
/@  game-mechanics-config
/@  game-component-grid
=>
|%
++  resolve-computation  !!
++  resolve-condition  !!
++  resolve-effects  !!
++  resolve-interaction
  |=  [=bowl:neo =pith:neo context=(map @tas vase)]
  ^-  ?
  :: =/  mechanics  (~(get of:neo kids.bowl) #/mechanics)
  :: get kids
  :: for each iota in pith, check if it's a shrub
  :: if it's a shrub, check what kind
  :: ~&  "pith: {pith}"
  &
--
::
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
      [[&/%mechanics |] pro/%game-mechanics-config ~]
      [[&/%fog |/%tas |] pro/%game-fog ~]
      [[&/%components |/%tas |] pro/%game-component ~]
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
      |=  pal=(unit pail:neo)
      ^-  (quip card:neo pail:neo)
      :_  game-instance/!>(~)
      :~  :-  (welp here.bowl #/mechanics)
            [%make %game-mechanics-config `[%game-mechanics-config !>(~)] ~]
          :-   (welp here.bowl #/components/grid)
            [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
      ==
    ::
    ++  poke
      |=  [=stud:neo vax=vase]
      ^-  (quip card:neo pail:neo)
      ?>  ?=(%game-instance-diff stud)
      =/  diff=game-instance-diff  !<(game-instance-diff vax)
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
        ::   %add-mechanic
        :: :~  :-   (snoc (snoc here.bowl %mechanics) mark.diff)
        ::     [%make mark.diff init.diff ~]
        :: ==
          %add-fog
        :~  :-   (snoc (snoc here.bowl %fog) mark.diff)
            [%make mark.diff init.diff ~]
        ==
          %add-component
        :~  :-  (snoc (snoc here.bowl %components) name.diff)
            [%make mark.diff init.diff ~]
        ==
          %interact
        :: =/  pax=pith:neo  #/[p/our.bowl]/home/test
        =/  cards  (resolve-interaction bowl p.diff params.diff)
        ~
          %kill
        :~  :-  (snoc here.bowl %mechanics)  [%cull ~]
            :-  (snoc here.bowl %components)  [%cull ~]
        ==
          %setup
        :~  :-  (snoc here.bowl %mechanics)
              [%make %game-mechanics-config `[%game-mechanics-config !>(~)] ~]
            :-   (welp here.bowl #/components/grid)
              [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
        ==
      ==
  --
--
