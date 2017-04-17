/*****************************************************************************************************************************************************************************/
$(document).ready(InitCustomer);

  //***Public Attributes***
    var $cbo_digit           =   $('#cbo-digit');
    var $cbo_customer_status =   $('#cbo-customer-status');
    var $cbo_status          =   $('#cbo-status');

    var $modal_customer      =   $('#modal-customer');
    var $customer_modaltitle =   $modal_customer.find('.modal-title');
    var $form_customer       =   $('#form-customer');
    var flagnew_customer     =   false; 

    var $txtcustomer         = $('[name=txtcustomer]');
    var $txtruc              = $('[name=txtruc]');
    var $txtusersol          = $('[name=txtusersol]');
    var $txtpasswordsol      = $('[name=txtpasswordsol]');
    var $txtaddress          = $('[name=txtaddress]');
    var $txtphone            = $('[name=txtphone]');
    var $txtemail            = $('[name=txtemail]');
    var $txtregtrib          = $('[name=txtregtrib]');
    var $txtreg4ta           = $('[name=txtreg4ta]');
    var $txtreglab           = $('[name=txtreglab]');
    var $txtstartdate        = $('[name=txtstartdate]');
    var datatable;
    var customerid=0;

    var $modal_customer_message    = $('#modal-customer-message');    
    var $btn_acceptdelete_customer = $('#btn-acceptdelete-customer');
/******************************************************************************************************************************************************************************/
function InitCustomer(){

  //***Private variables**
    var $datatable_customer       =   $('#datatable-customer');   
    var $btn_callmodal_customer   =   $('#btn-callmodal-customer');

  //***Call Modal customer*** 
    $btn_callmodal_customer.on('click',function () {
      fnc_modal_events();
      $modal_customer.modal({"backdrop": "static","keyboard": false, "show": true});
      fnc_clear_form($form_customer);
      $customer_modaltitle.text('Registrar Cliente');
      flagnew_customer=true;
      customerid=0;
      $txtstartdate.datepicker('setDate', new Date());
    });

    $(document).on('click','.btn-editmodal-customer',fnc_get_customer);
    $(document).on('click','.btn-deletemodal-customer',fnc_modaldelete_customer);
    $btn_acceptdelete_customer.on('click',fnc_delete_customer);

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
    $cbo_customer_status.append('<option value="1">Activos</option>'
                                  +'<option value="2">Suspendidos Temp.</option>'
                                  +'<option value="3">De baja</option>'
                                  +'<option value="4">Retirados</option>'
                                  +'<option value="5">Todos</option>');

    fnc_select2($cbo_status,"Seleccione Estado...");
    $cbo_status.append('<option value="Activo">Activo</option>'
                        +'<option value="Suspendido">Suspendido</option>'
                        +'<option value="De baja">De baja</option>'
                        +'<option value="Retirado">Retirado</option>');

    $cbo_customer_status.select2('val',1);

    $cbo_digit.on('change',function(){
      $('#spinner-loading').show();      
      datatable.ajax.reload();
      $('#spinner-loading').hide();
      if($(this).select2('val')!=''){
        $('#span-title-digit').text('DIGITO '+$(this).select2('val'));
      }
      else{
         $('#span-title-digit').empty();
      }
    });

    $cbo_customer_status.on('change',function(){
      $('#spinner-loading').show();      
      datatable.ajax.reload();
      $('#spinner-loading').hide();
    });

  $txtstartdate.datepicker({
    format: 'dd/mm/yyyy',
    pickTime: false,
    autoclose: true,
    language: 'es'
  });
}
/*****************************************************************************************************************************************************************************/
function fnc_datatable_customer(_datatable){

  $('#spinner-loading').show();  
  var datatable= _datatable.DataTable({
    "ajax":
     {
        "dataSrc": "Data",
        "type"   : "POST",
        "url"    : "get-all-customer",
        "data"   : function( d ) {
          d.digit  = $cbo_digit.select2('val');
          d.status = $cbo_customer_status.select2('val');
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
            { "data":"CustomerId", "title": "ID" ,"sClass": "text-center"},    
            { "data":"CustomerName", "title": "Nombre" ,"sClass": "text-center"},
            { "data":"CustomerRuc", "title": "RUC" ,"sClass": "text-center"},
            { "data":"CustomerUserSol", "title": "Usuario SOL" ,"sClass": "text-center"},
            { "data":"CustomerPasswordSol", "title": "Clave SOL" ,"sClass": "text-center"},
            { "data":"CustomerType", "title": "Tipo" ,"sClass": "text-center"},
            { "data":"CustomerRegtrib", "title": "Rég. Trib 1","sClass": "text-center"},
            { "data":"CustomerRegtt", "title": "Rég. Trib 2","sClass": "text-center"},
            { "data":"CustomerReglab", "title": "Rég. Lab.","sClass": "text-center"},
            { "data":"CustomerTelephone", "title": "Teléfono","sClass": "text-center"},                    
            { "data":"CustomerStatus", "title": "Estado","sClass": "text-center","width": "40%"},                    
            {//Column de botones
              "title": "Opciones","data":null,
                "mRender": function(data, type, full) {
                    return '<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-editmodal-customer" data-id="'+data['CustomerId']+'"><i class="fa fa-edit"></i></a>'
                          +'<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-deletemodal-customer" data-id="'+data['CustomerId']+'" data-name="'+data['CustomerName']+'"><i class="fa fa-trash"></i></a>';
                }
            }
        ],
    "columnDefs" : [
                // { targets : [0],"width": "10%"},
                // { targets : [1],"width": "5%"},
                // { targets : [2],"width": "5%"},
                // { targets : [3],"width": "5%"},
                // { targets : [4],"width": "5%"},
                // { targets : [5],"width": "5%"},
                // { targets : [6],"width": "5%"},
                // { targets : [7],"width": "5%"},
                // { targets : [8],"width": "5%"},
                // { targets : [9],"width": "5%"},
                // { targets : [10],"width": "5%"},
                // { targets : [11],"width": "40%"},
                //   render : function (data, type, row) {
                //      return data == true ? '<span class="label bg-green-jungle">Activo</span>' : '<span class="label bg-red-intense">Inactivo</span>';
                //   }
                
          // { "width": "20%", "targets": 0 },
        ],
        "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {

          $('td:eq(1)', nRow).removeClass( "text-center").addClass( "text-left" );
          $('th:eq(1)', nRow).css('width','20%');

          //ADD TOOLTIP NEW ELEMENT CREATED
          $('.btn-editmodal-customer', nRow).tooltip({html: true, title: 'Editar Cliente'});
          $('.btn-deletemodal-customer', nRow).tooltip({html: true, title: 'Eliminar Cliente'});
        }
  });
  return datatable;
}
/*****************************************************************************************************************************************************************************/
function fnc_select2_roles(_cbo){
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
  $cbo_status.select2('val','');
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
      txtruc: {       
        required: true
      },
      txtusersol: {
        required: true
      },
      txtpasswordsol: {
        required: true
      },
      txtregtrib: {
        required: true
      },
      txtreg4ta: {
        required: true
      },
      txtreglab: {
        required: true
      },
      txtstartdate: {
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
      fnc_set_customer ();
      error2.hide();
    }
  });
}
/*****************************************************************************************************************************************************************************/
function fnc_set_customer() {

  var startdate = $txtstartdate.datepicker('getDate');
  var data={};
  data.customerid     =  customerid;
  data.txtcustomer    =  $txtcustomer.val();
  data.txtruc         =  $txtruc.val();
  data.txtusersol     =  $txtusersol.val();
  data.txtpasswordsol =  $txtpasswordsol.val();
  data.txtaddress     =  $txtaddress.val();
  data.txtphone       =  $txtphone.val();
  data.txtemail       =  $txtemail.val();
  data.txtregtrib     =  $txtregtrib.val();
  data.txtreg4ta      =  $txtreg4ta.val();
  data.txtreglab      =  $txtreglab.val();
  data.txtstartdate   =  moment(startdate).format('YYYY-MM-DD');
  data.cbo_status    =   $cbo_status.val();
    
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
  console.log(data.customerid);
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

        $customer_modaltitle.text('Editar Cliente');
        customerid=resp.CustomerId;
        $txtcustomer.val(resp.CustomerName);
        $txtruc.val(resp.CustomerRuc);
        $txtusersol.val(resp.CustomerUserSol);
        $txtpasswordsol.val(resp.CustomerPasswordSol);
        $txtaddress.val(resp.CustomerAddress);
        $txtphone.val(resp.CustomerTelephone);
        $txtemail.val(resp.CustomerEmail);
        $txtregtrib.val(resp.CustomerRegtrib);
        $txtreg4ta.val(resp.CustomerRegtt);
        $txtreglab.val(resp.CustomerReglab);       
        $txtstartdate.val(resp.CustomerDateStart);
        $cbo_status.select2('val',resp.CustomerStatus);

        fnc_modal_events();
        $modal_customer.modal({"backdrop": "static","keyboard": false, "show": true});
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
function fnc_modaldelete_customer() {

  fnc_modal_events();
  $modal_customer_message.modal({"backdrop": "static","keyboard": false, "show": true});
  var customerid   =  $(this).attr('data-id');
  var customername =  $(this).attr('data-name');
  $('#span-customer-name').text(customername);
  $btn_acceptdelete_customer.attr({'data-id':customerid});
}
/*****************************************************************************************************************************************************************************/
function fnc_delete_customer() {

  var data={};
  data.customerid   =  $(this).attr('data-id');
  console.log(data.customerid);

  $.ajax({
    type: "POST",
    url: "delete-customer",
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
            $modal_customer_message.modal('hide');
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
    }
  });
}
/*****************************************************************************************************************************************************************************/