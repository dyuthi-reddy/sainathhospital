var profilemodule = angular.module("profilemodule", ["xeditable"]);

profilemodule.run(function(editableOptions) {
  editableOptions.theme = 'bs3';
});
