/@  game-instance-diff
/@  game-player
/@  game-component
/@  game-fog
/@  game-component-grid
/@  game-mechanic
=>
|%
++  resolve-interaction
  |=  [=bowl:neo full-pith=pith:neo context=(map @tas vase)]
  ^-  (list card:neo)
  =/  partial-pith-len=@  1
  =/  domain  *lore:neo
  |-
  ?:  (gth partial-pith-len (lent full-pith))  *(list card:neo)
  =/  partial-pith=pith:neo  (swag [0 partial-pith-len] full-pith)
  ~&  >>>  partial-pith
  =/  kid  (~(get of:neo kids.bowl) partial-pith)
  ?~  kid  %=($ partial-pith-len +(partial-pith-len))
  =+  !<(child=game-mechanic q.q.saga.u.kid)
  ~&  >>  -.child
  ?-  -.child
    %condition
      =/  allowed=?  (f.child bowl domain context)
      ~&  >>>  "allowed"  ~&  >>>  allowed
      ?.  allowed  !!  %=($ partial-pith-len +(partial-pith-len))
    ::
    %computation
      =/  new-context  (f.child bowl domain context)
      ~&  >>>  "new-context"  ~&  >>>  new-context
      %=($ partial-pith-len +(partial-pith-len))
    ::
    %effect
      =/  new-cards=(list card:neo)  (f.child bowl domain context)
      ~&  >>>  "new-cards"  ~&  >>>  new-cards
      new-cards
  ==
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
  :-  %z
  %-  ~(gas by *lads:neo)
  :~  [[&/%mechanics &] pro/%game-mechanic ~]
      [[&/%components &] pro/%game-component ~]
      :: [[&/%fog |/%tas |] pro/%game-fog ~]
      :: [[[&/%player |/%p |]] pro/%game-player ~]
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
      :~  :-  (welp here.bowl #/mechanics/ttt-square-empty)
            [%make %game-condition-ttt-square-empty ~ ~]
          :-   (welp here.bowl #/components/grid)
            [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
      ==
    ::
    ++  poke
      |=  [=stud:neo vax=vase]
      ^-  (quip card:neo pail:neo)
      :: ?:  ?=(%gift stud)  ~&  >>>  'gift'  ~&  >>>  vax  `pail
      ?>  ?=(%game-instance-diff stud)
      =/  diff=game-instance-diff  !<(game-instance-diff vax)
      :_  pail
      ?-    -.diff
        ::   %join
        :: :~  :-  (snoc here.bowl p/our.bowl)
        ::     [%make %game-player `[%game-player !>(our.bowl)] ~]
        :: ==
        ::   %add-player
        :: :~  :-  (snoc here.bowl p/who.diff)
        ::     [%make %game-player `[%game-player !>(who.diff)] ~]
        :: ==
        ::   %kick-player
        :: :~  :-  (snoc here.bowl p/who.diff)
        ::     [%cull ~]
        :: ==
        ::   %add-mechanic
        :: :~  :-   (snoc (snoc here.bowl %mechanics) mark.diff)
        ::     [%make mark.diff init.diff ~]
        :: ==
        ::   %add-fog
        :: :~  :-   (snoc (snoc here.bowl %fog) mark.diff)
        ::     [%make mark.diff init.diff ~]
        :: ==
        ::   %add-component
        :: :~  :-  (snoc (snoc here.bowl %components) name.diff)
        ::     [%make mark.diff init.diff ~]
        :: ==
          %interact
        :: =/  pax=pith:neo  #/[p/our.bowl]/home/test
        =/  cards  (resolve-interaction bowl pith.diff params.diff)
        *(list card:neo)
          %kill
        :~  :-  (welp here.bowl #/mechanics/ttt-square-empty)  [%cull ~]
            :-  (welp here.bowl #/components/grid)  [%cull ~]
        ==
          %setup
        :~  :-   (welp here.bowl #/mechanics/ttt-square-empty)
              [%make %game-condition-ttt-square-empty ~ ~]
            :-   (welp here.bowl #/components/grid)
              [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
        ==
      ==
  --
--
