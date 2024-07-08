/@  game-component
$%  [%join ~]
    [%add-player who=@p]
    [%kick-player who=@p]
    [%add-component name=@tas mark=@tas init=(unit pail:neo)]
    :: [%add-mechanic mark=@tas init=(unit pail:neo)]
    [%add-fog mark=@tas init=(unit pail:neo)]
    [%interact p=pith:neo params=(map @tas vase)]
    [%kill ~]
    [%setup ~]
==
