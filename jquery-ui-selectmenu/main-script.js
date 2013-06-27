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

