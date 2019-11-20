<?php
/**
 * <h1>Session Model</h1>
 *
 * <p>This class defines all session variables.<br/>
 * Be sure to have the following lines in the constructor of every controller:</p>
 * <code>
 * 		parent::__construct();<br/>
 * 		$this->load->model('session_model');
 * </code>
 *
 * @return bool
 */
class Session_model extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function get_accounts($email = FALSE) {
		if (NULL !== $this->db->get('accounts'))
		{
			if ($email === FALSE)
			{
				$query = $this->db->get('accounts');
				return $query->result_array();
			}

			$query = $this->db->get_where('accounts', array('email' => $email));
			return $query->row_array();
		}
		else
		{
			return NULL;
		}
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
		if (NULL !== $this->db->get('accounts'))
		{
			$data = array(
				'first_name' => $this->input->post('first_name'),
				'last_name' => $this->input->post('last_name'),
				'email' => $this->input->post('email'),
				'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
				'unhashed' => $this->input->post('password'),
				'role' => $this->input->post('role'),
			);

		    $this->db->insert('accounts', $data);
		}
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
	 * <h1>Check User's Role</h1>
	 *
	 * <p>This method checks if the user's role is equal to the requested parameter.</p>
	 *
	 * @param	$role	String	The user's role. Default is <code>'anonymous'</code>.
	 *
	 * @return 			bool	A boolean value.
	 */
	public function has_user_role(String $role = 'user')
	{
		return $this->session->role == $role;
	}


/**
	 * <h1>Check Login</h1>
	 *
	 * <p>This method checks if the active session user is logged in.</p>
	 *
	 * @return bool
	 */
	public function is_user_loggedin()
	{
		return (isset($_SESSION['soft_login']) ? $_SESSION['soft_login'] : FALSE) OR (isset($_SESSION['hard_login']) ? $_SESSION['hard_login'] : FALSE);
	}


	/**
	 * Login User
	 *
	 * Insert user in current session.
	 *
	 *
	 */
	public function set_current_user(String $email, String $pwd)
	{
		$my_user = $this->get_accounts($email);
		if (password_verify($pwd, $my_user['password']))
		{
			$my_user['soft_login'] = FALSE;
			$my_user['hard_login'] = FALSE;
			if ('anonymous@nomail.com' != $email) {
				// TODO: Set soft-login cookie.
				$my_user['soft_login'] = TRUE;
				$my_user['hard_login'] = TRUE;
			}
			unset($my_user['password']);
			unset($my_user['unhashed']);
			$this->session->set_userdata($my_user);
		}
	}

	public function set_current_user_anonymous()
	{
		$this->set_current_user('anonymous@nomail.com', '0000');
	}


}
