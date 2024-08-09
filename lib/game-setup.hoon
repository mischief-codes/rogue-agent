/@  game-mechanic
/@  game-param-assignment
/-  square-empty=game-ttt-square-empty
/-  get-square=game-ttt-get-square
/-  is-my-turn=game-ttt-is-my-turn
/-  mark-square=game-ttt-mark-square
::
|%
++  test-ingredients
^-  recipe
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
+$  ingredient  [mechanic=game-mechanic params=(list game-param-assignment)]
::
+$  recipe
  $~  [%leaf *(list ingredient)]
  $%  [%leaf ingredients=(list ingredient)]
      [%branch ingredients=(list ingredient) p=(list recipe)]
  ==
::
++  process-params
  |=  [params=(list game-param-assignment) full=pith:neo locations=(map @tas pith:neo)]
  ^-  (list card:neo)
  =/  i=@ud  0
  =/  res  *(list card:neo)
  |-
  ?:  (gte i (lent params))  res
  =/  param  (snag i params)
  =?  param  ?=(%var -.param)  [%var name.param (~(got by locations) name.param)]
  =/  p  (snoc full [%ud i])
  =/  note=note:neo  :*
    %make
    %game-param-assignment
    `[%game-param-assignment !>(param)]
    ~
  ==
  =/  card=card:neo  :-  p  note
  %=($ i +(i), res (snoc res card))
::
++  process-recipe
  |=  [rec=recipe here=pith:neo]
  =/  relative=pith:neo  #/mechanics
  =/  full=pith:neo  (welp here relative)
  ^-  (list card:neo)
  =/  locations  *(map @tas pith:neo)
  ?-  -.rec
    %leaf  -:(process-leaf ingredients.rec relative full locations)
    %branch  (process-branch ingredients.rec p.rec relative full locations)
  ==
::
++  process-leaf
  |=  [ingredients=(list ingredient) relative=pith:neo full=pith:neo locations=(map @tas pith:neo)]
  ^-  [(list card:neo) pith:neo pith:neo (map @tas pith:neo)]
  =/  cards  *(list card:neo)
  =/  i=@ud  0
  |-
  ?:  (gte i (lent ingredients))  [cards relative full locations]
  =/  ing=ingredient  (snag i ingredients)
  =/  new-rel=pith:neo  (snoc relative name.mechanic.ing)
  =/  new-full=pith:neo  (snoc full name.mechanic.ing)
  =/  note=note:neo  :*
    %make
    %game-mechanic
    `[%game-mechanic !>(mechanic.ing)]
    ~
  ==
  =/  new-cards=(list card:neo)  (snoc cards [new-full note])
  =.  new-cards  (welp new-cards (process-params params.ing new-full locations))
  =/  new-locations=(map @tas pith:neo)  (~(put by locations) name.mechanic.ing new-rel)
  %=($ i +(i), cards new-cards, relative new-rel, full new-full, locations new-locations)
::
++  process-branch
  |=  [ingredients=(list ingredient) options=(list recipe) relative=pith:neo full=pith:neo locations=(map @tas pith:neo)]
  ^-  (list card:neo)
  =/  [cards=(list card:neo) rel-fork=pith full-fork=pith new-locations=(map @tas pith:neo)]
    (process-leaf ingredients relative full locations)
  =/  i=@ud  0
  |-
  ?:  (gte i (lent options))  cards
  =/  rec=recipe  (snag i options)
  =/  new-cards=(list card:neo)  ?-  -.rec
      %leaf  -:(process-leaf ingredients.rec rel-fork full-fork new-locations)
      %branch  (process-branch ingredients.rec p.rec rel-fork full-fork new-locations)
  ==
  %=($ i +(i), cards (welp cards new-cards))
--
