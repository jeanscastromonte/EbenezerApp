 <!--BEGIN DASHBOARD STATS -->
<!-- BEGIN PAGE HEADER-->
<h3 class="page-title">Roles</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li>
			<i class="fa fa-home"></i>
			<a href="javascritp:void(0);">Registro de Roles</a>
			<!-- <i class="fa fa-angle-right"></i> -->
		</li>
	</ul>
</div>

<!-- END PAGE HEADER-->

<!-- BEGIN PAGE CONTENT-->
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN EXAMPLE TABLE PORTLET-->
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-roles"></i>Roles
				</div>
				<div class="tools">
					<button type="button" class="btn btn-default tooltips" id="btn-callmodal-role" data-container="body" data-placement="top" data-original-title="Agregar Cronograma">
					<i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar
					</button>
				</div>
			</div>
			<div class="portlet-body">
				<!-- <div class="text-center" id="spinner-loading" hidden="hidden">
					<i class="fa fa-spinner fa-spin fa-3x color-spinner"></i>&nbsp;Cargando...
				</div> -->

				<table class="table table-striped table-bordered table-hover" id="datatable-role">					
				</table>	
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
<!-- END PAGE CONTENT-->


<!-- BEGIN MODAL ROL-->
<div id="modal-role" class="modal fade bs-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<form role="form" class="form-horizontal" id="form-role" onsubmit="return false">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h4 class="modal-title">Registrar Rol</h4>
				</div>
				<div class="modal-body">
					<div class="modal-msj-alert"></div>
					<div class="alertform alert alert-danger display-hide">
					<button class="close" data-close="alert"></button>
					Usted tiene algunos errores. Por favor, compruebe a continuación.
					</div>
					<div class="alertform alert alert-success display-hide">
					<button class="close" data-close="alert"></button>	
					Su validación de formulario es exitosa!
					</div>	
					<div class="row">
						<div class="col-md-12">
							<div class="form-body">
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Rol:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtrole"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Estado:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="checkbox" checked id="chck-status">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn default">Cancelar</button>
					<button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;&nbsp;Guardar</button>
				</div>
			</form>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- END MODAL MESSAGE-->

<!-- BEGIN MODAL MESSAGE-->
<div id="modal-role-message" class="modal fade bs-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">Confirmación</h4>
			</div>
			<div class="modal-body">¿Desea eliminar al  Rol (<b><span id="span-role-name"></span></b>)?</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">Cancelar</button>
				<button type="button" id="btn-acceptdelete-role" class="btn btn-primary">Aceptar</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- END MODAL MESSAGE-->