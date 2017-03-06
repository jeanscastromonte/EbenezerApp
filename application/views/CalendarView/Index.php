 <!--BEGIN CALENDAR STATS -->

<!-- BEGIN PAGE HEADER-->
<div class="msj-alert"></div>
<h3 class="page-title">Agenda</h3>
<div class="page-bar">
	<ul class="page-breadcrumb">
		<li>
			<i class="fa fa-home"></i>
			<a href="javascritp:void(0);">Cronograma Sunat</a>
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
					<i class="fa fa-users"></i>Cronograma Sunat
				</div>
				<div class="actions">
				</div>
				<div class="tools">
					<button type="button" class="btn btn-default tooltips" id="btn-callmodal-schedule" data-container="body" data-placement="top" data-original-title="Agregar Cronograma">
					<i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar
					</button>
				</div>
			</div>
			<div class="portlet-body">

				<div class="row">
					<div class="col-md-3">
						<div class="input-group group-design">
							<span class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</span>
							<input class="form-control" placeholder="Periodo"  name="txtperiod" type="text">
						</div> 
					</div>

					<div class="col-md-3" style="padding-top: 5px;">
						<div class="input-icon">
							<i class="fa"></i>
							<input type="checkbox" checked id="chck-date-period">
						</div>									
					</div>

					<!-- <div class="col-md-6">
						<div class="pull-right">
							<button class="btn green  btn-outline dropdown-toggle" data-toggle="dropdown">Tools
								<i class="fa fa-angle-down"></i>
							</button>
							<ul class="dropdown-menu pull-right">
								<li>
									<a href="javascript:;"><i class="fa fa-print"></i> Imprimir </a>
								</li>
								<li>
									<a href="javascript:;" id="download"><i class="fa fa-file-pdf-o"></i> Guardar en PDF </a>
								</li>
								<li>
									<a href="javascript:;"><i class="fa fa-file-excel-o"></i> Exportar en Excel </a>
								</li>
							</ul>
						</div>
						<a href="javascript:;" class="btn btn-icon-only grey-cascade">
							<i class="fa fa-print"></i>
						</a> 
					</div> -->
				</div>				

				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN TABLE SCHEDULE SUNAT -->
						<table class="table table-striped table-bordered table-hover" id="datatable-schedule">					
						</table>
						<!-- END TABLE SCHEDULE SUNAT -->
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN TABLE SCHEDULE SUNAT -->
						<table class="table table-striped table-bordered table-hover" id="datatable-schedule-year">						
						</table>
						<!-- END TABLE SCHEDULE SUNAT -->
					</div>
				</div>
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
									</select>
									</div>
								</div>
								<div class="form-group">
									<div class="text-left col-md-5"><label class="control-label">Fecha Vencimiento:</label></div>
									<div class="col-md-7">
										<div class="input-icon right">
											<i class="fa"></i>
											<input type="text" class="form-control" name="txtduedate" required="" />
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
							</div>
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
				<h4 class="modal-title">Confirmación</h4>
			</div>
			<div class="modal-body">¿Desea eliminar esta alerta?</div>
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" class="btn default">Cancelar</button>
				<button type="button" id="btn-acceptdelete-schedule" class="btn btn-primary">Aceptar</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- END MODAL MESSAGE-->