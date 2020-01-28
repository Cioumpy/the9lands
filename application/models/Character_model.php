<?php
/**
 * <h1>Character Model</h1>
 *
 */
class Character_model extends CI_Model
{

	public function __construct()
	{
		parent::__construct();
	}

	public function create_character($data = NULL)
	{
		if (NULL !== $this->db->get('characters') && isset($data))
		{
	    $this->db->insert('characters', $data);
		}
	}

	public function get_characters($id = NULL)
	{
		if (!isset($id))
		{
			$query = $this->db->get('characters');
			return $query->result_array();
		}
		else
		{
			$query = $this->db->get_where('characters', array('id' => $id));
			return $query->row_array();
		}
	}

	public function get_new_character($player = NULL)
	{
		if (!isset($player)) {
			$player = $this->session->email;
		}
		$query = $this->db->get_where('characters', array('player' => $player, 'is_new' => 1));
		return $query->row_array();
	}

	public function get_classes($id = NULL)
	{
		if (!isset($id))
		{
			$query = $this->db->get('t9lddrules.classes');
			return $query->result_array();
		}
		$query = $this->db->get_where('t9lddrules.classes', array('id' => $id));
		return $query->row_array();
	}
}
