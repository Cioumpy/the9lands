<h2>Welcome HOME!!!</h2>

<p><a href="<?php echo site_url('pages/logout'); ?>">Logout</a></p>

<ul><h3>Current User</h3>
	<li><b><em>Email:</em></b> <?php echo isset($_SESSION['email']) ? $_SESSION['email'] : "<b>NOT SET!</b>"; ?></li>
	<li><b><em>Name:</em></b> <?php echo isset($_SESSION['first_name']) ? $_SESSION['first_name'] : "<b>NOT SET!</b>"; ?></li>
	<li><b><em>Surname:</em></b> <?php echo isset($_SESSION['last_name']) ? $_SESSION['last_name'] : "<b>NOT SET!</b>"; ?></li>
	<li><b><em>Role:</em></b> <?php echo isset($_SESSION['role']) ? $_SESSION['role'] : "<b>NOT SET!</b>" ?></li>
	<li><b><em>Soft Login:</em></b> <?php echo isset($_SESSION['soft_login']) ? $_SESSION['soft_login'] : "<b>NOT SET!</b>"; ?></li>
	<li><b><em>Hard Login:</em></b> <?php echo isset($_SESSION['hard_login']) ? $_SESSION['hard_login'] : "<b>NOT SET!</b>"; ?></li>
</ul>
