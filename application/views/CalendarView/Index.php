 <!--BEGIN DASHBOARD STATS -->
<!-- BEGIN PAGE HEADER-->
<h3 class="page-title">Agenda</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li>
			<i class="fa fa-home"></i>
			<a href="javascritp:void(0);">Cronograma Sunat</a>
			<!-- <i class="fa fa-angle-right"></i> -->
		</li>
		<!-- <li>
			<a href="javascritp:void(0);">Registro de ventas</a>
		</li> -->
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
					<i class="fa fa-users"></i>Cronograma Sunat
				</div>
				<div class="actions">
					<!-- <a href="#" class="btn btn-default btn-sm">
					<i class="fa fa-plus"></i> Add </a>
					<a href="#" class="btn btn-default btn-sm">
					<i class="fa fa-print"></i> Print </a> -->
				</div>
				<div class="tools">
					<button type="button" class="btn btn-default tooltips" id="btn-callmodal-schedule" data-container="body" data-placement="top" data-original-title="Agregar Cronograma">
					<i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar
					</button>
				</div>
			</div>
			<div class="portlet-body">
				
					<!-- <button type="button" class="btn btn-circle btn-primary tooltips" id="btn-callmodal-user" data-container="body" data-placement="top" data-original-title="Agregar usuario">
						<i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar
					</button> -->

					
						<div class="col-md-3 row">
							<div class="input-icon right">
								<i class="fa"></i>
								<input type="text" class="form-control" name="txtperiod" placeholder="Periodo" />
							</div>
						</div>

				<div class="text-center" id="spinner-loading" hidden="hidden">
					<i class="fa fa-spinner fa-spin fa-3x color-spinner"></i>&nbsp;Cargando...
				</div>
				<table class="table table-striped table-bordered table-hover" id="datatable-schedule">					
				</table>	
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
<!-- END PAGE CONTENT-->

<!-- BEGIN MODAL USER-->
<div id="modal-schedule" class="modal fade bs-modal-lg" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg">		
		<div class="modal-content">
			<form role="form" class="form-horizontal" id="form-user" onsubmit="return false">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h4 class="modal-title">Registrar Usuario</h4>
				</div>
				<div class="modal-body">
					<div class="alertform alert alert-danger display-hide">
					<button class="close" data-close="alert"></button>
					Usted tiene algunos errores. Por favor, compruebe a continuación.
					</div>
					<div class="alertform alert alert-success display-hide">
					<button class="close" data-close="alert"></button>	
					Su validación de formulario es exitosa!
					</div>	
					<div class="row">
						<div class="col-md-6">

							<div class="form-body">
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Rol:</label></div>
									<div class="col-md-9">
										<select class="form-control" id="cbo-role" required="">
										<option value=""></option>
									</select>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Usuario:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtuser"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Contraseña:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtpassword"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Nombre(s):</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtname"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Apellidos:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtlastname"/>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-body">
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Fecha Nac:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtbirthday"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Teléfono:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txttelephone"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">E-mail(s):</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtemail"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Imagen:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtimage"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Estado:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="checkbox" checked class="make-switch" id="chck-status">
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
	</div>
</div>
<!-- END MODAL USER-->