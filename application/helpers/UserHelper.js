/*****************************************************************************************************************************************************************************/
$(document).ready(InitUser);
/******************************************************************************************************************************************************************************/
function InitUser()
{
    //Private variable
    var $datatable_user       =   $('#datatable-user');
    var $responsive           =   $('#responsive');
    var $btn_callmodal_user   =   $('#btn-callmodal-user');
    var $form_user            =   $('#form-user');
    var $cbo_role             =   $('#cbo-role');

    //Call Modal User 
    $btn_callmodal_user.on('click',{ param: $responsive }, fnc_modal_init);

    //Init Datatable users
    fnc_datatable_user($datatable_user);

    //Validation form user
    fnc_form_validation($form_user);

    //Select2 roles
    fnc_select2_roles($cbo_role)
    
$('#chck-status').bootstrapSwitch({onText:'&nbsp;&nbsp;Activo&nbsp;&nbsp;',offText:'&nbsp;&nbsp;Inactivo&nbsp;&nbsp;',onColor: 'success',offColor:'danger'});
$('.select2').on('change', function() {
    $(this).valid();
});
}
/*****************************************************************************************************************************************************************************/
function fnc_datatable_user(_datatable)
{
    $('#spinner-loading').show();  
   _datatable.DataTable({
            'ajax':
             {
                "dataSrc": "Data",
                "type"   : "POST",
                "url"    : "get-all-users",
                "data": {
                    "cmd" : "refresh"
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
            "columns": [
                    { "title": "Nro" ,sClass: "text-center"},    
                    { "title": "Foto" ,sClass: "text-center"},
                    { "title": "Usuario" ,sClass: "text-center"},
                    { "title": "Rol" ,sClass: "text-center"},
                    { "title": "Nombre(s)" ,sClass: "text-center"},
                    { "title": "Apellido(s)" ,sClass: "text-center"},
                    { "title": "Fecha de Nacimiento",sClass: "text-center"},
                    { "title": "Teléfono",sClass: "text-center"},
                    { "title": "E-mail",sClass: "text-center"},
                    { "title": "Estado",sClass: "text-center"},
                    { "title": "Opciones",sClass: "text-center",
                        "mRender": function(data, type, full) {
                            return '<div class="btn-group btn-group-circle btn-group-solid">'
                                    +'<button type="button" class="btn default grey-cascade-stripe"><i class="fa fa-edit"></i> Editar</button>'
                                    +' <button type="button" class="btn default grey-cascade-stripe"><i class="fa fa-trash"></i> Eliminar</button>'
                                    +'</div>';
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