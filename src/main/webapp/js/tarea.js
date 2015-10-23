function Tarea() {
	
}

Tarea.prototype.cumplir = function() {
	this.porcentajeCumplimiento = 100;
};

Tarea.prototype.sePuedeCumplir = function() {
	return true;
};

Tarea.asTarea = function (jsonTarea) {
	  return angular.extend(new Tarea(), jsonTarea);
};

