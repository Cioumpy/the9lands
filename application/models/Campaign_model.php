<?php
/**
 * <h1>Campaign Model</h1>
 *
 */
class Campaign_model extends CI_Model
{

	public function __construct()
	{
		parent::__construct();
	}

	public function get_received_invites($email = NULL)
	{
		if (!isset($email))
		{
			$email = $this->session->__get('email');
		}
		$query = $this->db->get_where('invites', array('player' => $email));
		return $query->result_array();
	}

	public function get_campaign($id = NULL)
	{
		if ($id !== NULL)
		{
			$query = $this->db->get_where('campaigns', array('id' => $id));
			return $query->row_array();
		}
		else
		{
			return [];
		}
	}

}
