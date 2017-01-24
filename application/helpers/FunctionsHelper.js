
/******************************************************************************************************************************************************************************/
function fnc_clear_input () 
{
    $('input[type="text"],input[type="password"],input[type="email"],textarea').val('');
    $('input[type="checkbox"]').removeAttr('checked');  
}
/******************************************************************************************************************************************************************************/
// function fnc_datatable_columns(_datatable,_columns)
// {
//     return _datatable.DataTable({"pageLength": 10,"aoColumns": _columns,
//                 responsive: {
//                     details: {
//                         renderer: function ( api, rowIdx ) {
//                             var data = api.cells( rowIdx, ':hidden' ).eq(0).map( function ( cell ) {
//                                 var header = $( api.column( cell.column ).header() );
//                                 return '<tr>'+
//                                 '<td><b>'+
//                                 header.text()+':'+
//                                 '</b></td> '+
//                                 '<td align="left">'+
//                                 api.cell( cell ).data()+
//                                 '</td>'+ 
//                                 '</tr>';
//                             } ).toArray().join('');

//                             return data ?
//                             $('<table/>').append( data ) :
//                             false;
//                         }
//                     }
//                 }
//             });
// }
/******************************************************************************************************************************************************************************/
// function fnc_datatable(_datatable,_columns,_url)
// {
   
//     _datatable.DataTable({
//     "language": {
//         "processing": "Cargando...",
//         "lengthMenu": "_MENU_ Record por pagina",
//         "zeroRecords": "No se encontró ningún dato",
//         "info": "Página _PAGE_ de _PAGES_",
//         "infoEmpty": "No existen datos",
//         "infoFiltered": "(Filtrado de _MAX_ registros)",
//         "search":"Buscar",
//         "paginate": {
//             "previous": "Anterior",
//             "next": "Siguiente"
//             }
//         },
//         "bLengthChange" : false,
//         "columns": _columns,
//         "processing": true,
//         "serverSide": true,

//         "ajax": {
//             "url": _url,
//             "type": "POST",
//             // "data": {
//             //     "cmd" : "refresh",
//             //     "from": $("#from-date")+" "+$("#from-time").val(),
//             //     "to"  : $("#to-date").val()+" "+$("#to-time").val()
//             // }
//         }
//     });
// }
/******************************************************************************************************************************************************************************/
function fnc_select2 (_select,_placeholder)
{
    _select.html('<option></option>');
    _select.select2({
        placeholder: _placeholder,
        allowClear: true
    });

}
/******************************************************************************************************************************************************************************/
function fnc_tooltip ()
{
    $('[data-toggle="tooltip"]').each(function() {
        var animate = $(this).attr("data-animate");
        var colorclass = $(this).attr("data-color-class");
        $(this).tooltip({
            template: '<div class="tooltip ' + animate + ' ' + colorclass + '"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
        });
     });
}
/******************************************************************************************************************************************************************************/
function fnc_modal_init(event)
{
    fnc_modal_events();

    var _modal=event.data.param;   
   _modal.modal({"backdrop": "static","keyboard": false, "show": true});  
    
   
     
}

function fnc_modal_events()
{
   

  $(".has-error").removeClass("has-error");
  $(".fa-warning").removeClass("fa-warning");
  $(".alertform").hide();

    fnc_modal_mouseup();
    fnc_modal_initposition();

     $('.modal').on('show.bs.modal', fnc_modal_show)
    .on('mousedown','.modal-header',fnc_modal_mousedown)
    .on('mouseup','.modal-header',fnc_modal_mouseup)
    .on('mouseover','.modal-header',fnc_modal_mouseup);

    $('.modal-dialog').draggable({handle: ".modal-header",containment: 'body',});
    $('.modal-header').css('cursor','move');
}

function fnc_modal_mousedown()
{
    $('.modal-content').addClass('opacity');
}

function fnc_modal_mouseup()
{
    $('.modal-content').removeClass('opacity');
}

function fnc_modal_show()
{

    $(this).data({'originalLeft': $('.modal-dialog').css('left'), 'origionalTop': $('.modal-dialog').css('top')});
     
}

function fnc_modal_initposition()
{
    $('.modal-dialog').css({'left': $('.modal').data('originalLeft'), 'top': $('.modal').data('origionalTop')});
}
/******************************************************************************************************************************************************************************/

function fnc_form_validation(_form)
{
        // for more info visit the official plugin documentation: 
            // http://docs.jquery.com/Plugins/Validation

            //var form2 = $('#form_sample_2');
            var error2 = $('.alert-danger', _form);
            var success2 = $('.alert-success', _form);

            _form.validate({
                lang: 'fi',
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                ignore: "",  // validate all fields including form hidden input
                rules: {
                    txtuser: {
                        minlength: 2,
                        required: true
                    },
                    txtpassword: {
                        minlength: 2,
                        required: true
                    },
                    txtname: {
                        minlength: 2,
                        required: true
                    },
                    txtlastname: {
                        minlength: 2,
                        required: true
                    },
                    txtbirthday: {
                        minlength: 2,
                        required: true
                    },
                    txttelephone: {
                        minlength: 2,
                        required: true
                    },
                    txtemail: {
                        minlength: 2,
                        required: true
                    },
                    txtimage: {
                        minlength: 2,
                        required: true
                    },
                    // email: {
                    //     required: true,
                    //     email: true
                    // },
                    // email: {
                    //     required: true,
                    //     email: true
                    // },
                    // url: {
                    //     required: true,
                    //     url: true
                    // },
                    // number: {
                    //     required: true,
                    //     number: true
                    // },
                    // digits: {
                    //     required: true,
                    //     digits: true
                    // },
                    // creditcard: {
                    //     required: true,
                    //     creditcard: true
                    // },
                },

                invalidHandler: function (event, validator) { //display error alert on form submit              
                    success2.hide();
                    error2.show();
                    Metronic.scrollTo(error2, -200);
                },

                errorPlacement: function (error, element) { // render error placement for each input type
                    var icon = $(element).parent('.input-icon').children('i');
                    icon.removeClass('fa-check').addClass("fa-warning");  
                    icon.attr("data-original-title", error.text()).tooltip({'container': 'body'});
                },

                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.form-group').removeClass("has-success").addClass('has-error'); // set error class to the control group   
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    
                },

                success: function (label, element) {
                    var icon = $(element).parent('.input-icon').children('i');
                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
                    icon.removeClass("fa-warning").addClass("fa-check");
                },

                submitHandler: function (form) {
                    success2.show();
                    error2.hide();
                    //form[0].submit(); // submit the form
                }
            }).resetForm();


    }
/******************************************************************************************************************************************************************************/