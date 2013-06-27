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
