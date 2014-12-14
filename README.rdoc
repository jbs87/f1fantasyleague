== F1 Fantasy League

== Development

The seeds.rb file contains, enough seeds to start a brand new game.

The rake task, f1:seedround[round] , will add the race results from 2014 for the round that is specified.

```
rake f1:seedround[7]
```

Will add the results for round 7, 2014_Canadian_Grand_Prix 