'use strict';

app.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/tareas");

  $stateProvider
    .state('tareas', {
      url: '/tareas',
      templateUrl: 'templates/tareas.html',
      controller: 'TareasController as tareasCtrl',
      data: {},
      resolve: {}
    })
});
