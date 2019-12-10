<?php
class Backoffice extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('session_model');
		$this->load->helper('url_helper');
		$this->load->helper('form');
		$this->load->library('form_validation');

		// TODO: Check for soft-login cookies.

	}


	/**
	 *	<h1>Accounts Page</h1>
	 *
	 *	<p>Displays the Accounts Page.</p>
	 *
	 *	@author Stefano Sellone
	 */
	public function accounts()
	{
		if ($this->session_model->has_user_role('admin')) {
			if (!file_exists(APPPATH.'views/backoffice/accounts.php')){
				// Whoops, we don't have a page for that!
				show_404();
			}

			$data['controller'] = 'backoffice';
			$data['page'] = 'accounts';
			$data['title'] = 'The Nine Lands Backoffice';
			$data['subtitle'] = 'Accounts';
			$data['accounts'] = $this->session_model->get_accounts();

			$data['create_account'] = array(
				'first_name' => array(
					'type'  => 'text',
					'name'  => 'first_name',
					'id'    => 'create_first_name',
					'required' => 'required',
					'label' => 'First Name',
				),
				'last_name' => array(
					'type'  => 'text',
					'name'  => 'last_name',
					'id'    => 'create_last_name',
					'required' => 'required',
					'label' => 'Last Name',
				),
				'email' => array(
					'type'  => 'text',
					'name'  => 'email',
					'id'    => 'create_email',
					'required' => 'required',
					'autocomplete' => 'username',
					'label' => 'Email Address',
				),
				'password' => array(
					'type'  => 'text',
					'name'  => 'password',
					'id'    => 'create_password',
					'required' => 'required',
					'autocomplete' => 'new-password',
					'label' => 'Password',
				),
				'role' => array(
					'name'  => 'role',
					'id'    => 'create_role',
					'label' => 'Role',
					'options' => array(
						'user' => 'User',
						'admin' => 'Administrator',
					),
					'selected' => 'user',
				),
			);

			$data['update_account'] = array(
				'first_name' => array(
					'type'  => 'text',
					'name'  => 'first_name',
					'id'    => 'update_first_name',
					'required' => 'required',
					'label' => 'First Name',
				),
				'last_name' => array(
					'type'  => 'text',
					'name'  => 'last_name',
					'id'    => 'update_last_name',
					'required' => 'required',
					'label' => 'Last Name',
				),
				'email' => array(
					'type'  => 'text',
					'name'  => 'email',
					'id'    => 'update_email',
					'required' => 'required',
					'disabled' => 'disabled',
					'autocomplete' => 'username',
					'label' => 'Email Address',
				),
				'password' => array(
					'type'  => 'password',
					'name'  => 'password',
					'id'    => 'update_password',
					'required' => 'required',
					'autocomplete' => 'new-password',
					'label' => 'New Password',
				),
				'role' => array(
					'name'  => 'role',
					'id'    => 'update_role',
					'label' => 'Role',
					'options' => array(
						'user' => 'User',
						'admin' => 'Administrator',
					),
					'selected' => 'user',
				),
			);

			$this->load->view('templates/header', $data);
			$this->load->view('backoffice/templates/navbar', $data);
			$this->load->view($data['controller'] . '/' . $data['page'], $data);
			$this->load->view('templates/footer', $data);
		}
		else {
			redirect('');
		}

	}

	/**
	 *	<h2>Create Account</h2>
	 *
	 *	<p>The form to create a new account.<br />
	 *	On submit, it creates an account and redirects again to the Accounts page.</p>
	 *
	 *	@author Stefano Sellone
	 */
	public function create_account()
	{
		$this->form_validation->set_rules('first_name', 'First Name', 'required');
		$this->form_validation->set_rules('last_name', 'Last Name', 'required');
		$this->form_validation->set_rules('email', 'Email Address', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');

		if ($this->form_validation->run() !== FALSE)
		{
			$this->session_model->create_account();
		}
		redirect('backoffice/accounts', 'refresh');
	}

	public function delete_account()
	{
		$this->session_model->delete_account();
		redirect('backoffice/accounts', 'refresh');
	}

	public function update_account()
	{
		$this->form_validation->set_rules('first_name', 'First Name', 'required');
		$this->form_validation->set_rules('last_name', 'Last Name', 'required');
		$this->form_validation->set_rules('email', 'Email Address', 'required');
		$this->form_validation->set_rules('password', 'New Password', 'required');

		if ($this->form_validation->run() !== FALSE)
		{
			$this->session_model->update_account();
		}
		redirect('backoffice/accounts', 'refresh');
	}

}
