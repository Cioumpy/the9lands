<?php
class Backoffice extends CI_Controller {


	public function __construct() {
		parent::__construct();
		$this->load->model('session_model');
		$this->load->helper('url_helper');
	}

	public function accounts() {
		$this->load->helper('form');
    $this->load->library('form_validation');

		$this->form_validation->set_rules('first_name', 'First Name', 'required');
    $this->form_validation->set_rules('last_name', 'Last Name', 'required');
		$this->form_validation->set_rules('email', 'Email Address', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');

    if ($this->form_validation->run() !== FALSE)
		{
      $this->session_model->create_account();
    }

		$data['title'] = 'Accounts';
		$data['accounts'] = $this->session_model->get_accounts();

		$data['first_name_label'] = 'First Name';
		$data['first_name'] = array(
	    'type'  => 'text',
	    'name'  => 'first_name',
	    'id'    => 'first_name',
	    'required' => 'required'
		);
		$data['last_name_label'] = 'Last Name';
		$data['last_name'] = array(
	    'type'  => 'text',
	    'name'  => 'last_name',
	    'id'    => 'last_name',
	    'required' => 'required'
		);
		$data['email_label'] = 'Email Address';
		$data['email'] = array(
	    'type'  => 'email',
	    'name'  => 'email',
	    'id'    => 'email',
	    'required' => 'required'
		);
		$data['password_label'] = 'Password';
		$data['password'] = array(
	    'type'  => 'password',
	    'name'  => 'password',
	    'id'    => 'password',
	    'required' => 'required'
		);


		$this->load->view('backoffice/templates/header', $data);
		$this->load->view('backoffice/accounts', $data);
		$this->load->view('backoffice/templates/footer');
	}

}
