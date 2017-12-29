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

// ******** Rails Job_states Controller. Angular Show Controller

ticketApp.controller("JobStateCtrl", ["$scope", "$resource" ,function($scope, $resource) {
	
	var JobStateInfo1 = $resource('/job_states/:id.json');

	$scope.setcolorstatus = function(index) {
				
		job_state = JobStateInfo1.get(
			{ "id": $scope.ticket.job_state_id }
		);
		$scope.jobstate.color = job_state.color;
		$scope.jobstate.name  = job_state.name; 
	}
        
}]);

// ******** Rails Job_states Controller. Angular Index Controller

ticketApp.controller("JobStatesCtrl", ["$scope", "$resource" ,function($scope, $resource) {
	
	var JobStateInfo = $resource('/job_states/index.json');
			
	$scope.jobstates = JobStateInfo.get( {  } );
	$scope.selected = $scope.jobstate[0]; 
}]);

// ******** Rails Tickets Controller. Angular Index Factory

ticketApp.factory("FtryTickets", function($location, $routeParams, $resource) {
  
//  betweenstrings = function(original,str1,str2) {
//  	var resultstring = original.substring(original.search(str1) + str1.length,
//  		                                 original.search(str2));  		                                 
//  		return resultstring;
//  }
  
//  $routeParams.id = betweenstrings($location.absUrl(),"/projects/","/tickets");
  
    return $resource($location.absUrl() + ".json", {  }, {
    	
   index:   { method: 'GET', isArray: true, responseType: 'json' } 
  });
})

// ******** Rails Tickets Controller. Angular Show Factory

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

// ******** Rails Tickets Controller. Angular Show Controller

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
      
//    this.newTicket = FtryTicket.create();
    
    $scope.addticket = function() {
   	    if ($scope.form.$valid) { 
   	    	alert(" Salvando ");
 	    	                 
            ticket = Tickets.save($scope.newTicket);
            $scope.tickets.push(ticket);
            this.newTicket = {};
         }     	
    };
    
}]);

// ******** Rails Tickets Controller. Angular index Controller

ticketApp.controller("TicketsCtrl", [ "$scope", "$location", "$resource", "$routeParams", "FtryTickets", 
                                function ($scope, $location, $resource, $routeParams, FtryTickets) {

    var div = document.getElementById('div-project-data');
    
    $scope.project = {id:   div.getAttribute("data-project-id"),
                      name: div.getAttribute("data-project-name")                   
                     };
    
    $scope.PprojectId = $scope.project.id;
    $routeParams.id = $scope.project.id;
   
    $scope.tickets = FtryTickets.index();                                                
    
    $scope.showDetailedTicket = function(index) {
       var theticket = $scope.tickets[index]
            
       $routeParams.ticketId = theticket.id;
       $scope.showinfo = 1; 
       
       $location.path("/" + theticket.id );
    }

    $scope.createTicket = function() {
    	
        $scope.showinfo = 1;
        $location.path("/new");                
    }
    
   $scope.deleteTicket = function(index) {
     ticket = $scope.tickets[index]
     Ticket.delete(ticket)
     $scope.tickets.splice(index, 1);
   }      
}]);

