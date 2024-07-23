/@  game-instance-diff
/@  game-player
/@  game-component
/@  game-fog
/@  game-component-grid
/@  game-mechanic
/@  game-params-ttt-square-empty
/@  game-param-assignment
:: /-  game-test

=>
|%
++  game-ttt-square-empty
  |=  params=*
  ^-  ?
  =/  typed-params  ;;(game-params-ttt-square-empty params)
  ~&  >>  a.typed-params
  &
::
++  build-params
  |=  [=bowl:neo mechanic-pith=pith:neo]
  ::
    =/  assignment  (~(got of:neo kids.bowl) #/components/grid/2/0)

  ::
  =/  mechanic-shrub  (~(dip of:neo kids.bowl) mechanic-pith)
  =/  assignment-shrub  (~(dip of:neo kids.bowl) (snoc mechanic-pith [%ud 0]))
  =/  assignment  (~(get of:neo assignment-shrub) ~)
  ~&  'assignment shrub null?'  ~&  ?=(~ assignment)
  =/  mechanic  (~(got of:neo kids.bowl) mechanic-pith)
  =/  params-list=(list *)
  %+  turn
      ~(tap of:neo mechanic-shrub)
      |=  [=pith:neo =idea:neo]
      ~&  'pith'  ~&  pith
      ?~  pith  ~
      ?.  =(%game-mechanic p.q.saga.idea)  ~
      =+  !<(p=game-param-assignment q.q.saga.idea)
      ~&  'p'  ~&  p
      p
  ~&  >>>  'params list'  ~&  >>>  params-list
  ?~  params-list  !>(~)
  =/  first-param  -.params-list
  ?~  +.params-list  !>(first-param)
  =/  other-params=(list *)  +.params-list
  %+  reel
     other-params
     |:  [a=** b=first-param]  :-  b  a
  :: [1 1]
::
++  resolve-interaction
  |=  [=bowl:neo full-pith=pith:neo context=(map pith vase)]
  ^-  (list card:neo)
  =/  partial-pith-len=@  1
  |-
  ?:  (gth partial-pith-len (lent full-pith))  *(list card:neo)  :: should never happen (no effect)
  =/  partial-pith=pith:neo  (swag [0 partial-pith-len] full-pith)
  ~&  >  "pith"  ~&  >  partial-pith
  =/  kid  (~(get of:neo kids.bowl) partial-pith)
  ?~  kid  %=($ partial-pith-len +(partial-pith-len))
  =+  !<(mechanic=game-mechanic q.q.saga.u.kid)
  =/  params  (build-params bowl partial-pith)
  :: ~&  >>>  'params'  ~&  >>>  params
  ?-  -.mechanic
    %condition
      =/  allowed=?  (f.mechanic params)
      ~&  >>>  "allowed"  ~&  >>>  allowed
      ?.  allowed  !!  %=($ partial-pith-len +(partial-pith-len))
    ::
    :: %computation
    ::   =/  new-context  (f.mechanic params)
    ::   ~&  >>>  "new-context"  ~&  >>>  new-context
    ::   %=($ partial-pith-len +(partial-pith-len))
    :: ::
    :: %effect
    ::   =/  new-cards=(list card:neo)  (f.mechanic params)
    ::   ~&  >>>  "new-cards"  ~&  >>>  new-cards
    ::   new-cards
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
  :~
      :: [[|/%ud &] pro/%game-param-assignment ~]
      [[&/%components &] pro/%game-component ~]
      :: [[|/%tas |/%ud &] pro/%game-param-assignment ~]
      :: [[|/%tas &] pro/%game-mechanic ~]
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
      `game-instance/!>(~)
      :: :~
      ::       :: :-
      ::       :: (snoc here.bowl %ttt-square-empty)
      ::       ::  [%make %game-mechanic `[%game-mechanic !>(`game-mechanic`[%condition f=game-ttt-square-empty])] ~]
      ::     :-   (snoc here.bowl %components)  [%make %game-component-root ~ ~]
      :: ==
    ::
    ++  poke
      |=  [=stud:neo vax=vase]
      ^-  (quip card:neo pail:neo)
      ~&  'poke'
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
          %debug
            =/  components  (~(get of:neo kids.bowl) #/components)
            ~&  components
            =/  grid  (~(get of:neo kids.bowl) #/components/grid)
            ~&  grid
            =/  grid-square  (~(get of:neo kids.bowl) #/components/grid/[ud/0]/[ud/0])
            ~&  grid-square
            *(list card:neo)
          %interact
        :: =/  pax=pith:neo  #/[p/our.bowl]/home/test
        :: =/  cards  (resolve-interaction bowl pith.diff params.diff)
           ~&  'interact'
          :~
            :-  (welp here.bowl #/components/grid)
                [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
          ==
          %kill
        :~  :-  (snoc here.bowl %ttt-square-empty)  [%cull ~]
            :-  (welp here.bowl #/components/grid)  [%cull ~]
        ==
          %setup
        :~  :-   (snoc here.bowl %ttt-square-empty)
              [%make %game-mechanic `[%game-mechanic !>([%condition f=game-ttt-square-empty])] ~]
            :-   (welp here.bowl #/components/grid)
              [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
        ==
      ==
  --
--
