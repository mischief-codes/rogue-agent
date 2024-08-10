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
  ~&  'param assignment'  ~&  >>  assignment  ~&  'context'  ~&  >>  context
  =/  param  ?-  -.assignment
    %bind  value.assignment
    %var  ~&  >  resolution.assignment  =/  value  (~(got by context) resolution.assignment)  ~&  value  value
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
  |=  [=bowl:neo full-pith=pith:neo user-params=(map @tas *)]
  ^-  (list card:neo)
  =/  context  *(map pith *)
  =/  partial-pith-len=@  1
  |-
  ?:  (gth partial-pith-len (lent full-pith))  *(list card:neo)  :: should never happen (no effect)
  =/  partial-pith=pith:neo  (swag [0 partial-pith-len] full-pith)
  ~&  "pith"  ~&  >  partial-pith
  =/  kid  (~(get of:neo kids.bowl) partial-pith)
  ?~  kid  %=($ partial-pith-len +(partial-pith-len))
  =+  !<(mechanic=game-mechanic q.q.saga.u.kid)
  ~&  'mechanic type'  ~&  >  -.mechanic
  ?:  =(%argument -.mechanic)
    =/  arg-value  (~(got by user-params) name.mechanic)
    =/  new-context  (~(put by context) partial-pith arg-value)
    %=($ partial-pith-len +(partial-pith-len), context new-context)
  =/  params  (build-params bowl context partial-pith)
  ~&  'mechanic params'  ~&  >>  params
  ?+  -.mechanic  !!
        %condition
      =/  allowed=?  (f.mechanic bowl params)
      ~&  "allowed"  ~&  >>>  allowed
      ?.  allowed  !!  %=($ partial-pith-len +(partial-pith-len))
    ::
        %variable
      =/  var  (f.mechanic bowl params)
      ~&  "var value"  ~&  >>>  var
      %=  $
          partial-pith-len  +(partial-pith-len)
          context  (~(put by context) partial-pith var)
      ==
    ::
        %effect
      =/  new-cards=(list card:neo)  (f.mechanic bowl params)
      ~&  "new-cards"  ~&  >>>  new-cards
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
          =/  cards=(list card:neo)  (process-preset test-branch here.bowl)
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
        =,  game-setup
        =/  relative=pith:neo  #/mechanics
        =/  full=pith:neo  (welp here.bowl relative)
        =/  mechanic-cards  (process-preset test-branch here.bowl)
        =/  component-cards
          :~
            :-  (welp here.bowl #/components/grid)
              [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
            :-  (welp here.bowl #/components/turn)
              [%make %game-component-ttt-turn ~ ~]
            :-  (welp here.bowl #/components/roles/x)
              [%make %game-component-ttt-role-assignment `[%game-component-ttt-role-assignment !>([~zod %x])] ~]
            :-  (welp here.bowl #/components/roles/o)
              [%make %game-component-ttt-role-assignment `[%game-component-ttt-role-assignment !>([~zod %o])] ~]
        ==
        (welp mechanic-cards component-cards)
      ==
  --
--
