<?php
class Session_model extends CI_Model
{
	public function __construct() {
		parent::__construct();
	}

	public function get_accounts($id = FALSE) {
		if ($id === FALSE) {
			$query = $this->db->get('accounts');
			return $query->result_array();
		}

		$query = $this->db->get_where('accounts', array('id' => $id));
		return $query->row_array();
	}


	/**
	 * Create Account
	 *
	 * This method creates an account and inserts it into the database.
	 *
	 * @return bool
	 */
	public function create_account()
	{
		$data = array(
			'first_name' => $this->input->post('first_name'),
			'last_name' => $this->input->post('last_name'),
			'email' => $this->input->post('email'),
			'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
			'unhashed' => $this->input->post('password'),
			'role' => $this->input->post('role'),
		);

	    return $this->db->insert('accounts', $data);
	}


	/**
	 * Update Account
	 *
	 * This method updates an account in the database.
	 *
	 * @return bool
	 */
	public function update_account()
	{
		$data = array(
			'first_name' => $this->input->post('first_name'),
			'last_name' => $this->input->post('last_name'),
			'email' => $this->input->post('email'),
			'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
			'unhashed' => $this->input->post('password'),
			'role' => $this->input->post('role'),
		);

		$this->db->where('email', $data['email']);
		return $this->db->update('accounts', $data);
	}


	/**
	 * Delete Account
	 *
	 * This method deletes an account from the database.
	 *
	 * @return bool
	 */
	public function delete_account()
	{
		$data = array(
			'email' => $this->input->post('account_to_delete'),
		);
		return $this->db->delete('accounts', $data);
	}

	/**
	 * Check User
	 *
	 * This method checks if the input user's password
	 * matches with the one in the database.
	 *
	 * @param string $pwd						The input password
	 * @param string $hashed_pwd		The hashed password in the database
	 *
	 * @return bool
	 */
	public function _check_user($pwd, $hashed_pwd)
	{
		if (password_verify($pwd, $hashed_pwd))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}


	/**
	 * Check Session
	 *
	 * This method checks if the active session user
	 * is logged in.
	 *
	 * @return bool
	 */
	public function _check_session()
	{
		if (isset($_SESSION['member']))
		{
			return TRUE;
		}
		return FALSE;
	}


	/**
	 * Login User
	 *
	 *
	 */
	public function login_user($id, $pwd)
	{
		$my_user = array('username' => $id);
		$query = $this->db->get_where('accounts', $my_user);
		if ($this->db->count_all_results() === 1)
		{
			$row = $query->row();
			return _check_user($pwd, $row['password']);
		}

		return $query->row_array();
	}

}
