$(function(){
    
    var list='abcdefghiklmnopqrstuv';
    for (var i=0;i<list.length;i++) {
        // loop through select elements
        var el='select#'+list[i];
        $(el).selectmenu({style:'popup', maxHeight: 400, width: 160 });
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

function randomize() {
    var list='abcdefghiklmnopqrstuv';
    for (var i=0;i<list.length;i++) {
        var rand=Math.floor(Math.random()*11)+2;
        // pile h needs special treatment
        while(list[i]=='h' && rand>2 && rand<11) {
            rand=Math.floor(Math.random()*11)+2;
        }
        var el='select#'+list[i];
        $(el).selectmenu("value",rand);
    }
}

function setCards(preset) {
    // set selects to preset
    var list='abcdefghiklmnopqrstuv';
    for (var i=0;i<list.length;i++) {
        if (i<preset.length) {
            var val=preset[i];
            if(val=='a') { val=10; }
            if(val=='b') { val=11; }
            if(val=='c') { val=12; }
            var el='select#'+list[i];
            $(el).selectmenu("value",val);
//alert(val);            
        }
    }
}

var params = {};

if (location.search) {
    var parts = location.search.substring(1).split('&');
    for (var i = 0; i < parts.length; i++) {
        var nv = parts[i].split('=');
        if (!nv[0]) continue;
        params[nv[0]] = nv[1] || true;
    }
    var preset = params.id;
    if(preset) {
        setCards(preset);
    }
}

