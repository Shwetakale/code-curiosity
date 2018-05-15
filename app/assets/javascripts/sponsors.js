$(document).on('page:change', function(event) {

	$(document).ready(function() {
		$('.datepicker').datepicker({
	    format:  'dd M yy',
	    startDate: '0d',
	    orientation: "bottom auto",
	    autoclose: true
		});
	
		$('#sponsor_is_all_repos').on('click', function() {
			if($(this).is(':checked')){
				$('select#sponsor_repository_ids').prop('disabled', true);
			}
			else{
				$('select#sponsor_repository_ids').prop('disabled', false);
			}
		});

  	$('select#sponsor_repository_ids').select2({
    	ajax: {
	      type: 'get',
	      url: '/repositories/search',
	      dataType: 'json',
	      delay: 250,
	      data: function (params) {
		      return {
		        query: params.term,
		      };
		  	},
	      processResults: function (data) {
	      	return {
	        	results: data,
	      	};
	    	},
	    	cache: true
    	},
    	placeholder: 'Select a Repository',
    	dropdownAutoWidth: 'true',
    	width: '100%',
    	closeOnSelect: true,
  	});
	});

});
