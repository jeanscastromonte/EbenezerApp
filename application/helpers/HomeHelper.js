/******************************************************************************************************************************************************************************/
$(document).ready(Home);
/******************************************************************************************************************************************************************************/
var $txtUser      =   $('#txt-user-login');
var $txtPassword  =   $('#txt-password-login');
var $formLogin    =   $('#form-login');
var $messageLogin =   $('#message-login');
/******************************************************************************************************************************************************************************/
function Home ()
{     
    $txtUser.focus();
    $formLogin.on('submit',Fnc_Login);
    $(document).on('click','.module-menu',Fnc_GetSubMenu);
}
/******************************************************************************************************************************************************************************/
function Fnc_Login ()
{
    var data={};   
    data.txtUser       = $txtUser.val();
    data.txtPassword   = $txtPassword.val();   

    $.ajax({
        type: "POST",
        url: "login-user",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        // async: false,
        beforeSend: function () 
        {            
        },
        success: function (resp) 
        {  
            $messageLogin.html(resp.result);
        },
        complete: function () 
        {           
        },
        error: function(resp)
        {
        }
    });
}
/******************************************************************************************************************************************************************************/
function Fnc_GetSubMenu ()
{
    var data={};   
    data.MenuId       = $(this).attr('data-id');   

    $.ajax({
        type: "POST",
        url: "get_submenu",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        beforeSend: function () 
        {            
        },
        success: function (resp) 
        {  
           //alert('Exito!');
        },
        complete: function () 
        {           
        },
        error: function(resp)
        {
        }
    });
}
/******************************************************************************************************************************************************************************/
// function fnc_sct_usuario()
// {
//     $title_usuario.text('REGISTRAR USUARIO');
//     $btn_editar_usuario.hide();
//     $sct_tabla_u.hide();
//     $btn_registrar_usuario.show();
//     $sct_registro_u.show();

//     fnc_limpiar_campos();   

//     $cbo_personal.select2("val","");

//     $file_foto_perfil.fileinput('destroy');
//     $file_foto_perfil.fileinput({ 
//     overwriteInitial: true,
//     maxFileSize: 1500,
//     showClose: false,
//     showCaption: false,
//     browseLabel: '',
//     removeLabel: '',
//     browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
//     removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
//     elErrorContainer: '#kv-avatar-errors-1',
//     msgErrorClass: 'alert alert-block alert-danger',
//     defaultPreviewContent: '<img src="assets/images/silueta.png" alt="Your Avatar" style="width:160px">',
//     layoutTemplates: {main2: '{preview}  {remove} {browse}'},
//     allowedFileExtensions: ["jpg", "png", "gif"]
//     });
// }
// /******************************************************************************************************************************************************************************/
// function fnc_sct_volver_u()
// {
//     $sct_tabla_u.show();
//     $sct_registro_u.hide();    
// }
// /******************************************************************************************************************************************************************************/
// function fnc_registrar_usuario ()
// {
//     var inputFilePerfil         =   $file_foto_perfil[0];
//     var file_perfil             =   inputFilePerfil.files[0];
//     var data_image_p            = new FormData();
//     data_image_p.append('imagen',file_perfil)

//     $.ajax({
//         url: "subir_imagen_perfil",
//         type:'POST',
//         contentType:false,
//         data: data_image_p,
//         processData:false,
//         cache:false,
//         beforeSend: function()
//         {
//         },
//         success: function(resp)
//         {
//             var data={};    
//             data.id_personal         = parseInt($cbo_personal.val());
//             data.txt_nuevo_u         = $txt_nuevo_u.val();
//             data.txt_nuevo_p         = $txt_nuevo_p.val();
//             data.file_foto_perfil    = resp; 
//             data.txt_observacion_u   = $txt_observacion_u.val();

//             $.ajax({
//                 type: "POST",
//                 url: "registrar_usuario",
//                 data: JSON.stringify(data),
//                 contentType: "application/json; charset=utf-8",
//                 dataType: "json",
//                 async: false,
//                 beforeSend: function () 
//                 {

//                 },
//                 success: function (resp) 
//                 {  
//                     showSuccess('Se registró correctamente'); 
//                     fnc_sct_volver_u();
//                     fnc_listar_usuario();
//                 },
//                 complete: function () 
//                 {     
//                 },
//                 error: function(resp)
//                 {
//                 }
//             });
//         }
//     });
// }
// /******************************************************************************************************************************************************************************/
// function fnc_listar_usuario()
// {
//     $.getJSON("listar_usuario", function (data){ 

//     $datatable_usuario.row().clear().draw( false );
//     for (var i = 0; i<data.length;i++) 
//     {
//         $datatable_usuario.row.add([i+1,
//         data[i].nombre_completo,
//         data[i].nombre_usuario,
//         data[i].clave_usuario,
//         data[i].estado_usuario,                
//         '<button type="button" data-idusuario="'+data[i].id_usuario+'" class="btn btn-primary btn-ver-editar-usuario"><i class="fa fa-edit"></i></button>'
//         ]).draw(false);
//     }         
//     });
// }
// /******************************************************************************************************************************************************************************/
// function fnc_ver_editar_usuario()
// {   
//     $file_foto_perfil.fileinput('destroy');

   

//     var data={};
//     data.id_usuario  = parseInt($(this).attr('data-idusuario'));

//     $.ajax({
//         type: "POST",
//         url: "obtener_usuario",
//         data: JSON.stringify(data),
//         contentType: "application/json; charset=utf-8",
//         dataType: "json",
//         async: false,
//         beforeSend: function () 
//         {
//         },
//         success: function (resp) 
//         {
//             if(resp.estado_usuario==1)
//            {$chck_estado_usuario.bootstrapSwitch('state', true, true)}
//            else
//            {$chck_estado_usuario.bootstrapSwitch('state', false, false)}

//             var img_foto=false;
//             $sct_tabla_u.hide();
//             $sct_registro_u.show();
//             $title_usuario.html('EDITAR USUARIO');   
//             $btn_registrar_usuario.hide();
//             $btn_editar_usuario.show();

//             $btn_editar_usuario.attr('data-idusuario',resp.id_usuario); 
//             $txt_nuevo_u.val(resp.nombre_usuario);
//             $txt_nuevo_p.val(resp.clave_usuario);
//             $txt_observacion_u.val(resp.observaciones_usuario);
//             //$id_cargo.val(resp.id_cargo);
            
//             $cbo_personal.val(resp.id_personal).trigger("change");

//             if(resp.foto_usuario!=null && resp.foto_usuario!=" ")
//             {
//                 img_foto="<img src='"+resp.foto_usuario+"' class='kv-preview-data file-preview-image' style='width: 100%' alt='Desert' title='Desert'>";   
//             }


//             $file_foto_perfil.fileinput({
//             overwriteInitial: true,
//             maxFileSize: 1500,
//             showClose: false,
//             showCaption: false,
//             browseLabel: '',
//             removeLabel: '',
//             browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
//             removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
//             elErrorContainer: '#kv-avatar-errors-1',
//             msgErrorClass: 'alert alert-block alert-danger',
//             defaultPreviewContent: '<img src="assets/images/silueta.png" alt="Your Avatar" style="width:160px">',
//             layoutTemplates: {main2: '{preview}  {remove} {browse}'},
//             allowedFileExtensions: ["jpg", "png", "gif"],
//             initialPreview: img_foto
//             });
           
//         },
//         complete: function () 
//         {
//         },
//         error: function(resp)
//         {
//         }
//     });
// }
// /******************************************************************************************************************************************************************************/
// function fnc_editar_usuario ()
// {
//     var data={};
//     var estado;
//     if($chck_estado_usuario.is(':checked'))
//     {estado=1}
//     else
//     {estado=0}
//     data.id_usuario         = parseInt($(this).attr('data-idusuario'));    
//     data.id_personal        = parseInt($cbo_personal.val());
//     data.txt_nuevo_u        = $txt_nuevo_u.val();
//     data.txt_nuevo_p        = $txt_nuevo_p.val();
//     /*data.file_foto_perfil   = resp; */
//     data.txt_observacion_u  = $txt_observacion_u.val();
//     data.chck_estado        = parseInt(estado);


//     var inputFilePerfil         =   $file_foto_perfil[0];
//     var file_perfil             =   inputFilePerfil.files[0];
//     var data_image_p            = new FormData();
//     data_image_p.append('imagen',file_perfil)

//     $.ajax({
//         url: "subir_imagen_perfil",
//         type:'POST',
//         contentType:false,
//         data: data_image_p,
//         processData:false,
//         cache:false,
//         beforeSend: function()
//         {
//         },
//         success: function(resp)
//         {

//         data.file_foto_perfil   = resp;
//         $.ajax({
//         type: "POST",
//         url: "editar_usuario",
//         data: JSON.stringify(data),
//         contentType: "application/json; charset=utf-8",
//         dataType: "json",
//         async: false,
//         beforeSend: function () 
//         {
            
//         },
//         success: function (resp)                                                                                                                        
//         {  
//             showSuccess('Se editó correctamente'); 
//             fnc_listar_usuario();
//             fnc_sct_volver_u();
//             fnc_info_usuario();   
//         },
//         complete: function () 
//         {     
//         },
//         error: function(resp)
//         {
//         }
//     });
//         }
//     });
// }
// /******************************************************************************************************************************************************************************/