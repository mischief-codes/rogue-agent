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
  |=  [params=(list game-param-assignment) base=pith:neo locations=(map @tas pith:neo)]
  ^-  (list card:neo)
  =/  i=@ud  0
  =/  res  *(list card:neo)
  |-
  ?:  (gte i (lent params))  res
  =/  param  (snag i params)
  =?  param  ?=(%var -.param)  [%var name.param (~(got by locations) name.param)]
  =/  p  (snoc base [%ud i])
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
  |=  [rec=recipe base=pith:neo]
  ^-  (list card:neo)
  =/  locations  *(map @tas pith:neo)
  ?-  -.rec
    %leaf  -:(process-leaf ingredients.rec base locations)
    %branch  (process-branch ingredients.rec p.rec base locations)
  ==
::
++  process-leaf
  |=  [ingredients=(list ingredient) base=pith:neo locations=(map @tas pith:neo)]
  ^-  [(list card:neo) pith:neo (map @tas pith:neo)]
  =/  cards  *(list card:neo)
  =/  i=@ud  0
  |-
  ?:  (gte i (lent ingredients))  [cards base locations]
  =/  ing=ingredient  (snag i ingredients)
  =/  new-pith=pith:neo  (snoc base name.mechanic.ing)
  =/  note=note:neo  :*
    %make
    %game-mechanic
    `[%game-mechanic !>(mechanic.ing)]
    ~
  ==
  =/  new-cards=(list card:neo)  (snoc cards [new-pith note])
  =.  new-cards  (welp new-cards (process-params params.ing new-pith locations))
  =/  new-locations=(map @tas pith:neo)  (~(put by locations) name.mechanic.ing new-pith)
  %=($ i +(i), cards new-cards, base new-pith, locations new-locations)
::
++  process-branch
  |=  [ingredients=(list ingredient) options=(list recipe) base=pith:neo locations=(map @tas pith:neo)]
  ^-  (list card:neo)
  =/  [cards=(list card:neo) fork=pith new-locations=(map @tas pith:neo)]
    (process-leaf ingredients base locations)
  =/  i=@ud  0
  |-
  ?:  (gte i (lent options))  cards
  =/  rec=recipe  (snag i options)
  =/  new-cards=(list card:neo)  ?-  -.rec
      %leaf  -:(process-leaf ingredients.rec base new-locations)
      %branch  (process-branch ingredients.rec p.rec base new-locations)
  ==
  %=($ i +(i), cards (welp cards new-cards))
--
