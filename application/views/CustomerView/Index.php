 <!--BEGIN DASHBOARD STATS -->
<!-- BEGIN PAGE HEADER-->
<h3 class="page-title">Registro de cliente</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li>
			<i class="fa fa-home"></i>
			<a href="<?=base_url();?>">Inicio</a>
			<i class="fa fa-angle-right"></i>
			<i class="icon-grid"></i>
			<a href="javascritp:void(0);">Cliente</a>
			<i class="fa fa-angle-right"></i>
			<a href="javascritp:void(0);">Registro de cliente</a>
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
					<i class="fa fa-customers"></i>CLIENTES <span id="span-title-digit"></span>
				</div>
				<div class="tools">
					<button type="button" class="btn btn-default tooltips" id="btn-callmodal-customer" data-container="body" data-placement="top" data-original-title="Agregar Cronograma">
					<i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar
					</button>
				</div>
			</div>
			<div class="portlet-body">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="input-group group-design">
							<span class="input-group-addon">
								<i class="fa fa-sort-numeric-asc"></i>
							</span>
							<select class="form-control" id="cbo-digit">
								<option value=""></option>
							</select>
						</div> 
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="input-group group-design">
							<span class="input-group-addon">
								<i class="fa fa-circle"></i>
							</span>
							<select class="form-control" id="cbo-customer-status">
								<option value=""></option>
							</select>
						</div> 
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="input-group group-design">
							<span class="input-group-addon">
								<i class="fa fa-book"></i>
							</span>
							<select class="form-control" id="cbo-regtrib1">
								<option value=""></option>
							</select>
						</div> 
					</div>
					<div class="col-lg-3 col-md-3 col-sm-6">
						<div class="input-group group-design">
							<span class="input-group-addon">
								<i class="fa fa-book"></i>
							</span>
							<select class="form-control" id="cbo-regtrib2">
								<option value=""></option>
							</select>
						</div> 
					</div>
				</div><br><br>
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
					<h4 class="modal-title">REGISTRAR CLIENTE</h4>
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
									<div class="text-left col-md-4"><label class="control-label">Nombre:</label></div>
									<div class="col-md-8">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtcustomer"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">R.U.C:</label></div>
									<div class="col-md-8">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtruc"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Usuario SOL:</label></div>
									<div class="col-md-8">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtusersol"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Clave SOL:</label></div>
									<div class="col-md-8">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtpasswordsol"/>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Dirección:</label></div>
									<div class="col-md-8">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtaddress"/>
										</div>
									</div>
								</div>	
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Teléfono(s):</label></div>
									<div class="col-md-8">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtphone"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Email:</label></div>
									<div class="col-md-8">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtemail"/>
										</div>
									</div>
								</div>															
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-body">								
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Rég. Tributario:</label></div>
									<div class="col-md-8">
										<select class="form-control" name="cbo-regtrib" required="">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Rég. 4ta Categ:</label></div>
									<div class="col-md-8">
										<select class="form-control" name="cbo-reg4ta" required="">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Rég. 5ta Categ:</label></div>
									<div class="col-md-8">
										<select class="form-control" name="cbo-reg5ta" required="">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Rég. Laboral:</label></div>
									<div class="col-md-8">
										<select class="form-control" name="cbo-reglab" required="">
											<option value=""></option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Fecha Ingreso:</label></div>
									<div class="col-md-8">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtstartdate"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-4"><label class="control-label">Estado:</label></div>
									<div class="col-md-8">										
										<select class="form-control" id="cbo-status" required="">
										<option value=""></option>
										</select>
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

<!-- BEGIN MODAL MESSAGE-->
<div id="modal-customer-message" class="modal fade bs-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">Confirmación</h4>
			</div>
			<div class="modal-body">¿Desea eliminar al  cliente (<b><span id="span-customer-name"></span></b>)?</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">Cancelar</button>
				<button type="button" id="btn-acceptdelete-customer" class="btn btn-primary">Aceptar</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- END MODAL MESSAGE-->