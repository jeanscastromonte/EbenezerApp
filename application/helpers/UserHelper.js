/*****************************************************************************************************************************************************************************/
$(document).ready(InitUser);

  //***Public Attributes***
    var $cbo_role        =   $('#cbo-role');
    var $modal_user      =   $('#modal-user');
    var $user_modaltitle =   $modal_user.find('.modal-title');
    var $form_user       =   $('#form-user');    
    var $chck_status     =   $('#chck-status');
    var flagnew_user     =   false; 

    var $txtuser        = $('[name=txtuser]');
    var $txtpassword    = $('[name=txtpassword]');
    var $txtname        = $('[name=txtname]');
    var $txtlastname    = $('[name=txtlastname]');
    var $txtbirthday    = $('[name=txtbirthday]');
    var $txttelephone   = $('[name=txttelephone]');
    var $txtemail       = $('[name=txtemail]');
/******************************************************************************************************************************************************************************/
function InitUser()
{
    //***Private variables**
    var $datatable_user       =   $('#datatable-user');   
    var $btn_callmodal_user   =   $('#btn-callmodal-user');    
   
    //***Call Modal User*** 
    $btn_callmodal_user.on('click',function () {

      fnc_modal_events();
      $modal_user.modal({"backdrop": "static","keyboard": false, "show": true});
      fnc_clear_form($form_user);
      $user_modaltitle.text('Registrar Usuario');
      flagnew_user=true;    
    });

    $(document).on('click','.btn-editmodal-user',fnc_get_user);
    // $(document).on('click','.btn-deletemodal-user',fnc_modaldelete_user);
    // $btn_acceptdelete_schedule.on('click',fnc_delete_schedule);

    //***Init Datatable users***
    fnc_datatable_user($datatable_user);

    //***Validation form user***
    fnc_validation_user($form_user);

    //***Select2 roles***
    fnc_select2_roles($cbo_role)
    
    //***Switch Status user***
    $chck_status.bootstrapSwitch({onText:'Activo',offText:'&nbsp;Inactivo&nbsp;',onColor: 'success',offColor:'danger',size: 'normal'});
    $('.bootstrap-switch').css('width','150px');
      
    $txtbirthday.datepicker({
      format: 'dd/mm/yyyy',
      pickTime: false,
      autoclose: true,
      language: 'es'
    });
}
/*****************************************************************************************************************************************************************************/
function fnc_datatable_user(_datatable)
{
    $('#spinner-loading').show();  
   _datatable.DataTable({
            "ajax":
             {
                "dataSrc": "Data",
                "type"   : "POST",
                "url"    : "get-all-users",
                "data"   : function( d ) {
                  d.cliente_id= 0;
                },
                complete: function () 
                {
                    $('#spinner-loading').hide();           
                },
              },
              "bLengthChange" : false,
              "language": {
                "url": "http://cdn.datatables.net/plug-ins/1.10.13/i18n/Spanish.json"
              },
            "aoColumns": [
                    { "data":"UserId", "title": "Nro" ,"sClass": "text-center"},    
                    { "data":"UserImage", "title": "Foto" ,"sClass": "text-center"},
                    { "data":"UserLoginName", "title": "Usuario" ,"sClass": "text-center"},
                    { "data":"RoleName", "title": "Rol" ,"sClass": "text-center"},
                    { "data":"UserName", "title": "Nombre(s)" ,"sClass": "text-center"},
                    { "data":"UserLastName", "title": "Apellido(s)" ,"sClass": "text-center"},
                    { "data":"UserBirthdate", "title": "Fecha de Nacimiento","sClass": "text-center"},
                    { "data":"UserTelephone", "title": "Teléfono","sClass": "text-center"},
                    { "data":"UserEmail", "title": "E-mail","sClass": "text-center"},
                    { "data":"UserStatus", "title": "Estado","sClass": "text-center"},                    
                    {//Column de botones
                      "title": "Opciones","data":null,
                        "mRender": function(data, type, full) {
                            return '<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-editmodal-user" data-id="'+data['UserId']+'"><i class="fa fa-edit"></i></a>'
                                  +'<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-deletemodal-user" data-id="'+data['UserId']+'"><i class="fa fa-trash"></i></a>';
                        }
                    }
                ],
            "columnDefs" : [
                        { targets : [9],
                          render : function (data, type, row) {
                             return data == true ? '<span class="label bg-green-jungle">Activo</span>' : '<span class="label bg-red-intense">Inactivo</span>';
                          }
                        },
                ],
                "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
                  $('td:eq(2),td:eq(4),td:eq(5)', nRow).addClass( "text-left" );
                  $('td:eq(2),td:eq(4),td:eq(5)', nRow).removeClass( "text-center" );

                  //ADD TOOLTIP NEW ELEMENT CREATED
                  $('.btn-editmodal-user', nRow).tooltip({html: true, title: 'Editar usuario'});
                  $('.btn-deletemodal-user', nRow).tooltip({html: true, title: 'Eliminar usuario'});
                }
        });
}
/*****************************************************************************************************************************************************************************/
function fnc_select2_roles(_cbo)
{
    $.getJSON("get-all-roles", function (data){ 
        _cbo.html('<option></option>');
        for (var i = 0; i<data.length;i++) 
        {
            _cbo.append('<option value="'+data[i].RoleId+'">'+data[i].RoleName+'</option>');                   
        }
    });
     _cbo.select2({
        placeholder: "Seleccione...",
        allowClear: true,
        formatNoMatches: function () { return "No se encontraron resultados"; },        
    });
}
/*****************************************************************************************************************************************************************************/
function fnc_clear_form(_form) {

  _form.trigger("reset");  
  $txtbirthday.datepicker('setDate', null);
  $cbo_role.select2('val','');
}
/*****************************************************************************************************************************************************************************/
function fnc_validation_user(_form) {

  var error2 = $('.alert-danger', _form);
  var success2 = $('.alert-success', _form);

  _form.validate({
    errorElement: 'span', 
    errorClass: 'help-block help-block-error', 
    focusInvalid: false, 
    ignore: "",
    rules: {
      txtuser: {
        required: true
      },
      txtpassword: {
        minlength: 4,       
        required: true
      },
      txtname: {
        required: true
      },
      txtlastname: {
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
      fnc_insert_user ();
      error2.hide();
    }
  });
}
/*****************************************************************************************************************************************************************************/
function fnc_insert_user() {

  var birthday = $txtbirthday.datepicker('getDate');
  var data={};    
  data.cbo_role     =  $cbo_role.select2('val');
  data.txt_user     =  $txtuser.val();
  data.txt_password =  $txtpassword.val();
  data.txt_name     =  $txtname.val();
  data.txt_lastname =  $txtlastname.val();
  data.txt_birthday =  moment(birthday).format('YYYY-MM-DD');
  data.txt_telephone=  $txttelephone.val();
  data.txt_email    =  $txtemail.val();
  data.chck_status  =  $chck_status.bootstrapSwitch('state');
    
  var url_user = flagnew_user!=true?"update-user":"insert-user";

  $.ajax({
    type: "POST",
    url: url_user,
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
            // $txt_period.datepicker('setDate', period);
            $modal_suser.modal('hide');
            fnc_msj_alert(resp.type,resp.message,'',resp.icon,5);
            // $(document).find('.jquery-notific8-close').trigger('click');  
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
function fnc_get_user() {

  flagnew_user=false;
  var data={};
  data.userid   =  $(this).attr('data-id');

  $.ajax({
    type: "POST",
    url: "get-user-by-userid",
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

        // $schedule_modaltitle.text('Editar Cronograma');
        // $txt_period2.datepicker('setDate', ConvertDate(resp.SchedulePeriod));
        // $cbo_digit.select2('val',resp.ScheduleDigit);      
        // $txt_duedate.datepicker('setDate', resp.ScheduleDueDate);
        // $txt_scheduleddate.datepicker('setDate', resp.ScheduleProgramDate);
        // $txt_scheduletime.timepicker('setTime', resp.ScheduleProgramTime);
        // $chck_status.bootstrapSwitch('state', resp.ScheduleStatus==0?false:true);

        // $txt_period2.attr('disabled', 'disabled');
        // $cbo_digit.attr('disabled', 'disabled');

        // fnc_modal_events();
        // $modal_schedule.modal({"backdrop": "static","keyboard": false, "show": true});
        // $('#spinner-loading').hide();

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