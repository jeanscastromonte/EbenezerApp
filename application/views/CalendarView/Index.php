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
				<div class="col-md-3 row">
					<div class="input-group group-design">
						<span class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</span>
						<input class="form-control" placeholder="Periodo"  name="txtperiod" type="text">
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

<!-- BEGIN MODAL SCHEDULE-->
<div id="modal-schedule" class="modal fade bs-modal-lg" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg">		
		<div class="modal-content">
			<form role="form" class="form-horizontal" id="form-schedule" onsubmit="return false">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h4 class="modal-title">Registrar Cronograma</h4>
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
									<div class="text-left col-md-5"><label class="control-label">Periodo:</label></div>
									<div class="col-md-7">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtperiod2"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-5"><label class="control-label">Dígito:</label></div>
									<div class="col-md-7">
										<select class="form-control" name="cbo-digit" required="">
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
									</select>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-5"><label class="control-label">Fecha Vencimiento:</label></div>
									<div class="col-md-7">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="date" class="form-control" name="txtduedate"/>
										</div>
									</div>
								</div>																
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<div class="text-left col-md-5"><label class="control-label">Fecha Programada:</label></div>
								<div class="col-md-7">
									<div class="input-icon right">
										<i class="fa"></i>
										<input type="text" class="form-control" name="txtscheduleddate"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="text-left col-md-5"><label class="control-label">Hora Programada:</label></div>
								<div class="col-md-7">
									<div class="input-icon">
										<i class="fa"></i>
										<input type="text" class="form-control" name="txtscheduledtime"/>
									</div>
								</div>
							</div><!-- 
							<div class="form-group">
								<div class="text-left col-md-5"><label class="control-label">Frecuencia:</label></div>
								<div class="col-md-7">
									<div class="input-icon right">
										<i class="fa"></i>
										<input type="text" class="form-control" name="txtfrecuency"/>
									</div>
								</div>
							</div> -->
							<div class="form-body">
								<div class="form-group">
									<div class="text-left col-md-5"><label class="control-label">Estado:</label></div>
									<div class="col-md-7">
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
<!-- END MODAL SCHEDULE-->

<!-- BEGIN MODAL MESSAGE-->
<div id="modal-message" class="modal fade bs-modal-sm" id="small" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title">Modal Title</h4>
			</div>
			<div class="modal-body"> Modal body goes here </div>
			<div class="modal-footer">
				<button type="button" class="btn dark btn-outline" data-dismiss="modal">Close</button>
				<button type="button" class="btn green">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- END MODAL MESSAGE-->