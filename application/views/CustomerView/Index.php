 <!--BEGIN DASHBOARD STATS -->
<!-- BEGIN PAGE HEADER-->
<h3 class="page-title">Clientes</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li>
			<i class="fa fa-home"></i>
			<a href="javascritp:void(0);">Registro de Clientes</a>
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
					<i class="fa fa-customers"></i>Clientes
				</div>
				<div class="tools">
					<button type="button" class="btn btn-default tooltips" id="btn-callmodal-customer" data-container="body" data-placement="top" data-original-title="Agregar Cronograma">
					<i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar
					</button>
				</div>
			</div>
			<div class="portlet-body">
				<div class="row">
					<div class="col-md-2">
						<div class="input-group group-design">
							<span class="input-group-addon">
								<i class="fa fa-sort-numeric-asc"></i>
							</span>
							<select class="form-control" id="cbo-digit">
								<option value=""></option>
							</select>
						</div> 
					</div>
					<div class="col-md-2">
						<div class="input-group group-design">
							<span class="input-group-addon">
								<i class="fa fa-question"></i>
							</span>
							<select class="form-control" id="cbo-customer-status">
								<option value=""></option>
							</select>
						</div> 
					</div>

					<div class="col-md-3" style="padding-top: 5px;">
						<div class="input-icon">
							<i class="fa"></i>
							<input type="checkbox" checked id="chck-date-period">
						</div>									
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<table class="table table-striped table-bordered table-hover" id="datatable-customer">					
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
<!-- END PAGE CONTENT-->

<!-- BEGIN MODAL CUSTOMER-->
<div id="modal-customer" class="modal fade bs-modal-lg" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg">		
		<div class="modal-content">
			<form role="form" class="form-horizontal" id="form-customer" onsubmit="return false">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h4 class="modal-title">Registrar Cliente</h4>
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
											<input type="text" class="form-control" name="txtcustomer"/>
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
<!-- END MODAL CUSTOMER-->