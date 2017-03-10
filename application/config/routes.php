<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] 	= 'MasterController';
$route['404_override'] 			= '';
$route['translate_uri_dashes']	= FALSE;

/*********************************************************************/
$route['login-user'] 		= 'UserController/login_user';
/*********************************************************************/
$route['register-sale'] 	= 'SaleController/sale_view';
/*********************************************************************/
$route['register-user'] 	= 'UserController/user_view';

$route['get-all-users'] 	= 'UserController/get_all_users';
$route['get-all-roles'] 	= 'UserController/get_all_roles';
$route['get-user-by-userid'] 	= 'UserController/get_user_by_userid';
$route['insert-user'] 		= 'UserController/insert_user';
/*********************************************************************/
$route['sunat-schedule'] 	= 'CalendarController/schedule_view';

$route['get-schedule-sunat'] = 'CalendarController/get_schedule_sunat';
$route['set-schedule-sunat'] = 'CalendarController/set_schedule_sunat';
$route['get-schedule-alert'] = 'CalendarController/get_schedule_alert';
$route['update-complete-schedule'] = 'CalendarController/update_complete_schedule';
$route['get-schedule-year-sunat'] = 'CalendarController/get_schedule_year_sunat';

$route['get-schedule-sunat-byperioddigit'] = 'CalendarController/get_schedule_sunat_byperioddigit';
$route['update-schedule-sunat'] = 'CalendarController/update_schedule_sunat';
$route['delete-schedule-sunat'] = 'CalendarController/delete_schedule_sunat';
/*********************************************************************/
$route['register-customer'] 	= 'CustomerController/customer_view';
$route['get-all-customer'] 	= 'CustomerController/get_all_customer';
/*********************************************************************/