/@  game-instance-diff
/@  game-component-grid
/@  game-mechanic
/@  game-param-assignment
/-  square-empty=game-ttt-square-empty
/-  get-square=game-ttt-get-square
/-  is-my-turn=game-ttt-is-my-turn
/-  mark-square=game-ttt-mark-square
/-  game-setup
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
  ~&  >>  'debug'  ~&  >>  assignment  ~&  >>>  context
  =/  param  ?-  -.assignment
    %bind  value.assignment
    %var  =/  value  (~(got by context) pith.assignment)  ~&  value  value
  ==
  %=  $
    params-list  (snoc params-list param)
    assignment-idx  +(assignment-idx)
  ==
::
++  build-params
  |=  [=bowl:neo context=(map pith *) mechanic-pith=pith:neo]
  =/  params-list  (build-params-list bowl context mechanic-pith)
  =/  first-param  -.params-list
  ?~  +.params-list  first-param
  =/  other-params=(list *)  +.params-list
  %+  roll
     other-params
     |:  [a=** b=first-param]
     ?:  =(first-param b)  :-  b  a
     [-.b +.b a]
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
  ~&  >  'sigh'  ~&  >  -.mechanic
  ?:  =(%argument -.mechanic)  %=($ partial-pith-len +(partial-pith-len))
  =/  params  (build-params bowl context partial-pith)
  ~&  >>  'params'  ~&  >>  params
  ?+  -.mechanic  !!
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
          =,  game-setup
          =/  cards=(list card:neo)  (process-recipe test-ingredients #/mechanics)
          =/  piths  %+  turn  cards  |=  car=card:neo  ^-  pith:neo  -.car
          ~&  piths
          ~
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
        =/  ttt-is-my-turn=game-mechanic  [%condition name=%ttt-is-my-turn f=is-my-turn]
        =/  ttt-arg-coordinates=game-mechanic  [%argument name=%ttt-arg-coordinates ~]
        =/  get-square=game-mechanic  [%variable name=%ttt-get-square f=get-square]
        =/  empty=game-mechanic  [%condition name=%ttt-square-empty f=square-empty]
        =/  mark-square=game-mechanic  [%effect name=%ttt-mark-square f=mark-square]
        =/  is-my-turn-assignment-0=game-param-assignment  [%bind #/components/turn]
        =/  is-my-turn-assignment-1=game-param-assignment  [%bind #/components/roles]
        =/  get-square-assignment-0=game-param-assignment  [%bind #/components/grid]
        =/  get-square-assignment-1=game-param-assignment  [%var #/mechanics/ttt-is-my-turn/ttt-arg-coordinates]
        =/  square-empty-assignment-0=game-param-assignment  [%var #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square]
        =/  mark-square-assignment-0=game-param-assignment  [%bind #/components/turn]
        =/  mark-square-assignment-1=game-param-assignment  [%bind #/components/grid]
        =/  mark-square-assignment-2=game-param-assignment  [%var #/mechanics/ttt-is-my-turn/ttt-arg-coordinates]

        :~
            ::  components
            :-  (welp here.bowl #/components/grid)
              [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
            :-  (welp here.bowl #/components/turn)
              [%make %game-component-ttt-turn ~ ~]
            :-  (welp here.bowl #/components/roles/x)
              [%make %game-component-ttt-role-assignment `[%game-component-ttt-role-assignment !>([~zod %x])] ~]
            :-  (welp here.bowl #/components/roles/o)
              [%make %game-component-ttt-role-assignment `[%game-component-ttt-role-assignment !>([~zod %o])] ~]

            ::  mechanics
            :-  (welp here.bowl #/mechanics/ttt-is-my-turn)
              [%make %game-mechanic `[%game-mechanic !>(ttt-is-my-turn)] ~]
            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/[ud/0])
              [%make %game-param-assignment `[%game-param-assignment !>(is-my-turn-assignment-0)] ~]
            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/[ud/1])
              [%make %game-param-assignment `[%game-param-assignment !>(is-my-turn-assignment-1)] ~]

            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates)
              [%make %game-mechanic `[%game-mechanic !>(ttt-arg-coordinates)] ~]

            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square)
              [%make %game-mechanic `[%game-mechanic !>(get-square)] ~]
            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/[ud/0])
              [%make %game-param-assignment `[%game-param-assignment !>(get-square-assignment-0)] ~]
            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/[ud/1])
              [%make %game-param-assignment `[%game-param-assignment !>(get-square-assignment-1)] ~]

            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/ttt-square-empty)
              [%make %game-mechanic `[%game-mechanic !>(empty)] ~]
            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/ttt-square-empty/[ud/0])
              [%make %game-param-assignment `[%game-param-assignment !>(square-empty-assignment-0)] ~]

            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/ttt-square-empty/ttt-mark-square)
              [%make %game-mechanic `[%game-mechanic !>(mark-square)] ~]
            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/ttt-square-empty/ttt-mark-square/[ud/0])
              [%make %game-param-assignment `[%game-param-assignment !>(mark-square-assignment-0)] ~]
            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/ttt-square-empty/ttt-mark-square/[ud/1])
              [%make %game-param-assignment `[%game-param-assignment !>(mark-square-assignment-1)] ~]
            :-  (welp here.bowl #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/ttt-square-empty/ttt-mark-square/[ud/2])
              [%make %game-param-assignment `[%game-param-assignment !>(mark-square-assignment-2)] ~]
        ==
      ==
  --
--
