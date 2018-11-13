<div class="subscreen racecol hidden" id="race<?php echo $rc; ?>">
	<div class="banner">
		<div class="bannerbox" style="background-image: url('../images/campaigns/default.jpg')">
			<span><?php echo $ddRules->races[$rc]['race']; ?></span>
		</div>
	</div>
	<div class="racedesc">
		<p><?php echo $ddRules->races[$rc]['intro']; ?></p>
		<p>All the members of the <?php echo $ddRules->races[$rc]['race']; ?> race share the following stats:</p>
		<ul>
			<?php
				if ($ddRules->races[$rc]['abilitydesc'] != null) {
					echo "<li><b>";
					$i = 1;
					foreach ($ddRules->abilities as $key => $value) {
						if ($ddRules->races[$rc][$ddRules->abilities[$key]['ability']] != 0) {
							if ($i > 1) {
								echo ", ";
							}
							$i++;
				 			echo $ddRules->abilities[$key]['name'] . " ";
							if ($ddRules->races[$rc][$ddRules->abilities[$key]['ability']] > 0) {
								echo "+";
							}
							echo $ddRules->races[$rc][$ddRules->abilities[$key]['ability']];
						}
				 	}
					echo ": </b>" . $ddRules->races[$rc]['abilitydesc'] . "</li>";
				}
			?>
			<li><b>Size: </b><?php echo $ddRules->races[$rc]['size']; ?></li>
			<li><b>Speed: </b><?php echo $ddRules->races[$rc]['speed']; ?> ft.</li>
		</ul>
	</div>
</div>
