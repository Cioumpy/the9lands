	<header>
		<section id="titlebar">
			<div id="logotitle">
				<div id="dndlogo"></div>
				<div>
					<h1 class="sitetitle">The Nine Lands</h1>
					<h2 class="sitetitle">d20 System Online Tabletop RPG</h2>
				</div>
			</div>
			<div id="loginframe">
				<p id="greeting">Welcome, <?php  echo $_SESSION['firstname'] ?>!</p>
				<a class="usrbtn" href="/scripts/logout.php">Logout</a>
			</div>
		</section>
		<section id="menubar">
			<a href="/pages/player.php"><p>Player</p></a>
			<a href="#"><p>Dungeon Master</p></a>
			<a href="https://thetrove.net/Books/Dungeons%20&%20Dragons/AD&D%203rd%20Edition/D&D%203.5e%20Core/index.html" target="_blank"><p>Rules & Manuals</p></a>
			<a href="#"><p>Account</p></a>
		</section>
	</header>
