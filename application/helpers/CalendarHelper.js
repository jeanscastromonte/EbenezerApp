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
    var $chck_date_period       =   $('#chck-date-period');
    var $modal_schedule         =   $('#modal-schedule');
    var $datatable_schedule     =   $('#datatable-schedule');
    var $datatable_schedule_year=   $('#datatable-schedule-year');
    var $schedule_modaltitle    =   $('#modal-schedule').find('.modal-title'); 
    var $modal_message          =   $('#modal-message');
    var $btn_acceptdelete_schedule  =   $('#btn-acceptdelete-schedule');
    var flagnew_schedule;

  //**Init Datatable***    
    var var_datatable = fnc_datatable_schedule($datatable_schedule);
/******************************************************************************************************************************************************************************/
function InitUser(){

  //***Private Variables***    
    var $btn_callmodal_schedule =   $('#btn-callmodal-schedule');
    var $form_schedule          =   $('#form-schedule');  

  //***Button Call Modal***
    $btn_callmodal_schedule.on('click',function () {
      flagnew_schedule=true;
      fnc_modal_events();
      $modal_schedule.modal({"backdrop": "static","keyboard": false, "show": true});
      fnc_clear_form($form_schedule);
      $schedule_modaltitle.text('Registrar Cronograma');     
    });

    $(document).on('click','.btn-editmodal-schedule',fnc_get_schedule_by_period_digit);
    $(document).on('click','.btn-deletemodal-schedule',fnc_modaldelete_schedule);
    $btn_acceptdelete_schedule.on('click',fnc_delete_schedule);

  //***Init Switch***
    fnc_switch_status($chck_status);
    
    $chck_date_period.bootstrapSwitch({onText:'Mes',offText:'Año',onColor: 'success',offColor:'info',size: 'small'})
    .on('switchChange.bootstrapSwitch', function (e,state) {

      $txt_period.val('');
      console.log(state);

      switch (state){

        case true:
          $datatable_schedule_year.DataTable().destroy();
          $datatable_schedule_year.empty();
          $datatable_schedule.show();
          var_datatable  = fnc_datatable_schedule($datatable_schedule);
          fnc_period("MM/yyyy","months");
          break;

        case false:
          $datatable_schedule.DataTable().destroy();
          $datatable_schedule.empty();
          $datatable_schedule_year.show();
          var_datatable  = fnc_datatable_scheduleYear($datatable_schedule_year);
          fnc_period("yyyy","years");
          break;
      } 
    });

  //***Init Datepicker***
    fnc_period("MM/yyyy","months");      

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
    fnc_fill_options_digits($cbo_digit);
 
  //***Init Validation Form***
    var rules = {"txtduedate": {"minlength": 10, "maxlength": 10, "required": true }, "txtscheduleddate": {"minlength": 10, "maxlength": 10, "required": true }};
    fnc_validation_schedule($form_schedule);
}
/*****************************************************************************************************************************************************************************/
function fnc_period(format,mode) {

  $txt_period.datepicker('remove');
  $txt_period.datepicker( {
      format: format,
      startView: mode, 
      minViewMode: mode,      
      pickTime: false,
      autoclose: true,
      language: 'es'
    }).on("changeDate", function(e){

      // var period=$(this).datepicker('getDate');
      // $txt_period2.datepicker('setDate', period);
      
      $('#spinner-loading').show();  
      var_datatable.ajax.reload(function (data) {
      $('#spinner-loading').hide();
      });
    });
}
/*****************************************************************************************************************************************************************************/
function fnc_datatable_schedule(_datatable) {

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
      "url": "assets/language/Spanish.json"
    },
    "pageLength": 10,
    "aoColumns": [
      { "data":"ScheduleDigit", "title": "Dígito" ,"sClass": "text-center"},    
      { "data":"ScheduleDueDate", "title": "Fecha Vencimiento" ,"sClass": "text-center"},
      { "data":"ScheduleProgramDate", "title": "Fecha Programada" ,"sClass": "text-center"},
      { "data":"ScheduleProgramTime", "title": "Hora Programada" ,"sClass": "text-center"},
      { "data":"ScheduleCompleteStatus", "title": "Alerta" ,"sClass": "text-center"},      
      { "data":"ScheduleStatus", "title": "Estado" ,"sClass": "text-center"},
      { "data":"UserName", "title": "Registrado" ,"sClass": "text-center"},                  
      { "data":null, "title": "Opciones",
      "mRender": function(data, type, full) {
          return '<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-editmodal-schedule" data-digit="'+data['ScheduleDigit']+'" data-period="'+data['SchedulePeriod']+'"><i class="fa fa-edit"></i></a>'
          +'<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-deletemodal-schedule" data-digit="'+data['ScheduleDigit']+'" data-period="'+data['SchedulePeriod']+'"><i class="fa fa-trash"></i></a>';
        }
      }
    ],
    "columnDefs" : [
      { targets : [4],
        render : function (data, type, row) {
        return data != true ? '<span class="label bg-green-jungle">En transcurso</span>' : '<span class="label bg-red-intense">Vencido</span>';
        }
      },
      { targets : [5],
        render : function (data, type, row) {
        return data == true ? '<span class="label bg-green-jungle">Pendiente</span>' : '<span class="label bg-red-intense">Completado</span>';
        }
      }      
    ],
    "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
    },
    dom: 'Bfrtip',
    buttons: [
            
            {
                extend: 'collection',
                text: 'Export',
                buttons: [
                    'copy',
                    'excel',
                    'csv',
                    'pdf',
                    'print'
                ]
            }
        ]
  });

  return datatable;
}
/*****************************************************************************************************************************************************************************/
function fnc_datatable_scheduleYear(_datatable) {
   
  $('#spinner-loading').show();  
  var datatable=_datatable.DataTable({
    "ajax":
    {
      "dataSrc": "Data",
      "type"   : "POST",
      "url"    : "get-schedule-year-sunat",
      "data"   : function( d ) {
        
        var period=$txt_period.datepicker('getDate');
        var dateUsFormat = moment(period).format('YYYY');
        d.period= dateUsFormat;
         
      },
      complete: function () 
      {
        $('#spinner-loading').hide();           
      },
    },
    "searching":false,
    "bLengthChange" : false,
    "language": {
      "url": "assets/language/Spanish.json"
    },
    "pageLength": 10,
    "aoColumns": [
      { "data":"Period", "title": "Período Tributario"},    
      { "data":"d0", "title": "0" ,"sClass": "text-center"},
      { "data":"d1", "title": "1" ,"sClass": "text-center"},
      { "data":"d2", "title": "2" ,"sClass": "text-center"},
      { "data":"d3", "title": "3" ,"sClass": "text-center"},
      { "data":"d4", "title": "4" ,"sClass": "text-center"},
      { "data":"d5", "title": "5" ,"sClass": "text-center"},
      { "data":"d6", "title": "6" ,"sClass": "text-center"},
      { "data":"d7", "title": "7" ,"sClass": "text-center"},
      { "data":"d8", "title": "8" ,"sClass": "text-center"},
      { "data":"d9", "title": "9" ,"sClass": "text-center"}
    ]
  });

  return datatable;
}
/*****************************************************************************************************************************************************************************/
function fnc_validation_schedule(_form) {

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
      error2.hide();
    }
  });
}
/*****************************************************************************************************************************************************************************/
function fnc_clear_form(_form) {

  $txt_duedate.datepicker('setDate', null);  
  $txt_scheduleddate.datepicker('setDate', null);  
  $txt_scheduleddate.attr('disabled', 'disabled');

  $txt_period2.removeAttr('disabled');
  $cbo_digit.removeAttr('disabled');

  var period=isNaN($txt_period.datepicker('getDate'))?null:$txt_period.datepicker('getDate');
  $txt_period2.datepicker('setDate', period);

  $cbo_digit.select2('val','');
  $txt_scheduletime.timepicker('setTime', '08:00 AM');
  $chck_status.bootstrapSwitch('state', true);
}
/*****************************************************************************************************************************************************************************/
function fnc_set_schedule_sunat() {

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
    
  var url_schedule_sunat = flagnew_schedule!=true?"update-schedule-sunat":"set-schedule-sunat";

  $.ajax({
    type: "POST",
    url: url_schedule_sunat,
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
      if(resp){
        switch(resp.status)
        {
          case true:
            $txt_period.datepicker('setDate', period);
            $modal_schedule.modal('hide');
            fnc_msj_alert(resp.type,resp.message,'',resp.icon,5);
            $(document).find('.jquery-notific8-close').trigger('click');            
            fcn_schedule_alert();

            break;

          case false:
            fnc_msj_alert(resp.type,resp.message,'.modal-msj-alert',resp.icon,5);
            $('#spinner-loading').hide();        
            break;
        }
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
function fnc_get_schedule_by_period_digit() {
   
  flagnew_schedule=false;

  var data={};    
  data.period  =  moment($(this).attr('data-period')).format('YYYY-MM-DD');
  data.digit   =  $(this).attr('data-digit');  

  $.ajax({
    type: "POST",
    url: "get-schedule-sunat-byperioddigit",
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
      if(resp){

        $schedule_modaltitle.text('Editar Cronograma');
        $txt_period2.datepicker('setDate', ConvertDate(resp.SchedulePeriod));
        $cbo_digit.select2('val',resp.ScheduleDigit);      
        $txt_duedate.datepicker('setDate', resp.ScheduleDueDate);
        $txt_scheduleddate.datepicker('setDate', resp.ScheduleProgramDate);
        $txt_scheduletime.timepicker('setTime', resp.ScheduleProgramTime);
        $chck_status.bootstrapSwitch('state', resp.ScheduleStatus==0?false:true);

        $txt_period2.attr('disabled', 'disabled');
        $cbo_digit.attr('disabled', 'disabled');

        fnc_modal_events();
        $modal_schedule.modal({"backdrop": "static","keyboard": false, "show": true});
        $('#spinner-loading').hide();

      }     
    },
    complete: function () 
    {
    },
    error: function(resp)
    {
    }
  });
}
/*****************************************************************************************************************************************************************************/
function fnc_modaldelete_schedule() {

  fnc_modal_events();
  $modal_message.modal({"backdrop": "static","keyboard": false, "show": true});
  var period  =  moment($(this).attr('data-period')).format('YYYY-MM-DD');
  var digit   =  $(this).attr('data-digit');
  $btn_acceptdelete_schedule.attr({'data-period':period,'data-digit':digit});
}
/*****************************************************************************************************************************************************************************/
function fnc_delete_schedule() {

  var data={};
  data.period  =  moment($(this).attr('data-period')).format('YYYY-MM-DD');
  data.digit   =  $(this).attr('data-digit');
  console.log(data.period);
  console.log(data.digit);

  $.ajax({
    type: "POST",
    url: "delete-schedule-sunat",
    data: JSON.stringify(data),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: true,
    beforeSend: function () 
    {
    },
    success: function (resp) 
    {
      if(resp){
        switch(resp.status)
        {
          case true:
            $txt_period.datepicker('setDate', ConvertDate(data.period));            
            $modal_message.modal('hide');
            fnc_msj_alert(resp.type,resp.message,'',resp.icon,5);
            fcn_schedule_alert();
            break;

          case false:
            fnc_msj_alert(resp.type,resp.message,'.modal-msj-alert',resp.icon,5);
            $('#spinner-loading').hide();        
            break;
        }
      }
    },
    complete: function () 
    {
    },
    error: function(resp)
    {
    }
  });
}
/*****************************************************************************************************************************************************************************/