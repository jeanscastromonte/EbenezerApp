 <!--BEGIN DASHBOARD STATS -->
<!-- BEGIN PAGE HEADER-->
<h3 class="page-title">Usuarios</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li>
			<i class="fa fa-home"></i>
			<a href="javascritp:void(0);">Registro de usuarios</a>
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
					<i class="fa fa-users"></i>Usuarios
				</div>
				<div class="tools">
					<button type="button" class="btn btn-default tooltips" id="btn-callmodal-user" data-container="body" data-placement="top" data-original-title="Agregar Cronograma">
					<i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar
					</button>
				</div>
			</div>
			<div class="portlet-body">
				<table class="table table-striped table-bordered table-hover" id="datatable-user">					
				</table>	
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
<!-- END PAGE CONTENT-->

<!-- BEGIN MODAL USER-->
<div id="modal-user" class="modal fade bs-modal-lg" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg">		
		<div class="modal-content">
			<form role="form" class="form-horizontal" id="form-user" onsubmit="return false">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h4 class="modal-title">Registrar Usuario</h4>
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
											<input type="text" class="form-control" name="txtname" style='text-transform:uppercase'/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-3"><label class="control-label">Apellidos:</label></div>
									<div class="col-md-9">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtlastname" style='text-transform:uppercase'/>
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
									<div class="col-md-9 row">										
										<div class="fileinput fileinput-new col-md-6" data-provides="fileinput" style="cursor: pointer;">
											<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 100%; height: 100px;
											/*background-image:url('assets/admin/pages/media/gallery/camera.png');*/
											background-size: 100px 100px;background-repeat: no-repeat;background-position: center;">
											</div>
											<div>
												<span hidden="">
													<input id="file-image-user" type="file" accept="image/*" required>
												</span>
												<a href="#" class="btn red fileinput-exists" data-dismiss="fileinput">
													<i class="fa fa-trash"></i> 
												</a>
											</div>
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
	</div>
</div>
<!-- END MODAL USER-->

<!-- BEGIN MODAL MESSAGE-->
<div id="modal-user-message" class="modal fade bs-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">Confirmación</h4>
			</div>
			<div class="modal-body">¿Desea eliminar al  usuario (<b><span id="span-user-name"></span></b>)?</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">Cancelar</button>
				<button type="button" id="btn-acceptdelete-user" class="btn btn-primary">Aceptar</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- END MODAL MESSAGE-->