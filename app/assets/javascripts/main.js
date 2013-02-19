DATA_TRACKER = {
  common: {
    init: function() {
      // application-wide code
    }
  },
 
  reports: {
    init: function() {
      // controller-wide code
    },
 
    membership: function() {
      render_membership_pivot();
    },
    awards: function() {
      render_awards_pivot();
    },
    composite: function() {
      render_composite_pivot();
    }
  }
};
 
UTIL = {
  exec: function( controller, action ) {
    var ns = DATA_TRACKER,
        action = ( action === undefined ) ? "init" : action;
 
    if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {
      ns[controller][action]();
    }
  },
 
  init: function() {
    var body = document.body,
        controller = body.getAttribute( "data-controller"),
        action = body.getAttribute( "data-action" );
    UTIL.exec( "common" );
    UTIL.exec( controller );
    UTIL.exec( controller, action );
  }
};
 
$(document).ready(function() {
  UTIL.init();
});

$(document).ajaxStart(function() {
  $("#loading").show()
  $("#headers").hide()
});

$(document).ajaxStop(function() {
  $("#loading" ).hide()
  $("#headers").show()
});