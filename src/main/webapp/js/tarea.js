function Tarea() {
}

Tarea.prototype.cumplir = function() {
	this.porcentajeCumplimiento = 100;
};

Tarea.prototype.estaPendiente = function() {
	return this.porcentajeCumplimiento != 100;
};

Tarea.asTarea = function (jsonTarea) {
  return angular.extend(new Tarea(), jsonTarea);
};
