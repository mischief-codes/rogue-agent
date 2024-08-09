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
        [%var #/mechanics/ttt-is-my-turn/ttt-arg-coordinates]
    ==
  ::
  :-  [%condition name=%ttt-square-empty f=square-empty]
    :~  [%var #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square]
    ==
  ::
  :-  [%effect name=%ttt-mark-square f=mark-square]
    :~  [%bind #/components/turn]
        [%bind #/components/grid]
        [%var #/mechanics/ttt-is-my-turn/ttt-arg-coordinates]
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
  |=  [params=(list game-param-assignment) base=pith:neo]
  ^-  (list card:neo)
  =/  i=@ud  0
  =/  res  *(list card:neo)
  |-
  ?:  (gte i (lent params))  res
  =/  param  (snag i params)
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
  ?-  -.rec
    %leaf  -:(process-leaf ingredients.rec base)
    %branch  (process-branch ingredients.rec p.rec base)
  ==
::
++  process-leaf
  |=  [ingredients=(list ingredient) base=pith:neo]
  ^-  (pair (list card:neo) pith)
  =/  cards  *(list card:neo)
  =/  i=@ud  0
  |-
  ?:  (gte i (lent ingredients))  [cards base]
  =/  ing=ingredient  (snag i ingredients)
  =/  new-pith=pith:neo  (snoc base name.mechanic.ing)
  =/  note=note:neo  :*
    %make
    %game-mechanic
    `[%game-mechanic !>(mechanic.ing)]
    ~
  ==
  =/  new-cards=(list card:neo)  (snoc cards [new-pith note])
  =.  new-cards  (welp new-cards (process-params params.ing new-pith))
  %=($ i +(i), cards new-cards, base new-pith)
::
++  process-branch
  |=  [ingredients=(list ingredient) options=(list recipe) base=pith:neo]
  ^-  (list card:neo)
  =/  [cards=(list card:neo) fork=pith]  (process-leaf ingredients base)
  =/  i=@ud  0
  |-
  ?:  (gte i (lent options))  cards
  =/  rec=recipe  (snag i options)
  =/  new-cards=(list card:neo)  ?-  -.rec
      %leaf  -:(process-leaf ingredients.rec base)
      %branch  (process-branch ingredients.rec p.rec base)
  ==
  %=($ i +(i), cards (welp cards new-cards))


  :: :: ?:  (gte i (lent recipes))  res
  :: :: =/  rec=recipe  (snag i recipes)
  :: ?-  -.rec
  :: %branch  !!
  :: %leaf
  :: =/  ingredients=(list ingredient)  ingredients.rec
  :: =/  i=@ud  0
  :: |-
  :: =/  ing=ingredient  (snag i ingredients)
  :: =/  new-pith  (snoc mechanic-pith name.mechanic.ing)
  :: =/  note=note:neo  :*
  ::   %make
  ::   %game-mechanic
  ::   `[%game-mechanic !>(mechanic.ing)]
  ::   ~
  :: ==
  :: =/  cards=(list card:neo)  :~  :-  new-pith  note  ==
  :: =.  cards  (welp cards (process-params params.ing new-pith))
  :: %=($ i +(i), res (welp res cards))
--
::
