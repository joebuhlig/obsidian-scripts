function my_function(){
  var now = new Date();
  var start = new Date(now.getFullYear(), 0, 0);
  var diff = now - start;
  var oneDay = 1000 * 60 * 60 * 24;
  var day = Math.floor(diff / oneDay);
  var days = new Date().getFullYear() % 4 == 0 ? 366 : 365;
  return '**' + Math.round(day/days*100) + '%** - ' + day + '/' + days;
}
module.exports = my_function;