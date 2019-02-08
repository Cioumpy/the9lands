<div class="subscreen racecol hidden" id="race<?php echo $rc; ?>">
	<div class="banner">
		<div class="bannerbox" style="background-image: url('../images/webelements/banners/races/<?php echo $ddRules->racedescs[$rc]['image']; ?>'), url('../images/webelements/banners/campaigns/default.jpg')">
			<span class="bannertitle"><?php echo $ddRules->races[$rc]['race']; ?></span>
		</div>
	</div>
	<div class="racedesc">
		<p><?php echo $ddRules->racedescs[$rc]['intro']; ?></p>
		<p>All the members of the <?php echo $ddRules->races[$rc]['race']; ?> race share the following stats:</p>
		<ul>
			<?php
				if ($ddRules->racedescs[$rc]['abilitydesc'] != null) {
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
					echo ": </b>" . $ddRules->racedescs[$rc]['abilitydesc'] . "</li>";
				}
			?>
			<li><b>Size: </b><?php echo $ddRules->racedescs[$rc]['size']; ?>.</li>
			<li><b>Speed: </b><?php echo $ddRules->racedescs[$rc]['speed']; ?> ft.</li>
			<?php
				for ($i=0; $i < count($ddRules->racedescs[$rc]['othertraits']); $i++) {
					echo "<li>" . $ddRules->racedescs[$rc]['othertraits'][$i] . "</li>";
				}
			?>
			<li><b>Automatic Languages: </b>
				<?php
					for ($i=0; $i < count($ddRules->races[$rc]['autolangs']); $i++) {
						if ($i == 0) {
							echo "";
						} else if ($i == count($ddRules->races[$rc]['autolangs']) - 1) {
							echo " and ";
						} else {
							echo ", ";
						}
						echo $ddRules->races[$rc]['autolangs'][$i];
					}
				?>.</li>
			<li><b>Bonus Languages: </b>
			<?php
				for ($i=0; $i < count($ddRules->races[$rc]['bonuslangs']); $i++) {
					if ($i == 0) {
						echo "";
					} else if ($i == count($ddRules->races[$rc]['bonuslangs']) - 1) {
						echo " and ";
					} else {
						echo ", ";
					}
					echo $ddRules->races[$rc]['bonuslangs'][$i];
				}
			?>.</li>
			<li><b>Favored Class: </b><?php echo $ddRules->races[$rc]['favclass']; ?>.</li>
		</ul>
	</div>
</div>
