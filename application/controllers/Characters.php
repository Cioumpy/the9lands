<?php
class Characters extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('session_model');
		$this->load->model('campaign_model');
		$this->load->model('character_model');
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

		$data['page'] = 'list';
		$data['title'] = 'The Nine Lands';
		$data['subtitle'] = 'd20 System Online Tabletop RPG';

		$footer_data['controller'] = $data['controller'];
		$footer_data['scripts'] = array('main', $data['page']);

		$this->load->view('templates/header', $data);
		$this->load->view($data['controller'] . '/' . $data['page'], $data);
		$this->load->view('templates/footer', $footer_data);
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

		$footer_data['controller'] = $data['controller'];
		$footer_data['scripts'] = array('main', 'list', $data['page']);

		$this->load->view('templates/header', $data);
		$this->load->view($data['controller'] . '/' . $data['page'], $data);
		$this->load->view('templates/footer', $footer_data);
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
			$gm_account = $this->session_model->get_accounts($data['campaign']['gm']);
			$data['campaign']['gm'] = $gm_account['first_name'] . " " . $gm_account['last_name'];
		}
		$this->load->view('characters/parts/campdesc', $data);
	}

	public function create_character($starting_level = 1, $campaign_id = NULL, $player = NULL)
	{
		if (!isset($player)) {
			$player = $this->session->email;
		}
		$currxp = 0;
		for ($i=0; $i < $starting_level; $i++) {
			$currxp = $currxp + ($i * 1000);
		}
		$data = [
			'player' => $player,
			'starting_level' => $starting_level,
			'campaign_id' => $campaign_id,
			'currxp' => $currxp,
		];

		// TODO: Uncomment the following line, once finished with the other tasks, to avoid creating characters endlessly.
		// $this->character_model->create_character($data);

		$data = [];
		$data['character'] = $this->character_model->get_new_character();
		$player_account = $this->session_model->get_accounts($data['character']['player']);
		$data['character']['player'] = $player_account['first_name'] . " " . $player_account['last_name'];

		$this->load->view('characters/sections/summary', $data);
	}

	public function show_new_character_summary()
	{
		$data['character'] = $this->character_model->get_new_character();
		$player_account = $this->session_model->get_accounts($data['character']['player']);
		$data['character']['player'] = $player_account['first_name'] . " " . $player_account['last_name'];

		$this->load->view('characters/sections/summary', $data);
	}
}
