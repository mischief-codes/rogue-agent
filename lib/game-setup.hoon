/@  game-mechanic
/@  game-param-assignment
/-  square-empty=game-ttt-square-empty
/-  get-square=game-ttt-get-square
:: /-  is-my-turn=game-ttt-is-my-turn
/-  mark-square=game-ttt-mark-square
:: /-  give-up=game-ttt-give-up
/-  ttt=game-ttt
::
|%
+$  mechanic-conf  [mechanic=game-mechanic params=(list game-param-assignment)]
::
+$  preset
  $~  [%leaf *(list mechanic-conf)]
  $%  [%leaf confs=(list mechanic-conf)]
      [%branch confs=(list mechanic-conf) p=(list preset)]
  ==
::
++  test-branch
^-  preset
:*
  %branch
  ~
  :~
    test-leaf
    test-leaf-2
  ==
==
::
++  test-leaf-2
^-  preset
=,  ttt
:-  %leaf
=/  mechanic=game-mechanic  [%effect name=%ttt-give-up f=give-up]
:~
  :-  mechanic
    :~  [%bind #/components/turn]
    ==
==
::
++  test-leaf
^-  preset
=,  ttt
:-  %leaf
:~
  :-  [%condition name=%ttt-is-my-turn f=is-my-turn]
    :~  [%bind #/components/turn]
        [%bind #/components/roles]
    ==
  ::
  :-  [%argument name=%ttt-arg-coordinates ~]
    *(list game-param-assignment)
  ::
  :-  [%variable name=%ttt-get-square f=get-square]
    :~  [%bind #/components/grid]
        [%var %ttt-arg-coordinates ~]
    ==
  ::
  :-  [%condition name=%ttt-square-empty f=square-empty]
    :~  [%var %ttt-get-square ~]
    ==
  ::
  :-  [%effect name=%ttt-mark-square f=mark-square]
    :~  [%bind #/components/turn]
        [%bind #/components/grid]
        [%var %ttt-arg-coordinates ~]
    ==
==
::
++  process-preset
  |=  [pre=preset here=pith:neo]
  =/  rel=pith:neo  #/mechanics
  =/  full=pith:neo  (welp here rel)
  ^-  (list card:neo)
  =/  locations  *(map @tas pith:neo)
  ?-  -.pre
    %leaf  -:(process-leaf confs.pre rel full locations)
    %branch  (process-branch pre rel full locations)
  ==
::
++  process-leaf
  |=  [confs=(list mechanic-conf) rel=pith:neo full=pith:neo locations=(map @tas pith:neo)]
  ^-  [(list card:neo) pith:neo pith:neo (map @tas pith:neo)]
  =/  cards  *(list card:neo)
  =/  i=@ud  0
  |-
  ?:  (gte i (lent confs))  [cards rel full locations]
  =/  conf=mechanic-conf  (snag i confs)
  =/  new-rel=pith:neo  (snoc rel name.mechanic.conf)
  =/  new-full=pith:neo  (snoc full name.mechanic.conf)
  =/  note=note:neo  :*
    %make
    %game-mechanic
    `[%game-mechanic !>(mechanic.conf)]
    ~
  ==
  =/  new-cards=(list card:neo)  (snoc cards [new-full note])
  =.  new-cards  (welp new-cards (process-params params.conf new-full locations))
  ~?  >>>  (~(has by locations) name.mechanic.conf)  "DUPLICATE VARIABLE NAME!!!!!"
  =/  new-locations=(map @tas pith:neo)  (~(put by locations) name.mechanic.conf new-rel)
  %=($ i +(i), cards new-cards, rel new-rel, full new-full, locations new-locations)
::
++  process-branch
  |=  [pre=preset rel=pith:neo full=pith:neo locations=(map @tas pith:neo)]
  ^-  (list card:neo)
  ?>  ?=(%branch -.pre)
  =/  [confs=(list mechanic-conf) presets=(list preset)]  +.pre
  =/  [cards=(list card:neo) rel-fork=pith full-fork=pith new-locations=(map @tas pith:neo)]
    (process-leaf confs rel full locations)
  =/  i=@ud  0
  |-
  ?:  (gte i (lent presets))  cards
  =/  child=preset  (snag i presets)
  =/  new-cards=(list card:neo)  ?-  -.child
      %leaf  -:(process-leaf confs.child rel-fork full-fork new-locations)
      %branch  (process-branch child rel-fork full-fork new-locations)
  ==
  %=($ i +(i), cards (welp cards new-cards))
::
++  process-params
  |=  [params=(list game-param-assignment) full=pith:neo locations=(map @tas pith:neo)]
  ^-  (list card:neo)
  =/  i=@ud  0
  =/  res  *(list card:neo)
  |-
  ?:  (gte i (lent params))  res
  =/  param  (snag i params)
  =?  param  ?=(%var -.param)
    [%var name.param (~(got by locations) name.param)]
  =/  p  (snoc full [%ud i])
  =/  note=note:neo  :*
    %make
    %game-param-assignment
    `[%game-param-assignment !>(param)]
    ~
  ==
  =/  card=card:neo  :-  p  note
  %=($ i +(i), res (snoc res card))
--
