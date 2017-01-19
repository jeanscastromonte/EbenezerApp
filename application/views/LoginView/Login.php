<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGO -->
<div class="logo">
	<a href="">
	<img src="assets/img/logo-ebenezer.jpg" style="width: 20%;border-radius: 50px !important;" alt=""/>
	</a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
	<!-- BEGIN LOGIN FORM -->
	<form role="form" id="form-login" onsubmit="return false">
		<div class="form-title text-center">
			<span class="form-title">Inicio de sesión</span>
		</div>

		
		<div id="message-login"></div>

		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">Usuario</label>
			<input id="txt-user-login" type="text" class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="Usuario"/>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">Contraseña</label>
			<input id="txt-password-login" class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="Contraseña"/>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn btn-primary btn-block uppercase">Entrar</button>
		</div>
		<div class="form-actions">
			<div class="pull-left">
				<label class="rememberme check">
				<input type="checkbox" name="remember" value="1"/>Recordarme</label>
			</div>			
		</div>
	</form>
	<!-- END LOGIN FORM -->	
</div>