app.service('usuariosService', function ($http) {

  this.findAll = function (callback, errorHandler) {
    $http.get('/usuarios').success(callback).error(errorHandler);
  }

});

app.directive('comboUsuarios', function () {
  return {
    restrict: 'E',
    templateUrl: 'asignar_usuarios.html',
    controllerAs: 'usuariosCtrl',
    bindToController: true,
    scope: {
      callback: "&",
      tarea: "="
    },
    controller: function (usuariosService) {
      var self = this;
      this.asignatario = null;
      this.asignar = this.callback();
      this.asignatariosPosibles = [];

      usuariosService.findAll(function (data) {
        self.asignatariosPosibles = data;
      }, function () {
        self.errors.push(mensaje);
      });
// http://blog.thoughtram.io/angularjs/2015/01/02/exploring-angular-1.3-bindToController.html
    }
  };
});
