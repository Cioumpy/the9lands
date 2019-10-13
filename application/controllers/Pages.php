<?php
class Pages extends CI_Controller {

	public function __constructor()
	{
		parent::__constructor();
		$this->load->model('session_model');
	}

	public $MY_SESSION = $this->session_model->_check_session();

  public function view($page = 'home'){

		// If the user is not logged in, go to the login page
		if (( ! $my_session) OR ($page === 'index')) {
			$this->load->helper('form');
	    $this->load->library('form_validation');

	    $this->form_validation->set_rules('uname', 'USERNAME', 'required');
	    $this->form_validation->set_rules('pwd', 'PASSWORD', 'required');

			$page = 'index';
			if ($this->form_validation->run() === TRUE)
			{
				$page = 'home';
				if ( ! isset($_SESSION['member'])) {
					$_SESSION['member'] = $_POST['uname'];
				}
	    }
		}

		if ( ! file_exists(APPPATH.'views/pages/'.$page.'.php')){
	    // Whoops, we don't have a page for that!
	    show_404();
	  }

	  $data['title'] = ucfirst($page); // Capitalize the first letter

	  $this->load->view('templates/header', $data);
	  $this->load->view('pages/'.$page, $data);
	  $this->load->view('templates/footer', $data);
  }

	public function login()
	{
	}

}
