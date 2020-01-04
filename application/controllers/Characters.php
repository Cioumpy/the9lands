<?php
class Characters extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('session_model');
		$this->load->model('campaign_model');
		$this->load->helper('url_helper');
		$this->load->helper('form');
		$this->load->library('form_validation');

		// If the user is not logged in, go to the login page
		if (!$this->session_model->is_user_loggedin())
		{
			redirect('pages/index');
		}

	}

	public function list()
	{
		if (!file_exists(APPPATH.'views/characters/list.php'))
		{
			// Whoops, we don't have a page for that!
			show_404();
		}

		$data['controller'] = 'characters';
		$data['page'] = 'list';
		$data['title'] = 'The Nine Lands';
		$data['subtitle'] = 'd20 System Online Tabletop RPG';

		$this->load->view('templates/header', $data);
		$this->load->view($data['controller'] . '/' . $data['page'], $data);
		$this->load->view('templates/footer', $data);
	}

	public function new()
	{
		// If the user is not logged in, go to the login page
		if ($this->session_model->has_user_role('anonymous'))
		{
			redirect('pages/index');
		}

		if (!file_exists(APPPATH.'views/characters/new.php'))
		{
			// Whoops, we don't have a page for that!
			show_404();
		}

		$data['controller'] = 'characters';
		$data['page'] = 'new';
		$data['title'] = 'The Nine Lands';
		$data['subtitle'] = 'd20 System Online Tabletop RPG';

		$data['listcol'] = $this->get_campaigns();

		$this->load->view('templates/header', $data);
		$this->load->view($data['controller'] . '/' . $data['page'], $data);
		$this->load->view('templates/footer', $data);
	}

	public function get_campaigns()
	{
		$data = [];
		$invites = $this->campaign_model->get_received_invites();
		foreach ($invites as $key => $invite) {
			$camp = $this->campaign_model->get_campaign($invite['camp_id']);
			array_push($data, $camp);
		}
		return $data;
	}

	public function show_campaign_description($id)
	{
		if ($id === '0') {
			$data['campaign']['id'] = $id;
		}
		else {
			$data['campaign'] = $this->campaign_model->get_campaign($id);
		}
		$this->load->view('characters/parts/campdesc', $data);
	}
}
