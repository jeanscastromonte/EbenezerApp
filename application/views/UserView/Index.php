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
					<i class="fa fa-users"></i>Usuarios
				</div>
				<div class="tools">
				</div>
			</div>
			<div class="portlet-body">
				<button type="button" class="btn btn-circle btn-primary" id="btn-callmodal-user">
					<i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar
				</button>	

				<!-- <i class="fa fa-spinner fa-spin fa-3x color-spinner"></i> -->

				<table class="table table-striped table-bordered table-hover" id="datatable-user">					
				</table>
			</div>
		</div>
		<!-- END EXAMPLE TABLE PORTLET-->
	</div>
</div>
<!-- END PAGE CONTENT-->

<div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
												<h4 class="modal-title">Responsive & Scrollable</h4>
											</div>
											<div class="modal-body">
												<div class="scroller" style="height:300px" data-always-visible="1" data-rail-visible1="1">
													<div class="row">
														<div class="col-md-6">
															<h4>Some Input</h4>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
														</div>
														<div class="col-md-6">
															<h4>Some More Input</h4>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
															<p>
																<input type="text" class="col-md-12 form-control">
															</p>
														</div>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" data-dismiss="modal" class="btn default">Close</button>
												<button type="button" class="btn green">Save changes</button>
											</div>
										</div>
									</div>
								</div>