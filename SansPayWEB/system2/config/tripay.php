<?php

/**
*	TriPay Confirguration
*
*	If you don't have an account, please register first
*	in https://tripay.co.id.
*
**/

return [
    
    /**
	*
	*	TriPay API URL
	*
	**/
    
    'api_baseurl'   => 'https://tripay.co.id/api/v2',

	/**
	*
	*	Enter your API Key
	*
	*	To get your API Key, please go to:
	*	https://cekmutasi.co.id/app/integration
	*
	**/

	'api_key'	=> env('TRIPAY_API_KEY', 'your_api_key_here'),

	/**
	*
	*	Enter your API Signature
	*
	*	To get your API Signature, please go to:
	*	https://cekmutasi.co.id/app/integration
	*
	**/

	'pin'	=> env('TRIPAY_PIN', 'your_pin_here')

];