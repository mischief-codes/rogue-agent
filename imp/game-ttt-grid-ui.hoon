/@  game-component-ttt-square
/@  txt
/@  ui-event
^-  kook:neo
=<
  |%
  ++  state  pro/%manx
  ++  poke   (sy %ui-event %rely %gift ~)
  ++  kids   *kids:neo
  ++  deps
    ^-  deps:neo
    %-  my
    :~  :^  %src  &  [pro/%game-component ~]
      :+  ~  %y
      %-  my
      :~  [[|/%ud |/%ud |] pro/%game-component-ttt-square ~]
      ==
    ==
  ++  form
    |_  [=bowl:neo =aeon:neo =pail:neo]
    ++  init
      |=  pal=(unit pail:neo)
      [~ manx/!>((render bowl))]
    ++  poke
      |=  [sud=stud:neo vaz=vase]
      ^-  (quip card:neo pail:neo)
      ?+  sud  ~|(bad-stud/sud !!)
          %ui-event
        =/  eve  !<(ui-event vaz)
        ?+  path.eve  ~|(missing-event-handler-for/path.eve !!)
          [%click %move @ta @ta ~]
          =/  x=@ud  (slav %ud i.t.t.path.eve)
          =/  y=@ud  (slav %ud i.t.t.t.path.eve)
          =/  dst=pith:neo  #/[p/our.bowl]/home/game-client/instance/tic-tac-toe/[ud/0]
          =/  mechanic-pith=pith:neo  #/mechanics/ttt-is-my-turn/ttt-arg-coordinates/ttt-get-square/ttt-square-empty/ttt-mark-square
          =/  args  (~(gas by *(map @tas *)) :~([%ttt-arg-coordinates [x y]]))
          =/  diff  [%interact mechanic-pith args]
          ~&  'dst'  ~&  dst
          :_  pail
          :~  [dst %poke %game-instance-diff !>(diff)]
          ==
          ::
          ::  here go the UI event handlers
          ::
        ==
      ::
          %rely
        [~ manx/!>((render bowl))]
      ==
    --
  --
|%
++  render
  |_  =bowl:neo
  ++  ttt-cells  ^-  (list [@ud @ud])  ~[[0 2] [1 2] [2 2] [0 1] [1 1] [2 1] [0 0] [1 0] [2 0]]
  +$  render-data  (list [@ud @ud txt])
  ++  get-render-data
  |=  deps=(map term (pair pith:neo lore:neo))
  ^-  render-data
  =/  data=(unit (pair pith:neo lore:neo))
    (~(get by deps) %src)
  ?~  data  ~|(%no-grid !!)
  =/  squares=render-data
    %+  turn  ttt-cells
    |=  [x=@ud y=@ud]
    =/  kid  (~(got of:neo q.u.data) #/[ud/x]/[ud/y])
    =+  !<(square=game-component-ttt-square q.pail.kid)
    =/  square-txt=txt  ?-  square
      %x  'x'
      %o  'o'
      %empty  ''
    ==
    [x y square-txt]
  ~&  'squares'  ~&  squares
  squares
  ++  style
  ^~
  %-  trip
  '''
    html, body {
        height: 100%;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #f0f0f0;
    }
    .mark {
      font-size: 40px !important;
    }
    .tic-tac-toe {
        display: grid;
        grid-template-columns: repeat(3, 100px);
        grid-template-rows: repeat(3, 100px);
        gap: 5px;
        margin: auto;
    }

    .cell {
        color: green;
        width: 100px;
        height: 100px;
        background-color: #fff;
        border: 2px solid #000;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .cell:hover {
        background-color: #e0e0e0;
    }
  '''
  ++  cells
    ^-  manx
    =/  data  (get-render-data deps.bowl)
    ;body
      ;main.p-page.mw-page.ma.fc.g5
        ;div.tic-tac-toe
          ;*  %+  turn  data
          |=  [x=@ud y=@ud square=txt]
          ;div.cell
            =event        "/click/move/{<x>}/{<y>}"
            ;h1.mark: {(trip square)}
          ==
        ==
      ==
    ==
  ++  $
    ^-  manx
    ;html
      ;style: {style}
      ;head
        ;meta(charset "utf-8");
        ;title: tic tac toe
        ;link
          =href  "/blue/blue-mime/{(scow %p our.bowl)}/static/feather"
          =rel  "stylesheet"
          ;
        ==
      ==
      ;+  cells
    ==
  --
--
