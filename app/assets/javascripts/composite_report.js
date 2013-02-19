var compositeFields = [
    // filterable fields
    {name: 'organisation', type: 'string', filterable: true},
    {name: 'year', type: 'integer', filterable: true, columnLabelable: true},
    {name: 'scout_type', type: 'string', filterable: true, columnLabelable: true},
    
    // summary fields
    {name: 'head_count', type: 'integer', rowLabelable: false, summarizable: 'sum'},
    {name: 'award_count', type: 'integer', rowLabelable: false, summarizable: 'sum'} 
]

function setupCompositePivot(input){
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
  $('#composite-pivot').pivot_display('setup', input);
};

function render_composite_pivot() {
  setupCompositePivot({url: $('#results').data('url'), fields: compositeFields, filters: {}, rowLabels:["scout_type", "year"], columnLabels:[],summaries:["award_count", "head_count"]})
  // prevent dropdown from closing after selection
  $('.stop-propagation').click(function(event){
    event.stopPropagation()
  });
};

