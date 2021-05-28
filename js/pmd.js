function my_function(){
  var date = new Date();
  var day = date.getDate();
  var days = new Date(date.getFullYear(),date.getMonth()+1,0).getDate();
  return '**' + Math.round(day/days*100) + '%** - ' + day + '/'+ days;
}
module.exports = my_function;