ticketApp = angular.module('TicketModule', ['templates', 'ngRoute', 'ngResource', 'ngMessages']);

ticketApp.config([ '$routeProvider',
                 function($routeProvider) {
    $routeProvider
//      .when('/', {
//        templateUrl: "index.html",
//        controller: 'TicketsCtrl'
//      })
      .when('/tickets/show/:id', {
        templateUrl: "show.html",
        controller: 'TicketCtrl'
      })      
//      .when('/tickets/edit/:id', {
//        templateUrl: "edit.html",
//        controller: 'TicketCtrl'
//      })
//      .when('/tickets/new/:id', {
//        templateUrl: "new.html",
//        controller: 'TicketCtrl'
//      })
//      .when('/tickets/delete/:id', {
//        templateUrl: "delete.html",
//        controller: 'TicketCtrl'
//      })                         
}]);

ticketApp.controller("itemsControllerHiddenDiv", ["$scope", "$routeParams" ,function($scope, $routeParams) {
    
    var store = this;
    var div = document.getElementById("div-project-data");
    
    $scope.project = {name: div.getAttribute("data-project-name"),
                      id:   div.getAttribute("data-project-id")                     
    };
    store.project = $scope.project;
    $routeParams.id = store.id;
}]);

ticketApp.controller("ProjectController", ["$scope", "$resource" ,function($scope, $resource) {
	
	var ProjectInfo = $resource('/projects/show/:project_id.json');

	$scope.SetProjectId = function(pprojectId) {
		$scope.project = ProjectInfo.get(
			{ "project_id": pprojectId }
		)
	}
    
}]);

ticketApp.factory("Ticket", function($location, $routeParams, $resource) {
  
  betweenstrings = function(original,str1,str2) {
  	var resultstring = original.substring(original.search(str1) + str1.length,
  		                                 original.search(str2));  		                                 
  		return resultstring;
  }
  
  $routeParams.id = betweenstrings($location.absUrl(),"/projects/","/tickets");
  
    return $resource("/tickets/index.json", {  }, {
    	
    index:   { method: 'GET', params: { project_id: $routeParams.id }, isArray: true, responseType: 'json' }
   
  });
})

ticketApp.controller("TicketsCtrl", [ "$scope", "$location", "$resource", "$routeParams", "Ticket", 
                                function ($scope, $location, $resource, $routeParams, Ticket) {

    var div = document.getElementById('div-project-data');
    
    $scope.project = {id:   div.getAttribute("data-project-id"),
                      name: div.getAttribute("data-project-name")                   
                     };
    
    $scope.PprojectId = $scope.project.id;
    $routeParams.id = $scope.project.id;
   
    console.log(Ticket.index());
   
    $scope.tickets = Ticket.index();                                                

    $scope.addTicket = function() {
   	    if ($scope.form.$valid) { 
   	    	alert(" Salvando ");

   	    	                 
            $scope.ticket = Tickets.save($scope.newTicket);
            $scope.tickets.push(ticket);
            $scope.newTicket = {};
         }                 
    }

   $scope.deleteTicket = function(index) {
     ticket = $scope.tickets[index]
     Ticket.delete(ticket)
     $scope.tickets.splice(index, 1);
   }      
}]);

