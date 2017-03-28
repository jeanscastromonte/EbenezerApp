
/******************************************************************************************************************************************************************************/
$(document).ready(InitPage);

function InitPage() {

  //***Alert schedule sunat***
    fcn_schedule_alert();
}
/******************************************************************************************************************************************************************************/
function fnc_clear_input () 
{
    $('input[type="text"],input[type="password"],input[type="email"],textarea').val('');
    $('input[type="checkbox"]').removeAttr('checked');  
}
/******************************************************************************************************************************************************************************/
function fnc_select2(_select,_placeholder)
{
    _select.html('<option></option>');
    _select.select2({
      placeholder:_placeholder,
      allowClear: true,
      formatNoMatches: function () { return "No se encontraron resultados"; },        
    });
}
/******************************************************************************************************************************************************************************/
function fnc_tooltip ()
{
  $('[data-toggle="tooltip"]').each(function() {
      var animate = $(this).attr("data-animate");
      var colorclass = $(this).attr("data-color-class");
      $(this).tooltip({
          template: '<div class="tooltip ' + animate + ' ' + colorclass + '"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
      });
   });
}
/******************************************************************************************************************************************************************************/
function fnc_modal_init(event)
{
    fnc_modal_events();
    var _modal=event.data.modal;   
   _modal.modal({"backdrop": "static","keyboard": false, "show": true});     
}

function fnc_modal_events()
{ 
  $(".has-error").removeClass("has-error");
  $(".has-success").removeClass("has-success");
  $(".fa-warning").removeClass("fa-warning");
  $(".fa-check").removeClass("fa-check");
  $(".alertform").hide();

  fnc_modal_mouseup();
  fnc_modal_initposition();

  $('.modal').on('show.bs.modal', fnc_modal_show)
  .on('mousedown','.modal-header',fnc_modal_mousedown)
  .on('mouseup','.modal-header',fnc_modal_mouseup)
  .on('mouseover','.modal-header',fnc_modal_mouseup);

  $('.modal-dialog').draggable({handle: ".modal-header",containment: 'body',});
  $('.modal-header').css('cursor','move');
}

function fnc_modal_mousedown()
{
  $('.modal-content').addClass('opacity');
}

function fnc_modal_mouseup()
{
  $('.modal-content').removeClass('opacity');
}

function fnc_modal_show()
{  
  $(this).data({'originalLeft': $('.modal-dialog').css('left'), 'origionalTop': $('.modal-dialog').css('top')});
}

function fnc_modal_initposition()
{
  $('.modal-dialog').css({'left': $('.modal').data('originalLeft'), 'top': $('.modal').data('origionalTop')});
}
/******************************************************************************************************************************************************************************/
function fnc_switch_status(_selector)
{
   _selector.bootstrapSwitch({onText:'Pendiente',offText:'&nbsp;Completado&nbsp;',onColor: 'success',offColor:'danger',size: 'normal'});
    $('.bootstrap-switch').css('width','180px');
}
/******************************************************************************************************************************************************************************/
function fnc_get_year() {

  var currentTime = new Date();
  return currentTime.getFullYear();
}
/******************************************************************************************************************************************************************************/
function fnc_format_time(_timepicker)
{
  var time = $txt_scheduletime.data("timepicker").getTime();
  var hour = _timepicker.data('timepicker').hour;
  var minute = $txt_scheduletime.data('timepicker').minute;
  var meridian = _timepicker.data('timepicker').meridian;

  if (meridian =='PM' && hour!=12)
  {
    hour=hour+12;
  }
  else if(meridian =='AM' && hour==12)
  {
    hour=hour-12;
  }
 var time   = fnc_two_digit(hour)+":"+fnc_two_digit(minute)+":00";
  return time;
}
/******************************************************************************************************************************************************************************/
function convertTo24Hour(time) {
    var hours = parseInt(time.substr(0, 2));
    if(time.indexOf('AM') != -1 && hours == 12) {
        time = time.replace('12', '0');
    }
    if(time.indexOf('PM')  != -1 && hours < 12) {
        time = time.replace(hours, (hours + 12));
    }
    return time.replace(/(AM|PM)/,"");
}
/*****************************************************************************************************************************************************************************/
function fnc_two_digit(_number)
{
  var twodigit = _number >= 10 ? _number : "0"+_number.toString();
  return twodigit;
}
/*****************************************************************************************************************************************************************************/
function ConvertDate(datetime) {
  var str = datetime;
  var p = str.split("-");
  var date = new Date(p[0],p[1]-1,p[2]);
  return date;
}
/*****************************************************************************************************************************************************************************/
function fnc_msj_alert(_type,_message,_container,_icon,_seconds)
{
  Metronic.alert({
    container: _container, // alerts parent container(by default placed after the page breadcrumbs)
    place: "append", // "append" or "prepend" in container 
    type: _type, // alert's type
    message: _message, // alert's message
    close: true, // make alert closable
    reset: true, // close all previouse alerts first
    focus: true, // auto scroll to the alert after shown
    closeInSeconds: _seconds, // auto close after defined seconds
    icon:_icon // put icon before the message
  });
}
/******************************************************************************************************************************************************************************/
function fnc_fill_options_digits(_cbo) {

  var options="";  
  for (var i =0;i<10;i++)  {
   options+='<option value="'+i+'">'+i+'</option>';
  }
 _cbo.append(options);
}
/******************************************************************************************************************************************************************************/
function fnc_only_letter(_selector) {
  _selector.on('keydown', function(e){
      if (e.ctrlKey || e.altKey) {
        e.preventDefault();
      } else {
        var key = e.keyCode;
        if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90))) {
          e.preventDefault();
        }
      }
    });
}
/******************************************************************************************************************************************************************************/
/******************************************************************************************************************************************************************************/
/******************************************************************************************************************************************************************************/
/******************************************************************************************************************************************************************************/
/******************************************************************************************************************************************************************************/
/******************************************************************************************************************************************************************************/
/*****************************************************************************************************************************************************************************/
function fcn_schedule_alert() {
  $.getJSON("get-schedule-alert", function(data, status){
    if(data){
      var miliseconds=data.Seconds*1000;
      setTimeout(function(){
        //fnc_update_complete_schedule(data.Period,data.Digit);
        fnc_notification8_sunatalert(data.Life,data.Period,data.Digit);
        // $txt_period.datepicker('setDate', ConvertDate(data.Period));
      },miliseconds);
      // console.log(miliseconds);
      // console.log(data.Life);
    }
  });
}
/*****************************************************************************************************************************************************************************/
function fnc_notification8_sunatalert(life,period,digit) {

  var mslife=life*1000;

  if(mslife>0){

    var settings = {
      heading:"DECLARACIÓN SUNAT",
      life:mslife,
      theme: 'ruby',
      sticky: false,
      horizontalEdge: 'bottom',
      verticalEdge: 'right'
    };

    $.notific8('zindex', 11500);
    $.notific8("Digito "+digit, settings);

    var myAudio = new Audio('assets/sound/announcement.mp3');
    myAudio.play();

    setTimeout(function () {
      var myAudio2 = new Audio('assets/sound/digito'+digit+'.mp3');
      myAudio2.play();
    },1000);

    $('.jquery-notific8-notification').addClass('blinking');   
  }
  setTimeout(function(){
    fnc_update_complete_schedule(period,digit);
  },mslife);
  console.log(mslife);
}
/*****************************************************************************************************************************************************************************/
function fnc_update_complete_schedule(period,digit) {

  var data={};    
  data.period = period;
  data.digit  = digit;

  $.ajax({
    type: "POST",
    url: "update-complete-schedule",
    data: JSON.stringify(data),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: true,   
    success: function (resp) 
    {
      if(resp){
        //fnc_notification8_sunatalert(resp.LifeAlert,data.digit);
        setTimeout(fcn_schedule_alert,1000);
      }
    }    
  });
}
/******************************************************************************************************************************************************************************/