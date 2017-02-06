/*****************************************************************************************************************************************************************************/
$(document).ready(InitUser);

  //***Public Variables***
    var $txt_period             =   $('[name=txtperiod]');
    var $txt_period2            =   $('[name=txtperiod2]');    
    var $cbo_digit              =   $('[name=cbo-digit]');        
    var $txt_duedate            =   $('[name=txtduedate]');
    var $txt_scheduleddate      =   $('[name=txtscheduleddate]');
    var $txt_scheduletime       =   $('[name=txtscheduledtime]');
    var $chck_status            =   $('#chck-status');
    var $modal_schedule         =   $('#modal-schedule');

    //**+Init Datatable***
    var datatable               =   fnc_datatable_schedule($('#datatable-schedule'));


/******************************************************************************************************************************************************************************/
function InitUser()
{
  //***Private Variables***    
    var $btn_callmodal_schedule =   $('#btn-callmodal-schedule');
    var $modal_message          =   $('#modal-message');
    var $form_schedule          =   $('#form-schedule');

  //***Button Call Modal***
    $btn_callmodal_schedule.on('click',function () {
      fnc_modal_events();
      $modal_schedule.modal({"backdrop": "static","keyboard": false, "show": true});
      fnc_clear_form($form_schedule);
    });

  //***Init Switch***
    fnc_switch_status($chck_status);

  //***Init Datepicker***
    $txt_period.datepicker( {
      format: "MM/yyyy",
      startView: "months", 
      minViewMode: "months",
      pickTime: false,
      autoclose: true,
      language: 'es'
    }).on("changeDate", function(e){

      // var period=$(this).datepicker('getDate');
      // $txt_period2.datepicker('setDate', period);

      $('#spinner-loading').show();  
      datatable.ajax.reload(function (data) {
      $('#spinner-loading').hide();  
      //alert(data.Data[0].UserName);
      });
    });

    $txt_period2.datepicker( {
      format: "MM/yyyy",
      startView: "months", 
      minViewMode: "months",
      pickTime: false,
      autoclose: true,
      language: 'es'
    });

    $txt_duedate.datepicker({
      format: 'dd/mm/yyyy',
      pickTime: false,
      autoclose: true,
      language: 'es'
    }).on("changeDate", function(e){

      var duedate=$(this).datepicker('getDate');
      $txt_scheduleddate.datepicker('setDate', duedate);
      $txt_scheduleddate.removeAttr('disabled', 'disabled');

    });

    $txt_scheduleddate.datepicker({
      format: 'dd/mm/yyyy',
      pickTime: false,
      autoclose: true,
      language: 'es'
    });

  //***Init Timepicker***
    $txt_scheduletime.timepicker({defaultTime: '08:00 AM',minuteStep:1})
    .on("changeTime.timepicker", function(e){
    });

  //***Init Select2***
    fnc_select2( $cbo_digit,"Seleccione dígito...");
    fnc_fill_options_digits();
 
  //***Init Validation Form***
    var rules = {"txtduedate": {"minlength": 10, "maxlength": 10, "required": true }, "txtscheduleddate": {"minlength": 10, "maxlength": 10, "required": true }};
    fnc_validation_schedule($form_schedule);

    //  setInterval(function() {
    //  fnc_get_notification();
    // }, 1000);
}
/*****************************************************************************************************************************************************************************/
function fnc_datatable_schedule(_datatable)
{
  $('#spinner-loading').show();  
  var datatable=_datatable.DataTable({
    "ajax":
    {
      "dataSrc": "Data",
      "type"   : "POST",
      "url"    : "get-schedule-sunat",
      "data"   : function( d ) {
        
        var period=$txt_period.datepicker('getDate');
        var dateUsFormat = moment(period).format('YYYY-MM-DD');

        d.period= dateUsFormat!=''?dateUsFormat:0;
      },
      complete: function () 
      {
        $('#spinner-loading').hide();           
      },
    },
    "searching":false,
    "bLengthChange" : false,
    "language": {
      "url": "http://cdn.datatables.net/plug-ins/1.10.13/i18n/Spanish.json"
    },
    "pageLength": 10,
    "aoColumns": [
      { "data":"ScheduleDigit", "title": "Dígito" ,"sClass": "text-center"},    
      { "data":"ScheduleDueDate", "title": "Fecha Vencimiento" ,"sClass": "text-center"},
      { "data":"ScheduleProgramDate", "title": "Fecha Programada" ,"sClass": "text-center"},
      { "data":"ScheduleProgramTime", "title": "Hora Programada" ,"sClass": "text-center"},
      { "data":"ScheduleStatus", "title": "Estado" ,"sClass": "text-center"},                  
      { "data":"UserName", "title": "Registrado" ,"sClass": "text-center"},                  
      { "data":null, "title": "Opciones",
      "mRender": function(data, type, full) {
          return '<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-editmodal-user" data-id="'+data['ScheduleId']+'"><i class="fa fa-edit"></i></a>'
          +'<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-deletemodal-user"><i class="fa fa-trash"></i></a>';
        }
      }
    ],
    "columnDefs" : [
      { targets : [4],
        render : function (data, type, row) {
        return data == true ? '<span class="label bg-green-jungle">Activo</span>' : '<span class="label bg-red-intense">Inactivo</span>';
        }
      },
    ],
    "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
    // $('td:eq(2),td:eq(4),td:eq(5)', nRow).addClass( "text-left" );
    // $('td:eq(2),td:eq(4),td:eq(5)', nRow).removeClass( "text-center" );
      //alert(aData.ScheduleProgramTime);

        // setTimeout(function() {
        // fnc_get_notification();
        // }, 1000);
      fnc_get_notification(aData.ScheduleProgramTime);
    //ADD TOOLTIP NEW ELEMENT CREATED
    // $('.btn-editmodal-user', nRow).tooltip({html: true, title: 'Editar usuario'});
    // $('.btn-deletemodal-user', nRow).tooltip({html: true, title: 'Eliminar usuario'});
    }
  });

  return datatable;
}
/*****************************************************************************************************************************************************************************/
function fnc_validation_schedule(_form)
{
  var error2 = $('.alert-danger', _form);
  var success2 = $('.alert-success', _form);

  _form.validate({
    errorElement: 'span', 
    errorClass: 'help-block help-block-error', 
    focusInvalid: false, 
    ignore: "",
    rules: {
      txtperiod2: {
        required: true
      },
      txtduedate: {
        minlength: 10,
        maxlength: 10,
        required: true
      },
      txtscheduleddate: {
        minlength: 10,
        maxlength: 10,
        required: true
      }
    },
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
      
      fnc_set_schedule_sunat ();
     // success2.show();
      error2.hide();
      //alert("Hola"+form[0].txtscheduleddate);
    }
  });
}
/*****************************************************************************************************************************************************************************/
function fnc_fill_options_digits()
{
  var options="";
  for (var i =0;i<10;i++)
  {
   options+='<option value="'+i+'">'+i+'</option>';
  }
 $cbo_digit.append(options);
}
/*****************************************************************************************************************************************************************************/
function fnc_clear_form(_form)
{
  $txt_duedate.datepicker('setDate', null);  
  $txt_scheduleddate.datepicker('setDate', null);  
  $txt_scheduleddate.attr('disabled', 'disabled');

  var period=isNaN($txt_period.datepicker('getDate'))?null:$txt_period.datepicker('getDate');
  $txt_period2.datepicker('setDate', period);

  $cbo_digit.select2('val','');
  $txt_scheduletime.timepicker('setTime', '08:00 AM');
  $chck_status.bootstrapSwitch('state', true);
}
/*****************************************************************************************************************************************************************************/
function fnc_set_schedule_sunat()
{
  var period              = $txt_period2.datepicker('getDate');
  var duedate             = $txt_duedate.datepicker('getDate');
  var scheduleddate       = $txt_scheduleddate.datepicker('getDate');
  var time                = fnc_format_time($txt_scheduletime);

  var data={};    
  data.txt_period         =  moment(period).format('YYYY-MM-DD');
  data.cbo_digit          =  $cbo_digit.select2('val'); 
  data.txt_duedate        =  moment(duedate).format('YYYY-MM-DD');
  data.txt_scheduleddate  =  moment(scheduleddate).format('YYYY-MM-DD');
  data.txt_scheduletime   =  time;
  data.txt_status         =  $chck_status.bootstrapSwitch('state');

  $.ajax({
    type: "POST",
    url: "set-schedule-sunat",
    data: JSON.stringify(data),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: true,
    beforeSend: function () 
    {  
      $('#spinner-loading').show();          
    },
    success: function (resp) 
    {
      switch(resp.status)
      {
        case true:
          $modal_schedule.modal('hide');
          fnc_msj_alert(resp.type,resp.message,'',resp.icon,5);
          datatable.ajax.reload(function (data) {
          $('#spinner-loading').hide();
          });
        break;

        case false:
         fnc_msj_alert(resp.type,resp.message,'.modal-msj-alert',resp.icon,5);
         $('#spinner-loading').hide();
        break;
      }
    },
    complete: function () 
    {     
    },
    error: function(resp)
    {
      fnc_msj_alert('danger','Error de Conexión, Vuelva intentarlo.','.modal-msj-alert','warning',5);
      $('#spinner-loading').hide();
    }
  });
}
/*****************************************************************************************************************************************************************************/
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
/*****************************************************************************************************************************************************************************/
function fnc_notification8()
{  
    var settings = {    // sticky: true,
    heading:"jean",
    life:10000
    }; 
    $.notific8('zindex', 11500);
    $.notific8("Notificación", settings);
}

function fnc_get_notification(time)
{
 // var time="04:29:00 PM";

  var data={};    
  data.time =  time;
   $.ajax({
    type: "POST",
    url: "get-notifications",
    data: JSON.stringify(data),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: true,    
    success: function (resp) 
    {
      if(resp==true)
      {
        //fnc_notification8();
        // setInterval(function() {
        //  fnc_get_notification( data.time);
        // }, 1000);
      }
    },
    complete: function () 
    {     
    },
    error: function(resp)
    {     
    }
  });  
  // setTimeout(function() {
  
  // }, 60000);
}
/*****************************************************************************************************************************************************************************/