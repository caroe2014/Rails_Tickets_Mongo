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
        templateUrl: "ticketindex.html"
      })
      .when('/:id', {
        templateUrl: "ticketshow.html",
//        controller: 'TicketCtrl'
      })
      .when('/new', {
        templateUrl: "ticketnew.html"
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

// ************** Rails Projects controller: Show action

ticketApp.controller("ProjectController", ["$scope", "$resource" ,function($scope, $resource) {
	
	var ProjectInfo = $resource('/projects/show/:project_id.json');

	$scope.SetProjectId = function(pprojectId) {
		$scope.project = ProjectInfo.get(
			{ "project_id": pprojectId }
		)
	}
    
}]);

// ******** Rails Job_states Controller. Angular Index Controller

ticketApp.controller("JobStatesCtrl", ["$scope", "$resource" ,function($scope, $resource) {
	
	var JobStateInfo = $resource('/job_states/index.json');
			
	$scope.jobstates = JobStateInfo.get( {  } );
	$scope.selected = $scope.jobstate[0]; 
}]);


// ******** Rails Tickets Controller. Angular Show Controller

ticketApp.controller("TicketCtrl", [ "$scope", "$location", "$http", "$resource", "$routeParams", "FtryTicket", 
                                function ($scope, $location, $http, $resource, $routeParams, FtryTicket) {

    var div = document.getElementById('div-project-data');
   
    $scope.project = {id:   div.getAttribute("data-project-id"),  
                      name: div.getAttribute("data-project-name"),
                      company: div.getAttribute("data-company-id")        
                     };
                          
    $scope.PprojectId = $scope.project.id;
    $routeParams.id = $scope.project.id;
    $routeParams.company_id = $scope.project.company;
      
//    this.newTicket = FtryTicket.create();
        
}]);

// ******** Rails Tickets Controller. Angular index Controller

ticketApp.controller("MainTicketsCtrl", [ "$scope", "$location", "$resource", "$routeParams", 
                                function ($scope, $location, $resource, $routeParams) {

    var div = document.getElementById('div-project-data');
    
    $scope.project = {id:   div.getAttribute("data-project-id"),
                      name: div.getAttribute("data-project-name"),
                      company_id: div.getAttribute("data-company-id")                    
                     };
    
    $scope.PprojectId = $scope.project.id;
    $routeParams.id = $scope.project.id;
    $routeParams.company_id = $scope.project.company_id;

    console.log("showDetailedTicket");
    console.log(" absUrl   " + $location.absUrl());
    console.log(" id       " + $routeParams.id);
    console.log(" projecId " + $routeParams.project_id);
    console.log(" ticketId " + $routeParams.ticketId);
          
    FtryTickets = $resource($location.absUrl() + ".json");    
    FtryTicket  = $resource("/projects/:project_id/tickets/:id.json");   
    FtryJobStates =	$resource("/job_states.json");
    FtryLocations = $resource("/companies/:company_id/locations.json");
			
    $scope.loadjobstates = function() {
	   $scope.jobstates = FtryJobStates.query();
	}
	     
	$scope.jobstateupdate = function() {
	   $scope.newTicket.job_state_id = $scope.jobstates[0].id; 
	   console.log(" JobState Selected: " + $scope.newTicket.job_state_id + " Status: OK");
   }

    $scope.loadlocations = function() {
	   $scope.locations = FtryLocations.query({ "company_id": $scope.project.company_id });
	}

	$scope.locationupdate = function() {
	   $scope.newTicket.location_id = $scope.locations[0].id; 
	   console.log(" Location Selected: " + $scope.newTicket.location_id + " Status: OK");
   }
   
    $scope.tickets = FtryTickets.query();                                                
    
    $scope.showDetailedTicket = function(index) {
       var theticket = $scope.tickets[index]
       $routeParams.ticketId = theticket.id;
       $routeParams.project_id = theticket.project_id;
       
       $scope.newTicket = FtryTicket.get({"project_id": $scope.tickets[index].project_id, "id": $scope.tickets[index].id  });
    }   

  $scope.addTicket = function() {
       console.log("AddTicket");
       console.log(" absUrl   " + $location.absUrl());
       console.log(" id       " + $routeParams.id);
       console.log(" projecId " + $routeParams.project_id);
       console.log(" ticketId " + $routeParams.ticketId);  	
  	$routeParams.id = $scope.PprojectId;
  	$scope.newTicket.project_id = $scope.PprojectId;
    ticket = FtryTickets.save($scope.newTicket)

    $scope.tickets.push(ticket)
    $scope.newTicket = {}
  }
    
   $scope.deleteTicket = function(index) {
     ticket = $scope.tickets[index]
     Ticket.delete(ticket)
     $scope.tickets.splice(index, 1);
   }      
}]);