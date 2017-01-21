
/******************************************************************************************************************************************************************************/
function fnc_clear_input () 
{
    $('input[type="text"],input[type="password"],input[type="email"],textarea').val('');
    $('input[type="checkbox"]').removeAttr('checked');  
}
/******************************************************************************************************************************************************************************/
function fnc_datatable_columns(_datatable,_columns)
{
    return _datatable.DataTable({"pageLength": 10,"aoColumns": _columns,
                responsive: {
                    details: {
                        renderer: function ( api, rowIdx ) {
                            var data = api.cells( rowIdx, ':hidden' ).eq(0).map( function ( cell ) {
                                var header = $( api.column( cell.column ).header() );
                                return '<tr>'+
                                '<td><b>'+
                                header.text()+':'+
                                '</b></td> '+
                                '<td align="left">'+
                                api.cell( cell ).data()+
                                '</td>'+ 
                                '</tr>';
                            } ).toArray().join('');

                            return data ?
                            $('<table/>').append( data ) :
                            false;
                        }
                    }
                }
            });
}
/******************************************************************************************************************************************************************************/
function fnc_datatable(_datatable,_columns,_url)
{
   
    _datatable.DataTable({
    "language": {
        "processing": "Cargando...",
        "lengthMenu": "_MENU_ Record por pagina",
        "zeroRecords": "No se encontró ningún dato",
        "info": "Página _PAGE_ de _PAGES_",
        "infoEmpty": "No existen datos",
        "infoFiltered": "(Filtrado de _MAX_ registros)",
        "search":"Buscar",
        "paginate": {
            "previous": "Anterior",
            "next": "Siguiente"
            }
        },
        "bLengthChange" : false,
        "columns": _columns,
        "processing": true,
        "serverSide": true,

        "ajax": {
            "url": _url,
            "type": "POST",
            // "data": {
            //     "cmd" : "refresh",
            //     "from": $("#from-date")+" "+$("#from-time").val(),
            //     "to"  : $("#to-date").val()+" "+$("#to-time").val()
            // }
        }
    });
}
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
/******************************************************************************************************************************************************************************/

function fnc_fill_datatable(_uri,_datatable)
{

    // var ahh=[i+1,
    //     data[i].nombre_cliente,
    //     data[i].ruc_cliente,
    //     data[i].direccion_cliente,
    //     data[i].estado_cliente,                
    //     '<button type="button" data-idcliente="'+data[i].id_cliente+'" class="btn btn-primary btn-ver-editar-cliente"><i class="fa fa-edit"></i></button>'
    //     ];
    // $.getJSON(_uri, function (data){ 

    // _datatable.row().clear().draw( false );
    // for (var i = 0; i<data.length;i++) 
    // {
    //     _datatable.row.add(ahh).draw(false);
    // }         
    // });
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
    fnc_modal_mouseup();
    fnc_modal_initposition();

     $('.modal').on('show.bs.modal', fnc_modal_show)
    .on('mousedown','.modal-header',fnc_modal_mousedown)
    .on('mouseup','.modal-header',fnc_modal_mouseup);

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