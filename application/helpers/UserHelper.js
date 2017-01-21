/*****************************************************************************************************************************************************************************/
$(document).ready(InitUser);
/******************************************************************************************************************************************************************************/
var $datatable_user      =   $('#datatable-user');
var $responsive      =   $('#responsive');
var $btn_callmodal_user      =   $('#btn-callmodal-user');

/******************************************************************************************************************************************************************************/
function InitUser()
{     
    var columns=[
    { "title": "Nro" },
    { "title": "Foto" },
    { "title": "Usuario" },
    { "title": "Nombre(s)" },
    { "title": "Apellido(s)" },
    { "title": "Fecha de Nacimiento"},
    { "title": "Teléfono"},
    { "title": "E-mail"},
    { "title": "Estado"}];

    $btn_callmodal_user.on('click',{ param: $responsive }, fnc_modal_init);

    //fnc_datatable($datatable_user,columns,"get-all-users");

    $datatable_user.DataTable({
            'ajax':
             {
                "dataSrc": "Data",
                "type"   : "POST",
                "url"    : "get-all-users",
                "data": {
                "cmd" : "refresh",
                // "from": $("#from-date")+" "+$("#from-time").val(),
                // "to"  : $("#to-date").val()+" "+$("#to-time").val()
                }
              },
              "bLengthChange" : false,
              "processing": true,
              "language": {
                "url": "http://cdn.datatables.net/plug-ins/1.10.13/i18n/Spanish.json"
              },
            // sDom:'rtp',
            // sort:false,
            // paginate:false,
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
                    {//Column de botones
                      title: "Opciones",sClass: "text-center",
                        "mRender": function(data, type, full) {

                            return '<div class="btn-group btn-group-circle btn-group-solid">'
                                    +'<button type="button" class="btn default grey-cascade-stripe"><i class="fa fa-edit"></i> Editar</button>'
                                    +' <button type="button" class="btn default grey-cascade-stripe"><i class="fa fa-trash"></i> Eliminar</button>'
                                    +'</div>';
                        }
                    }
                ],// definen reglas por cada columna[8]
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