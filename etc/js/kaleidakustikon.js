// slider

$(function() {
	$( "#tempo_slider" ).slider({
		range: false,
		min: 60, 
		max: 240,
		values: [ 140 ],
		slide: function( event, ui ) {        
		   $( "#tempo" ).val( ui.values[ 0 ] );
		}
	});
	$( "#tempo" ).val( $( "#tempo_slider" ).slider( "values", 0 ) );
});


function setTempoSlider(tempo) {
/* call without arguments to update slider according to the tempo input   */
/* or call with a tempo value to set or change input and slider values    */
    tempo = tempo || $("#tempo").val();
    $("#tempo_slider").slider( "values", [ tempo ] );
    $("#tempo").val(tempo);
}

// image select functions
$(function(){
    
    var list='abcdefghiklmnopqrstuv';
    for (var i=0;i<list.length;i++) {
        // loop through select elements
        var el='select#'+list[i];
        $(el).selectmenu({style:'popup', maxHeight: 400, width: 152 });
        $(el).selectmenu("widget").addClass("wrap");
        $(el).selectmenu({
            icons: [{find: '.card'}],
            bgImage: function() {
        	return 'url(' + $(this).attr("title") + ')';
            }, menuWidth: "185px"});
    }
    
});

var addressFormatting = function(text, opt){
    var newText = text;
    //array of find replaces
    var findreps = [
    	{find:/^([^\-]+) \- /g, rep: '<span class="ui-selectmenu-item-header">$1</span>'},
    	{find:/([^\|><]+) \| /g, rep: '<span class="ui-selectmenu-item-content">$1</span>'},
    	{find:/([^\|><\(\)]+) (\()/g, rep: '<span class="ui-selectmenu-item-content">$1</span>$2'},
    	{find:/([^\|><\(\)]+)$/g, rep: '<span class="ui-selectmenu-item-content">$1</span>'},
    	{find:/(\([^\|><]+\))$/g, rep: '<span class="ui-selectmenu-item-footer">$1</span>'}
    ];
    
    for(var i in findreps){
    	newText = newText.replace(findreps[i].find, findreps[i].rep);
    }
    return newText;
}

// global variables
var params = {};
var list='abcdefghiklmnopqrstuv';


function randomize(startAt) {
    // start at pile no. ...
    startAt = startAt || 0;
    for (var i=startAt;i<list.length;i++) {
        var rand=Math.floor(Math.random()*11)+2;
        var el='select#'+list[i];
        $(el).selectmenu("value",rand);
    }
    showId();
}


function setCards(preset) {
    // set selects to preset combination
    if (preset.length==1) {
        setLayer(preset);
    } else {
      for (var i=0;i<list.length;i++) {
         if (i<preset.length) {
             var val=preset[i];
             if(val=='a') { val=10; }
             if(val=='b') { val=11; }
             if(val=='c') { val=12; }
             if(val<1 && val>12) {
                 // default to 2 if invalid
                 val = 2;
             }
             var el='select#'+list[i];
             $(el).selectmenu("value",val);
         }
      }
   }
   showId();
}

function setLayer(preset) {
    // set all selects to same number
    var val=preset;
    if(val=='a') { val=10; }
    if(val=='b') { val=11; }
    if(val=='c') { val=12; }
    if(val<1 && val>12) {
        // default to 2 if invalid
        val = 2;
    }
    for (var i=0;i<list.length;i++) {
        var el='select#'+list[i];
        $(el).selectmenu("value",val);
    }
    showId();
}

function showId() {
    var id='';
    for (var i=0;i<list.length;i++) {
        var el='select#'+list[i];
        var val=$(el).selectmenu("value");
        if(val=='10') { val='a'; }
        if(val=='11') { val='b'; }
        if(val=='12') { val='c'; }
        id=id+val;
    }
    document.getElementById('preset').value=id;
    //document.getElementById('set').disabled=true;
    var url = [location.protocol, '//', location.host, location.pathname.replace('index.html','')].join('');
    //var url = [location.protocol, '//', location.host, location.pathname].join('');
    document.getElementById('link').value=url+'?preset='+id;
}

function getParams() {
   if (location.search) {
       var parts = location.search.substring(1).split('&');
       for (var i = 0; i < parts.length; i++) {
           var nv = parts[i].split('=');
           if (!nv[0]) continue;
           params[nv[0]] = nv[1] || true;
       }
       var preset = params.preset;
       if(preset) {
           setCards(preset);
       }
   }
}


function changeAction(action) {
    if (action==".svg") {
        document.kaleidaform.action = "./mei2013/get-cards.xq";
    } 
    else {
        document.kaleidaform.action = "./cgi-bin/buildly";
    }
    if (action==".mp3") {
        document.kaleidaform.target = "player";
        document.getElementById("player").style.height="85px";
        document.kaleidaform.action = "audio.html";
    } 
    else {
        document.kaleidaform.target = "score";
    }
}

function showRevision() {
    var form = document.getElementById('revision_form');
    var rev = document.getElementById('rev');
    var rev_date = document.getElementById('rev_date');
    rev.value = 'Rev. ' + document.getElementById('rev_hidden').value.match('[0-9]+');
    rev_date.value = document.getElementById('rev_date_hidden').value.match('[0-9]{4}-[0-9]{2}-[0-9]{2}');
}

function init() {
    randomize();
    getParams();
    showId();
//    showRevision();
    documentReady();
}
