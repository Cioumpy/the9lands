<?php
class Pages extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('session_model');
		$this->load->helper('url_helper');
		$this->load->helper('form');
		$this->load->library('form_validation');

		// TODO: Check for soft-login cookies.
		if (!isset($_SESSION['role'])) {
			$this->session_model->set_current_user_anonymous();
		}

	}


	public function index()
	{
		if (!file_exists(APPPATH.'views/pages/index.php'))
		{
			// Whoops, we don't have a page for that!
			show_404();
		}

		$data['page'] = 'index';
		$data['title'] = 'The Nine Lands';
		$data['subtitle'] = 'd20 System Online Tabletop RPG';

		$data['login_account'] = array(
			'email' => array(
				'type'  => 'email',
				'name'  => 'email',
				'id'    => 'email',
				'required' => 'required',
				'autocomplete' => 'username',
				'label' => 'EMAIL ADDRESS',
			),
			'password' => array(
				'type'  => 'password',
				'name'  => 'password',
				'id'    => 'password',
				'required' => 'required',
				'autocomplete' => 'current-password',
				'label' => 'PASSWORD',
			),
		);

		$this->load->view('pages/index', $data);
	}

	public function login() {

		$this->form_validation->set_rules('email', 'EMAIL ADDRESS', 'required');
		$this->form_validation->set_rules('password', 'PASSWORD', 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$this->session_model->set_current_user($this->input->post('email'), $this->input->post('password'));
			redirect('');
		}
		redirect('pages/index');
	}

	public function logout() {
		$this->session->sess_destroy();
		redirect('pages/index');
	}

	public function view($page = 'home'){

		// If the user is not logged in, go to the login page
		if ($this->session_model->has_user_role('anonymous'))
		{
			redirect('pages/index');
		}

		if ( ! file_exists(APPPATH.'views/pages/'.$page.'.php'))
		{
			// Whoops, we don't have a page for that!
			show_404();
		}

		$data['page'] = $page;
		$data['title'] = 'The Nine Lands';
		$data['subtitle'] = 'd20 System Online Tabletop RPG';

		$this->load->view('pages/templates/header', $data);
		$this->load->view('pages/'.$page, $data);
		$this->load->view('pages/templates/footer', $data);
	}

}
