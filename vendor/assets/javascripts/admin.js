$(document).ready(function(event) {
	$("#grouping_select").change(function(e){
		var value = $("#grouping_select").val();
		$("#hidden_grouping").val(value);
		switch (value) {
			case "Daily":
				$("#monthly_criteria, #yearly_criteria").hide();
				$("#daily_criteria").show();
				return;
			case "Monthly":
				$("#daily_criteria, #yearly_criteria").hide();
				$("#monthly_criteria").show();
				return;
			case "Yearly":
				$("#daily_criteria, #monthly_criteria").hide();
				$("#yearly_criteria").show();
				return;
		}
	});

	$("#monthly_criteria .year-select, #monthly_criteria #month-select").change(function(e){
		var month = $("#month-select").val();
		var year = $("#monthly_criteria .year-select").val();
		$("#selected-month").val(month + "/" + year);
		console.log(month + "/" + year);
	});

	$("#yearly_criteria .year-select").change(function(e){
		var year = $("#yearly_criteria .year-select").val();
		$("#selected-year").val(year);
	});
	var grouping = getUrlParameter("grouping");
	var selectedMonth = getUrlParameter("selected_month");
	if (typeof selectedMonth !== 'undefined'){
		selectedMonth = selectedMonth.split("/");
		selectedMonthMonth = selectedMonth[0];
		selectedMonthYear = selectedMonth[1];
		var selectedYear = getUrlParameter("selected_year");
		$("#grouping_select").val(grouping);
		$("#grouping_select").trigger("change");
		$("#month-select").val(selectedMonthMonth);
		$("#month-select").trigger("change");
		$("#monthly_criteria .year-select").val(selectedMonthYear);
		$("#monthly_criteria .year-select").trigger("change");
		$("#yearly_criteria .year-select").val(selectedYear);
		$("#yearly_criteria .year-select").trigger("change");
	};
})

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};