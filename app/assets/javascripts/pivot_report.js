var fields = [
    // filterable fields
    {name: 'organisation', type: 'string', filterable: true},
    {name: 'membership_type', type: 'string', filterable: true, columnLabelable: true},
    {name: 'year', type: 'integer', filterable: true, columnLabelable: true},
    {name: 'scout_type', type: 'string', filterable: true, columnLabelable: true},
    {name: 'gender', type: 'string', filterable: true, columnLabelable: true},
    
    // summary fields
    {name: 'head_count', type: 'integer', rowLabelable: false, summarizable: 'sum'} 
]

function setupPivot(input){
input.callbacks = {afterUpdateResults: function(){
  $('#results > table').dataTable({
    "sDom": "<'row'<'span6'l><'span6'f>>t<'row'<'span6'i><'span6'p>>",
    "iDisplayLength": 50,
    "aLengthMenu": [[25, 50, 100, -1], [25, 50, 100, "All"]],
    "sPaginationType": "bootstrap",
    "bFilter": false,
    "oLanguage": {
      "sLengthMenu": "_MENU_ records per page"
    }
  });
}};
$('#pivot-demo').pivot_display('setup', input);
};

$(document).ready(function() {
setupPivot({url: $('#results').data('url'), fields: fields, filters: {}, rowLabels:["organisation"], columnLabels:["year"],summaries:["head_count"]})
// prevent dropdown from closing after selection
  $('.stop-propagation').click(function(event){
    event.stopPropagation()
  });
});

$(document).ajaxStart(function() {
  $("#loading").show()
  $("#headers").hide()
});

$(document).ajaxStop(function() {
  $("#loading" ).hide()
  $("#headers").show()
});