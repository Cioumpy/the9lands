<div class="subscreen classcol hidden" id="class<?php echo $rc; ?>">
	<div class="banner">
		<div class="bannerbox" style="background-image: url('../images/webelements/banners/classes/<?php echo $ddRules->classesdesc[$rc]['image']; ?>'), url('../images/webelements/backgrounds/background-map.jpg')">
			<span class="bannertitle"><?php echo $ddRules->classes[$rc]['class']; ?></span>
		</div>
	</div>
	<div class="classdesc">
		<p><?php echo $ddRules->classesdesc[$rc]['intro']; ?></p>
		<p><?php echo $ddRules->classesdesc[$rc]['Characteristics']; ?></p>
		<p><b>Hit Die:</b> d<?php echo $ddRules->classes[$rc]['hd']; ?>.</p>
		<p><span class="roman" style="font-weight: bold; font-size: 1.3em">Class Skills</span><br>
			The <?php echo $ddRules->classes[$rc]['class']; ?>&#39;s class skills (and the key ability for each skill) are
			<?php

				/* To insert the commas and the "and", we need to get the last skill
				in our class list. */
				$lastSkill = null;
				foreach ($ddRules->skills as $key => $value) {
					if ($ddRules->classes[$rc]['classskills'][$key]['classskill'] == 1) {
						$lastSkill = $key;
					}
				}

				$x = 0;
				$craft = true;
				$perf = true;
				$prof = true;
				foreach ($ddRules->skills as $key => $value) {
					if ($ddRules->classes[$rc]['classskills'][$key]['classskill'] == 1) {
						$x++;
						if (strpos($ddRules->skills[$key]['skill'], "Craft") === 0) {
							if ($craft) {
								if ($key == $lastSkill) {
									echo " and ";
								} elseif ($x > 1) {
									echo ", ";
								}
								echo "Craft";
								for ($y = 1; $y <= count($ddRules->abilities); $y++) {
									if ($ddRules->abilities[$y]['ability'] == $ddRules->skills[$key]['ability']) {
										echo " (" . $ddRules->abilities[$y]['shtname'] . ")";
									}
								}
								$craft = false;
							}
						} elseif (strpos($ddRules->skills[$key]['skill'], "Perform") === 0) {
							if ($perf) {
								if ($key == $lastSkill) {
									echo " and ";
								} elseif ($x > 1) {
									echo ", ";
								}
								echo "Perform";
								for ($y = 1; $y <= count($ddRules->abilities); $y++) {
									if ($ddRules->abilities[$y]['ability'] == $ddRules->skills[$key]['ability']) {
										echo " (" . $ddRules->abilities[$y]['shtname'] . ")";
									}
								}
								$perf = false;
							}
						} elseif (strpos($ddRules->skills[$key]['skill'], "Profession") === 0) {
							if ($prof) {
								if ($key == $lastSkill) {
									echo " and ";
								} elseif ($x > 1) {
									echo ", ";
								}
								echo "Profession";
								for ($y = 1; $y <= count($ddRules->abilities); $y++) {
									if ($ddRules->abilities[$y]['ability'] == $ddRules->skills[$key]['ability']) {
										echo " (" . $ddRules->abilities[$y]['shtname'] . ")";
									}
								}
								$prof = false;
							}
						} else {
							if ($key == $lastSkill) {
								echo " and ";
							} elseif ($x > 1) {
								echo ", ";
							}
							echo $ddRules->classes[$rc]['classskills'][$key]['skill'];
							for ($y = 1; $y <= count($ddRules->abilities); $y++) {
								if ($ddRules->abilities[$y]['ability'] == $ddRules->skills[$key]['ability']) {
									echo " (" . $ddRules->abilities[$y]['shtname'] . ")";
								}
							}
						}
					}
				}
				echo ".";

			?>
			<br><b>Skill Points per level:</b> <?php echo $ddRules->classes[$rc]['skillpoints']; ?> + Intelligence modifier.<br>
			<b>At first level:</b> (<?php echo $ddRules->classes[$rc]['skillpoints']; ?> + Intelligence modifier) &times; 4.</p>
		<br>
		<label><b><?php echo $ddRules->classes[$rc]['class']; ?>&#39;s Stats Table:</b></label>
		<?php
			// Print the Classes Stats ************************************** //
			// Printing all the keys and values one by one
			echo "<table>";
			$test_classes = $ddRules->get_classes();
			$keys = array_keys($test_classes);
			echo "<tr><th class=\"cellcenter\">Level</th><th>BAB</th><th class=\"cellcenter\">Fort</th><th class=\"cellcenter\">Refl</th><th class=\"cellcenter\">Will</th><th>Class Features</th></tr>";
			for($i = 1; $i <= $ddRules->classes[$rc]['maxlvl']; $i++) {
					echo "<tr><th class=\"cellcenter\">" . $i . "</th>";
					echo "<td>+";
					echo floor($i * $ddRules->classes[$rc]['bab']);
					if (($i * $ddRules->classes[$rc]['bab']) >= 6) {
						echo " / +" . (floor($i * $ddRules->classes[$rc]['bab']) - 5);
					}
					if (($i * $ddRules->classes[$rc]['bab']) >= 11) {
						echo " / +" . (floor($i * $ddRules->classes[$rc]['bab']) - 10);
					}
					if (($i * $ddRules->classes[$rc]['bab']) >= 16) {
						echo " / +" . (floor($i * $ddRules->classes[$rc]['bab']) - 15);
					}
					echo "</td>";
					echo "<td class=\"cellcenter\">+";
					if ($ddRules->classes[$rc]['fort'] == 'good') {
						echo floor(($i * $goodts) + 2);
					} else {
						echo floor($i * $poorts);
					}
					echo "</td>";
					echo "<td class=\"cellcenter\">+";
					if ($ddRules->classes[$rc]['refl'] == 'good') {
						echo floor(($i * $goodts) + 2);
					} else {
						echo floor($i * $poorts);
					}
					echo "</td>";
					echo "<td class=\"cellcenter\">+";
					if ($ddRules->classes[$rc]['will'] == 'good') {
						echo floor(($i * $goodts) + 2);
					} else {
						echo floor($i * $poorts);
					}
					echo "</td>";
					echo "<td></td>";
					echo "</tr>";
			}
			echo "</table>";

		?>
	</div>
</div>
