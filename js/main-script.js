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
            }, menuWidth: "180px"});
    }
    
});

//a custom format option callback
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
        // pile h needs special treatment
        while(list[i]=='h' && rand>2 && rand<11) {
            rand=Math.floor(Math.random()*11)+2;
        }
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
             if((val<1 && val>12)||(list[i]=='h' && val!=2 && val!=11 && val!=12)) {
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
         if(list[i]=='h' && val!=2 && val!=11 && val!=12) {
            // special treatment for pile h
            $(el).selectmenu("value",2);
        } else {
            $(el).selectmenu("value",val);
        }
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
    document.getElementById('set').disabled=true;
    var url = [location.protocol, '//', location.host, location.pathname].join('');
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

function init() {
    randomize();
    getParams();
    document.getElementById('loading').style.display = 'none';
    document.getElementById('main').style.display = 'block';
    showId();
}