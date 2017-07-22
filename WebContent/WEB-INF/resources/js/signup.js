
var loginmodule = angular.module('loginmodule',[]);

var minlength = 8;
loginmodule.directive('passwordlength', function() {
  return {
    require: 'ngModel',
    link: function(scope, elm, attrs, ngModel) {
      ngModel.$validators.passwordlength = function(viewValue) {
        if (viewValue.length > minlength) {
          // it is valid
          return true;
        }

        // it is invalid
        return false;
      }
    }
  }
});

var atleastonedigitre = /^(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)$/;
loginmodule.directive('passwordpattern', function() {
  return {
    require: 'ngModel',
    link: function(scope, elm, attrs, ngModel) {
      ngModel.$validators.passwordpattern = function(viewValue) {

        if (atleastonedigitre.test(viewValue)) {
          // it is valid
          return true;
        }
        // it is invalid
        return false;
      }
    }
  }
});
loginmodule.directive('uniqueuser', ['$q', '$http', function($q, $http) {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function(scope, element, attrs, ngModel) {
            ngModel.$asyncValidators.usernameAvailable = function(viewValue) {
                return $http.get('/getFIT/validateusername/'+ viewValue).
                then(function(response) {
                    if (response.data) return $q.reject();
                });
            };
        }
    }
}])


