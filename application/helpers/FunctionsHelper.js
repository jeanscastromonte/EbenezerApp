
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
function fnc_form_validation(_form,_rules)
{
  var error2 = $('.alert-danger', _form);
  var success2 = $('.alert-success', _form);

  _form.validate({
    errorElement: 'span', 
    errorClass: 'help-block help-block-error', 
    focusInvalid: false, 
    ignore: "",
    rules: _rules,

    invalidHandler: function (event, validator) {              
      success2.hide();
      error2.show();
      Metronic.scrollTo(error2, -200);
    },
    errorPlacement: function (error, element) { 
      var icon = $(element).parent('.input-icon').children('i');
      icon.removeClass('fa-check').addClass("fa-warning");  
      icon.attr("data-original-title", error.text()).tooltip({'container': 'body'});
    },
    highlight: function (element) { 
      $(element)
      .closest('.form-group').removeClass("has-success").addClass('has-error');
    },
    unhighlight: function (element) {
    },
    success: function (label, element) {
      var icon = $(element).parent('.input-icon').children('i');
      $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
      icon.removeClass("fa-warning").addClass("fa-check");
    },
    submitHandler: function (form) {
      success2.show();
      error2.hide();
      //alert("Hola"+form[0].txtscheduleddate);
    }
  });
}
/******************************************************************************************************************************************************************************/
function fnc_switch_status(_selector)
{
   _selector.bootstrapSwitch({onText:'Activo',offText:'&nbsp;Inactivo&nbsp;',onColor: 'success',offColor:'danger',size: 'normal'});
    $('.bootstrap-switch').css('width','150px');
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