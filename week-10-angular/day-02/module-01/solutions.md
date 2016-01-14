# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Intro Angular - Solutions

## Challenges
```html
<div ng-controller="PokemonCtrl">
  <pre>{{ catchphrase | uppercase }}</pre>
  <pre>{{ pokemon | json : spacing }}</pre>
</div>
```

`index.html`
```html

<html>
<head>
	<title>Intro Angular</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
	<script type="text/javascript" src="app.js"></script>
</head>
<body ng-app="ngFun">
	{{ "lower cap string" | uppercase }}

	<div ng-controller="PokemonCtrl">
		<h1>Trainer: {{trainer.name || "Ash"}}</h1>
		<span>Enter your name:</span>
    <input ng-model="trainer.name"/>
    <table class="table table-striped">
    <thead>
      <tr>
        <th>Ndex</th>
        <th>Name</th>
        <th>Type</th>
      </tr>
    </thead>
    <tbody>
      <tr ng-repeat="(key, value) in pokemon | orderBy: '-Ndex' | filter:searchText">
        <td>{{value.Ndex}}</td>
        <td>{{value.name}}</td>
        <td>{{value.type}}</td>
      </tr>
    </tbody>
    <br>
    <span>Search Pokemon: </span>
    <input ng-model="searchText"/>
	</div>
</body>
</html>
```

`app.js`
```js
var app = angular.module("ngFun", []);

app.controller("PokemonCtrl", ['$scope', function($scope) {
    $scope.pokemon = [
    	{
      Ndex: 25,
      name: 'Pikachu',
      type: 'Electric'
    },
    {
      Ndex: 10,
      name: 'Caterpie',
      type: 'Bug'
    },
    {
      Ndex: 39,
      name: 'Jigglypuff',
      type: 'Fairy'
    },
    {
      Ndex: 94,
       name: 'Gengar',
      type: 'Ghost'
    },
    {
      Ndex: 143,
      name: 'Snorlax',
      type: 'Normal'
    }
  ];
}]);

app.filter('reverse', function() {
  return function(items) {
    return items.slice().reverse();
  };
});
```
