/*****************************************************************************************************************************************************************************/
$(document).ready(Initrole);

  //***Public Attributes***
    var $modal_role      =   $('#modal-role');
    var $role_modaltitle =   $modal_role.find('.modal-title');
    var $form_role       =   $('#form-role');
    var flagnew_role     =   false; 

    var $txtrole        = $('[name=txtrole]');
    var datatable;
    var roleid=0;
    var $modal_role_message    = $('#modal-role-message');    
    var $btn_acceptdelete_role = $('#btn-acceptdelete-role');

/******************************************************************************************************************************************************************************/
function Initrole(){

    //***Private variables**
    var $datatable_role       =   $('#datatable-role');   
    var $btn_callmodal_role   =   $('#btn-callmodal-role');    
   
    //***Call Modal role*** 
    $btn_callmodal_role.on('click',function () {

      fnc_modal_events();
      $modal_role.modal({"backdrop": "static","keyboard": false, "show": true});
      fnc_clear_form($form_role);
      $role_modaltitle.text('Registrar rol');
      flagnew_role=true;
      roleid=0;    
    });

    $(document).on('click','.btn-editmodal-role',fnc_get_role);
    $(document).on('click','.btn-deletemodal-role',fnc_modaldelete_role);
    $btn_acceptdelete_role.on('click',fnc_delete_role);

    //***Init Datatable roles***
    datatable=fnc_datatable_role($datatable_role);

    //***Validation form role***
    fnc_validation_role($form_role);  
}
/*****************************************************************************************************************************************************************************/
function fnc_datatable_role(_datatable){

  $('#spinner-loading').show();  
  var datatable= _datatable.DataTable({
            "ajax":
             {
                "dataSrc": "Data",
                "type"   : "POST",
                "url"    : "get-all-roles",
                "data"   : function( d ) {
                  d.role_id= 0;
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
                    { "data":"RoleId", "title": "Rol ID" ,"sClass": "text-center"},
                    { "data":"RoleName", "title": "Rol" ,"sClass": "text-center"},
                    {//Column de botones
                      "title": "Opciones","data":null,
                        "mRender": function(data, type, full) {
                            return '<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-editmodal-role" data-id="'+data['RoleId']+'"><i class="fa fa-edit"></i></a>'
                                  +'<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-deletemodal-role" data-id="'+data['RoleId']+'" data-name="'+data['RoleName']+'"><i class="fa fa-trash"></i></a>';
                        }
                    }
                ],
                "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {

                  //ADD TOOLTIP NEW ELEMENT CREATED
                  $('.btn-editmodal-role', nRow).tooltip({html: true, title: 'Editar rol'});
                  $('.btn-deletemodal-role', nRow).tooltip({html: true, title: 'Eliminar rol'});
                }
        });
  return datatable;
}
/*****************************************************************************************************************************************************************************/
function fnc_clear_form(_form) {

  _form.trigger("reset");
}
/*****************************************************************************************************************************************************************************/
function fnc_validation_role(_form) {

  var error2 = $('.alert-danger', _form);
  var success2 = $('.alert-success', _form);

  _form.validate({
    errorElement: 'span', 
    errorClass: 'help-block help-block-error', 
    focusInvalid: false, 
    ignore: "",
    rules: {
      txtrole: {
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
      fnc_set_role ();
      error2.hide();
    }
  });
}
/*****************************************************************************************************************************************************************************/
function fnc_set_role() {
  
  var data={};
  data.txt_rolename =  $txtrole.val();
  data.roleid       =  roleid;
    
  var url_role = flagnew_role!=true?"update-role":"insert-role";
  $.ajax({
    type: "POST",
    url: url_role,
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
            $modal_role.modal('hide');
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
function fnc_get_role() {

  flagnew_role=false;
  var data={};
  data.roleid   =  $(this).attr('data-id');

  $.ajax({
    type: "POST",
    url: "get-role-by-roleid",
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

        $role_modaltitle.text('Editar rol');

        $txtrole.val(resp.RoleName);

        fnc_modal_events();
        $modal_role.modal({"backdrop": "static","keyboard": false, "show": true});
        $('#spinner-loading').hide();
        roleid=resp.RoleId;

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
function fnc_modaldelete_role() {

  fnc_modal_events();
  $modal_role_message.modal({"backdrop": "static","keyboard": false, "show": true});
  var roleid   =  $(this).attr('data-id');
  var rolename =  $(this).attr('data-name');
  $('#span-role-name').text(rolename);
  $btn_acceptdelete_role.attr({'data-id':roleid});
}
/*****************************************************************************************************************************************************************************/
function fnc_delete_role() {

  var data={};
  data.roleid   =  $(this).attr('data-id');
  console.log(data.roleid);

  $.ajax({
    type: "POST",
    url: "delete-role",
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
            $modal_role_message.modal('hide');
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