/@  game-instance-diff
/@  game-component-grid
/@  game-mechanic
/@  game-params-ttt-square-empty
/@  game-param-assignment
/-  square-empty=game-ttt-square-empty
/-  get-square=game-ttt-get-square
::
=>
|%
++  build-params-list
  |=  [=bowl:neo context=(map pith *) mechanic-pith=pith:neo]
  ^-  (list *)
  =/  params-list=(list *)  ~
  =/  assignment-idx  0
  |-
  =/  kid   (~(get of:neo kids.bowl) (welp mechanic-pith #/[ud/assignment-idx]))
  ?~  kid  params-list
  =+  !<(assignment=game-param-assignment q.pail.u.kid)
  =/  param  ?-  -.assignment
    %bind  value.assignment
    %var  (~(got by context) pith.assignment)
  ==
  %=  $
    params-list  (snoc params-list param)
    assignment-idx  +(assignment-idx)
  ==
::
++  build-params
  |=  [=bowl:neo context=(map pith *) mechanic-pith=pith:neo]
  :: =/  mechanic-shrub  (~(dip of:neo kids.bowl) mechanic-pith)
  :: =/  params-list=(list *)
  :: %+  murn
  ::   ~(tap of:neo mechanic-shrub)
  ::   |=  [=pith:neo =idea:neo]
  ::     ~&  'pith'  ~&  pith
  ::     ?~  pith  ~
  ::     ~&  >>  'debug'  ~&  >>  p.q.saga.idea
  ::     ?:  =(%game-mechanic p.q.saga.idea)  ~
  ::     =+  !<(p=game-param-assignment q.q.saga.idea)
  ::     ?-  -.p
  ::       %bind  `value.p
  ::       %var  `(~(got by context) pith.p)
  ::     ==
  =/  params-list  (build-params-list bowl context mechanic-pith)
  ~&  'params list'  ~&  params-list
  =/  first-param  -.params-list
  ?~  +.params-list  first-param
  =/  other-params=(list *)  +.params-list
  %+  reel
     other-params
     |:  [a=** b=first-param]  :-  b  a
::
++  resolve-interaction
  |=  [=bowl:neo full-pith=pith:neo context=(map pith *)]
  ^-  (list card:neo)
  =/  partial-pith-len=@  1
  |-
  ?:  (gth partial-pith-len (lent full-pith))  *(list card:neo)  :: should never happen (no effect)
  =/  partial-pith=pith:neo  (swag [0 partial-pith-len] full-pith)
  ~&  >  "pith"  ~&  >  partial-pith
  =/  kid  (~(get of:neo kids.bowl) partial-pith)
  ?~  kid  %=($ partial-pith-len +(partial-pith-len))
  =+  !<(mechanic=game-mechanic q.q.saga.u.kid)
  =/  params  (build-params bowl context partial-pith)
  ~&  >>  'params'  ~&  >>  params
  ?-  -.mechanic
        %condition
      =/  allowed=?  (f.mechanic bowl params)
      ~&  >>>  "allowed"  ~&  >>>  allowed
      ?.  allowed  !!  %=($ partial-pith-len +(partial-pith-len))
    ::
        %variable
      =/  var  (f.mechanic bowl params)
      ~&  >>>  "var"  ~&  >>>  var
      %=  $
          partial-pith-len  +(partial-pith-len)
          context  (~(put by context) partial-pith var)
      ==
    ::
        %effect
      =/  new-cards=(list card:neo)  (f.mechanic bowl params)
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
  :~
      [[&/%components &] pro/%game-component ~]
      [[&/%mechanics &] [%or pro/%game-mechanic pro/%game-param-assignment ~] ~]
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
    ::
    ++  poke
      |=  [=stud:neo vax=vase]
      ^-  (quip card:neo pail:neo)
      ?>  ?=(%game-instance-diff stud)
      =/  diff=game-instance-diff  !<(game-instance-diff vax)
      :_  pail
      ?-    -.diff
          %debug
            *(list card:neo)
        ::
          %interact
            (resolve-interaction bowl pith.diff params.diff)
        ::
          %kill
        :~  :-  (welp here.bowl #/mechanics/ttt-square-empty)  [%cull ~]
            :-  (welp here.bowl #/components/grid)  [%cull ~]
        ==
        ::
          %setup
        =/  get-square=game-mechanic  [%variable name=%ttt-get-square f=get-square]
        =/  empty=game-mechanic  [%condition name=%ttt-square-empty f=square-empty]
        =/  get-square-assignment-0=game-param-assignment  [%bind #/components/grid]
        =/  get-square-assignment-1=game-param-assignment  [%bind [x=1 y=1]]
        =/  square-empty-assignment-0=game-param-assignment  [%var #/mechanics/ttt-get-square]
        :~
            :-  (welp here.bowl #/mechanics/ttt-get-square)
              [%make %game-mechanic `[%game-mechanic !>(get-square)] ~]
            :-  (welp here.bowl #/mechanics/ttt-get-square/[ud/0])
              [%make %game-param-assignment `[%game-param-assignment !>(get-square-assignment-0)] ~]
            :-  (welp here.bowl #/mechanics/ttt-get-square/[ud/1])
              [%make %game-param-assignment `[%game-param-assignment !>(get-square-assignment-1)] ~]
            :-  (welp here.bowl #/mechanics/ttt-get-square/ttt-square-empty)
              [%make %game-mechanic `[%game-mechanic !>(empty)] ~]
            :-  (welp here.bowl #/mechanics/ttt-get-square/ttt-square-empty/[ud/0])
              [%make %game-param-assignment `[%game-param-assignment !>(square-empty-assignment-0)] ~]
            :-  (welp here.bowl #/components/grid)
              [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
        ==
      ==
  --
--
