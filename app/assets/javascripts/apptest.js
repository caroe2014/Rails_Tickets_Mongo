ticketApp = angular.module('TicketModule', ['templates', 'ngRoute', 'ngResource', 'ngMessages']);

// ticketApp.config(function($httpProvider) {
//  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
//    $('meta[name=csrf-token]').attr('content');
// });



// ****  Angular Routes

ticketApp.config([ '$routeProvider',
                 function($routeProvider) {
    $routeProvider           
      .when('/backtotickets', {
        templateUrl: "index.html"
      })
      .when('/:id', {
        templateUrl: "show.html"
//        controller: 'TicketCtrl'
      })
      .when('/:id/edit', {
        templateUrl: "edit.html"
//        controller: 'TicketCtrl'

      });             
}]);

// *** Passing parameters Controller

ticketApp.controller("itemsControllerHiddenDiv", ["$scope", "$routeParams" ,function($scope, $routeParams) {
    
    var store = this;
    var div = document.getElementById("div-project-data");
    
    $scope.project = {name: div.getAttribute("data-project-name"),
                      id:   div.getAttribute("data-project-id")                     
    };
    store.project = $scope.project;
    $routeParams.id = store.id;
}]);

// ************** Project controller: Show action

ticketApp.controller("ProjectController", ["$scope", "$resource" ,function($scope, $resource) {
	
	var ProjectInfo = $resource('/projects/show/:project_id.json');

	$scope.SetProjectId = function(pprojectId) {
		$scope.project = ProjectInfo.get(
			{ "project_id": pprojectId }
		)
	}
    
}]);

// ************** JobState controller: Show action

ticketApp.controller("JobStateController", ["$scope", "$resource" ,function($scope, $resource) {
	
	var JobStateInfo = $resource('/job_states/show/:id.json');

	$scope.setcolorstatus = function(index) {
				
		job_state = JobStateInfo.get(
			{ "id": $scope.ticket.job_state_id }
		);
		$scope.status.color = job_state.color;
		$scope.status.name  = job_state.name; 
	}
    
}]);

// ************** Index Factory

ticketApp.factory("FtryTickets", function($location, $routeParams, $resource) {
  
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

// *********** Show Factory

ticketApp.factory("FtryTicket", function($location, $routeParams, $resource) {
  
    var project_id = $routeParams.id;
    var ngpath = "/projects/" + project_id + "/tickets/";    
    var ngId = $routeParams.ticketId;

    $routeParams.id = $routeParams.ticketId;
    
    ngpath = ngpath + ngId + ".json"            
	return $resource( ngpath , { }, {	    	
	  show:   { method: 'GET', responseType: 'json' },
	  update:  { method: 'PUT' },
	  create:  { method: 'POST' }	    
	});
})

// ******** Show Controller

ticketApp.controller("TicketCtrl", [ "$scope", "$location", "$http", "$resource", "$routeParams", "FtryTicket", 
                                function ($scope, $location, $http, $resource, $routeParams, FtryTicket) {

    var div = document.getElementById('div-project-data');
   
    $scope.project = {id:   div.getAttribute("data-project-id"),
                      name: div.getAttribute("data-project-name")                   
                     };

    $scope.backtotickets = function(p1) {

       $scope.showinfo = p1;
       $location.path("/backtotickets");
     
    }
       
    $scope.PprojectId = $scope.project.id;
    $routeParams.id = $scope.project.id;
          
    this.ticket = FtryTicket.show();
    
}]);

// ********* Index Controller

ticketApp.controller("TicketsCtrl", [ "$scope", "$location", "$resource", "$routeParams", "FtryTickets", 
                                function ($scope, $location, $resource, $routeParams, FtryTickets) {

    var div = document.getElementById('div-project-data');
    
    $scope.project = {id:   div.getAttribute("data-project-id"),
                      name: div.getAttribute("data-project-name")                   
                     };
    
    $scope.PprojectId = $scope.project.id;
    $routeParams.id = $scope.project.id;
   
    $scope.tickets = FtryTickets.index();                                                

    $scope.addTicket = function() {
   	    if ($scope.form.$valid) { 
   	    	alert(" Salvando ");
 	    	                 
            $scope.ticket = Tickets.save($scope.newTicket);
            $scope.tickets.push(ticket);
            $scope.newTicket = {};
         }                 
    }
    

    $scope.showDetailedTicket = function(index) {
       var theticket = $scope.tickets[index]
            
       $routeParams.ticketId = theticket.id;
       $scope.showinfo = 1; 
       
       $location.path("/" + theticket.id );
    }

    

   $scope.deleteTicket = function(index) {
     ticket = $scope.tickets[index]
     Ticket.delete(ticket)
     $scope.tickets.splice(index, 1);
   }      
}]);

