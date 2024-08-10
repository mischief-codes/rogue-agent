/@  game-param-assignment
/-  setup=game-setup
/-  ttt=game-ttt
|%
++  mechanics
  =,  ttt
  =,  setup
  ^-  preset
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
    :-  [%effect name=%ttt-mark-suare f=mark-square]
      :~  [%bind #/components/turn]
          [%bind #/components/grid]
          [%var %ttt-arg-coordinates ~]
      ==
  ==
++  components
  |=  here=pith:neo
  ^-  (list card:neo)
  :~
    :-  (welp here #/components/grid)
      [%make %game-component-grid `[%game-component-grid !>([x=3 y=3])] ~]
    :-  (welp here #/components/turn)
      [%make %game-component-ttt-turn ~ ~]
    :-  (welp here #/components/roles/x)
      [%make %game-component-ttt-role-assignment `[%game-component-ttt-role-assignment !>([~zod %x])] ~]
    :-  (welp here #/components/roles/o)
      [%make %game-component-ttt-role-assignment `[%game-component-ttt-role-assignment !>([~zod %o])] ~]
  ==
--
