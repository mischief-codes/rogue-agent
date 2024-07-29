/@  game-component-ttt-square
/@  game-params-ttt-get-square
|=  [=bowl:neo params=*]
  ^-  game-component-ttt-square
  =/  typed-params  ;;(game-params-ttt-get-square params)
  =/  square-pith  (welp grid.typed-params #/[ud/x.typed-params]/[ud/y.typed-params])
  =/  square-shrub  (~(got of:neo kids.bowl) square-pith)
  =+  !<(square=game-component-ttt-square q.q.saga.square-shrub)
  square
