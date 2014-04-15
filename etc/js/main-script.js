
function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

function isInRange(n,min,max) {
  if (isNumber(n))
  {
    if (n>max) {
        alert('Maximum value is 240');
        return max;
    }
    if (n<min) {
        alert('Minimum value is 60');
        return min;
    }
    return n;    
  }
  else return '120';
}

function documentReady() {
    document.getElementById('loading').style.display = 'none';
    document.getElementById('main').style.display = 'block';
}
