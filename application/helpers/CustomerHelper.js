/*****************************************************************************************************************************************************************************/
$(document).ready(InitCustomer);

  //***Public Attributes***
    var $cbo_digit        =   $('#cbo-digit');
    var $cbo_customer_status        =   $('#cbo-customer-status');
    var $modal_customer      =   $('#modal-customer');
    var $customer_modaltitle =   $modal_customer.find('.modal-title');
    var $form_customer       =   $('#form-customer');    
    var $chck_status     =   $('#chck-status');
    var flagnew_customer     =   false; 

    var $txtcustomer        = $('[name=txtcustomer]');
    var $txtpassword    = $('[name=txtpassword]');
    var $txtname        = $('[name=txtname]');
    var $txtlastname    = $('[name=txtlastname]');
    var $txtbirthday    = $('[name=txtbirthday]');
    var $txttelephone   = $('[name=txttelephone]');
    var $txtemail       = $('[name=txtemail]');
    var datatable;
/******************************************************************************************************************************************************************************/
function InitCustomer()
{
    //***Private variables**
    var $datatable_customer       =   $('#datatable-customer');   
    var $btn_callmodal_customer   =   $('#btn-callmodal-customer');    
   
    //***Call Modal customer*** 
    $btn_callmodal_customer.on('click',function () {

      fnc_modal_events();
      $modal_customer.modal({"backdrop": "static","keyboard": false, "show": true});
      fnc_clear_form($form_customer);
      $customer_modaltitle.text('Registrar Usuario');
      flagnew_customer=true;    
    });

    $(document).on('click','.btn-editmodal-customer',fnc_get_customer);
    // $(document).on('click','.btn-deletemodal-customer',fnc_modaldelete_customer);
    // $btn_acceptdelete_schedule.on('click',fnc_delete_schedule);

    //***Init Datatable customers***
    datatable=fnc_datatable_customer($datatable_customer);
    $datatable_customer.find('thead').css({'background-color':'#67809F','color':'white'});
    $datatable_customer.find('tbody').css({'font-weight':'bold'});

    //***Validation form customer***
    fnc_validation_customer($form_customer);

    //***Select2 Digit***
      fnc_select2( $cbo_digit,"Seleccione dígito...");
      fnc_fill_options_digits($cbo_digit);

      fnc_select2($cbo_customer_status,"Seleccione Estado...");   
      $cbo_customer_status.append('<option value="">Activos</option>'
        +'<option value="">Suspendidos Temp.</option>'
        +'<option value="">De baja</option>'
        +'<option value="">Retirados</option>'
        +'<option value="">Todos</option>');
    //***Switch Status customer***
    // $chck_status.bootstrapSwitch({onText:'Activo',offText:'&nbsp;Inactivo&nbsp;',onColor: 'success',offColor:'danger',size: 'normal'});
    // $('.bootstrap-switch').css('width','150px');
      
    // $txtbirthday.datepicker({
    //   format: 'dd/mm/yyyy',
    //   pickTime: false,
    //   autoclose: true,
    //   language: 'es'
    // });
}
/*****************************************************************************************************************************************************************************/
function fnc_datatable_customer(_datatable)
{

    $('#spinner-loading').show();  
  var datatable= _datatable.DataTable({
            "ajax":
             {
                "dataSrc": "Data",
                "type"   : "POST",
                "url"    : "get-all-customer",
                "data"   : function( d ) {
                  d.option= 0;
                },
                complete: function () 
                {
                    $('#spinner-loading').hide();           
                },
              },
              "bLengthChange" : false,
              "language": {
                "url": "assets/language/Spanish.json"
              },
            "aoColumns": [
                    { "data":"id", "title": "Nº" ,"sClass": "text-center"},    
                    { "data":"nombre", "title": "Nombre o Razón Social" ,"sClass": "text-center"},
                    { "data":"ruc", "title": "R.U.C." ,"sClass": "text-center"},
                    { "data":"usuariosol", "title": "Usuario SOL" ,"sClass": "text-center"},
                    { "data":"clavesol", "title": "Clave SOL" ,"sClass": "text-center"},
                    { "data":"tipoempresa", "title": "Tipo de Empresa" ,"sClass": "text-center"},
                    { "data":"regtrib", "title": "Régimen Tributario","sClass": "text-center"},
                    { "data":"regtt", "title": "Régimen Trib.","sClass": "text-center"},
                    { "data":"reglab", "title": "Régimen Laboral","sClass": "text-center"},
                    { "data":"telefono", "title": "Teléfono","sClass": "text-center"},                    
                    { "data":"estado", "title": "Estado","sClass": "text-center"},                    
                    {//Column de botones
                      "title": "Opciones","data":null,
                        "mRender": function(data, type, full) {
                            return '<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-editmodal-customer" data-id="'+data['customerId']+'"><i class="fa fa-edit"></i></a>'
                                  +'<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-deletemodal-customer" data-id="'+data['customerId']+'"><i class="fa fa-trash"></i></a>';
                        }
                    }
                ],
            // "columnDefs" : [
            //             { targets : [10],
            //               render : function (data, type, row) {
            //                  return data == true ? '<span class="label bg-green-jungle">Activo</span>' : '<span class="label bg-red-intense">Inactivo</span>';
            //               }
            //             },
            //     ],
                "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
                  // $('td:eq(2),td:eq(4),td:eq(5)', nRow).addClass( "text-left" );
                  // $('td:eq(2),td:eq(4),td:eq(5)', nRow).removeClass( "text-center" );

                  //ADD TOOLTIP NEW ELEMENT CREATED
                  $('.btn-editmodal-customer', nRow).tooltip({html: true, title: 'Editar Cliente'});
                  $('.btn-deletemodal-customer', nRow).tooltip({html: true, title: 'Eliminar Cliente'});
                }
        });
  return datatable;
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
function fnc_validation_customer(_form) {

  var error2 = $('.alert-danger', _form);
  var success2 = $('.alert-success', _form);

  _form.validate({
    errorElement: 'span', 
    errorClass: 'help-block help-block-error', 
    focusInvalid: false, 
    ignore: "",
    rules: {
      txtcustomer: {
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
      fnc_insert_customer ();
      error2.hide();
    }
  });
}
/*****************************************************************************************************************************************************************************/
function fnc_insert_customer() {

  var birthday = $txtbirthday.datepicker('getDate');
  var data={};    
  data.cbo_role     =  $cbo_role.select2('val');
  data.txt_customer     =  $txtcustomer.val();
  data.txt_password =  $txtpassword.val();
  data.txt_name     =  $txtname.val();
  data.txt_lastname =  $txtlastname.val();
  data.txt_birthday =  moment(birthday).format('YYYY-MM-DD');
  data.txt_telephone=  $txttelephone.val();
  data.txt_email    =  $txtemail.val();
  data.chck_status  =  $chck_status.bootstrapSwitch('state');
    
  var url_customer = flagnew_customer!=true?"update-customer":"insert-customer";

  $.ajax({
    type: "POST",
    url: url_customer,
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
            $modal_customer.modal('hide');
            fnc_msj_alert(resp.type,resp.message,'',resp.icon,5);
            datatable.ajax.reload();
            $('#spinner-loading').hide();
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
function fnc_get_customer() {

  flagnew_customer=false;
  var data={};
  data.customerid   =  $(this).attr('data-id');

  $.ajax({
    type: "POST",
    url: "get-customer-by-customerid",
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