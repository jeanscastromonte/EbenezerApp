/*****************************************************************************************************************************************************************************/
$(document).ready(InitUser);
/******************************************************************************************************************************************************************************/
function InitUser()
{
    //Private variables
    var $datatable_user       =   $('#datatable-user');
    var $responsive           =   $('#responsive');
    var $btn_callmodal_user   =   $('#btn-callmodal-user');
    var $form_user            =   $('#form-user');
    var $cbo_role             =   $('#cbo-role');
    var $chck_status          =   $('#chck-status');

    //Call Modal User 
    $btn_callmodal_user.on('click',{ param: $responsive }, fnc_modal_init);

    //Init Datatable users
    fnc_datatable_user($datatable_user);

    //Validation form user
    fnc_form_validation($form_user);

    //Select2 roles
    fnc_select2_roles($cbo_role)
    
    $chck_status.bootstrapSwitch({onText:'&nbsp;&nbsp;Activo&nbsp;&nbsp;',offText:'&nbsp;&nbsp;Inactivo&nbsp;&nbsp;',onColor: 'success',offColor:'danger'});

   // $(document).on('click','.btn-editmodal-user', function () {        
   // });

    // $('.select2').on('change', function() {
    //     $(this).valid();
    // });
    $('[name=txtbirthday]').datepicker();
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
                                  +'<a href="javascript:void(0);" class="btn btn-circle btn-icon-only red btn-deletemodal-user"><i class="fa fa-trash"></i></a>';
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