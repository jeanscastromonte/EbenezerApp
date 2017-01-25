/*****************************************************************************************************************************************************************************/
$(document).ready(InitUser);
  var $txt_period           =   $('[name=txtperiod]');
/******************************************************************************************************************************************************************************/
function InitUser()
{
    //Private variables
  var $datatable_schedule   =   $('#datatable-schedule');
  var $btn_callmodal_user   =   $('#btn-callmodal-user');
    // var $form_user            =   $('#form-user');
    // var $cbo_role             =   $('#cbo-role');
    // var $chck_status          =   $('#chck-status');

    //Call Modal User 
    // $btn_callmodal_user.on('click',{ param: $responsive }, fnc_modal_init);

    //Init Datatable users
     
     var datatable=fnc_datatable_schedule($datatable_schedule);

    //Validation form user
    // fnc_form_validation($form_user);

    //Select2 roles
    // fnc_select2_roles($cbo_role)
    
    // $chck_status.bootstrapSwitch({onText:'&nbsp;&nbsp;Activo&nbsp;&nbsp;',offText:'&nbsp;&nbsp;Inactivo&nbsp;&nbsp;',onColor: 'success',offColor:'danger'});

   // $(document).on('click','.btn-editmodal-user', function () {        
   // });

    // $('.select2').on('change', function() {
    //     $(this).valid();
    // });
    
  $txt_period.datepicker( {
    format: "MM/yyyy",
    startView: "months", 
    minViewMode: "months",
    pickTime: false,
    autoclose: true,
    language: 'es'
  }).on("changeDate", function(e) {
       //alert(holas);
      $('#spinner-loading').show();  
       datatable.ajax.reload(function (data) {
         $('#spinner-loading').hide();  
         //alert(data.Data[0].UserName);
       });
    });
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
                "url"    : "get-all-usersk",
                "data"   : function( d ) {
                  d.period= $txt_period.val()!=''?$txt_period.val():0;
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
            "aoColumns": [
                    { "data":"UserId", "title": "Dígito" ,"sClass": "text-center"},    
                    { "data":"UserImage", "title": "Fecha Vencimiento" ,"sClass": "text-center"},
                    { "data":"UserLoginName", "title": "Fecha Programada" ,"sClass": "text-center"},
                    { "data":"RoleName", "title": "Frecuencia" ,"sClass": "text-center"},
                    { "data":"UserName", "title": "Estado" ,"sClass": "text-center"},                  
                    {//Column de botones
                      "title": "Opciones","data":null,
                        "mRender": function(data, type, full) {
                            return '<a href="javascript:void(0);" class="btn btn-circle btn-icon-only blue btn-editmodal-user" data-id="'+data['UserId']+'"><i class="fa fa-edit"></i></a>'
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

                  //ADD TOOLTIP NEW ELEMENT CREATED
                  // $('.btn-editmodal-user', nRow).tooltip({html: true, title: 'Editar usuario'});
                  // $('.btn-deletemodal-user', nRow).tooltip({html: true, title: 'Eliminar usuario'});
                }
        });

   return datatable;
}
/*****************************************************************************************************************************************************************************/

/*****************************************************************************************************************************************************************************/