// global variables
var params = {};
var list='abcdefghiklmnopqrstuv';


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
             if(val<10 && val>0) {
                 // make it a 2-digit number
                 val = '0'+val;
             }
             var el=document.getElementById(list[i]);
             el.src=('cards/'+list[i]+'_'+val+'.jpg');
         }
      }
   }
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
    if(val<10 && val>0) {
        // make it a 2-digit number
        val = '0'+val;
    }
    for (var i=0;i<list.length;i++) {
         var el=document.getElementById(list[i]);
         el.src=('cards/'+list[i]+'_'+val+'.jpg');
    }
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

function showId() {
    var url = [location.protocol, '//', location.host, location.pathname.replace('facsimile.html','')].join('');
    //var url = [location.protocol, '//', location.host, location.pathname].join('');
    document.getElementById('link').value = url + '?preset=' + params.preset;
}


function init() {
    getParams();
    showId();
    documentReady();
    window.print();
}
