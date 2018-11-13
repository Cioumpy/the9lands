<div class="subscreen classcol hidden" id="class<?php echo $rc; ?>">
	<div class="banner">
		<div class="bannerbox" style="background-image: url('../images/campaigns/default.jpg')">
			<span><?php echo $ddRules->classes[$rc]['class']; ?></span>
		</div>
	</div>
	<div class="classdesc">
		<p><?php echo $ddRules->classesdesc[$rc]['intro']; ?></p>
		<p><?php echo $ddRules->classesdesc[$rc]['Characteristics']; ?></p>
		<p><b>Hit Die:</b> d<?php echo $ddRules->classes[$rc]['hd']; ?>.</p>
		<br>
		<label><b><?php echo $ddRules->classes[$rc]['class']; ?>&#39;s Stats Table:</b></label>
		<?php
			// Print the Classes Stats ************************************** //
			// Printing all the keys and values one by one
			echo "<table>";
			$test_classes = $ddRules->get_classes();
			$keys = array_keys($test_classes);
			echo "<tr>";
			echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>Level</th>";
			echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>BAB</th>";
			echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>Fort</th>";
			echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>Refl</th>";
			echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>Will</th>";
			echo "<th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>Class Features</th>";
			echo "</tr>";
			for($i = 1; $i <= $ddRules->classes[$rc]['maxlvl']; $i++) {
					echo "<tr><th style='border: 1px solid white; background-color: rgba(127,127,127,0.8); padding: 5px'>" . $i . "</th>";
					echo "<td style='border: 1px solid white; padding: 5px'>+";
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
					echo "<td style='border: 1px solid white; padding: 5px'>+";
					if ($ddRules->classes[$rc]['fort'] == 'good') {
						echo floor(($i * $goodts) + 2);
					} else {
						echo floor($i * $poorts);
					}
					echo "</td>";
					echo "<td style='border: 1px solid white; padding: 5px'>+";
					if ($ddRules->classes[$rc]['refl'] == 'good') {
						echo floor(($i * $goodts) + 2);
					} else {
						echo floor($i * $poorts);
					}
					echo "</td>";
					echo "<td style='border: 1px solid white; padding: 5px'>+";
					if ($ddRules->classes[$rc]['will'] == 'good') {
						echo floor(($i * $goodts) + 2);
					} else {
						echo floor($i * $poorts);
					}
					echo "</td>";
					echo "<td style='border: 1px solid white; padding: 5px'></td>";
					echo "</tr>";
			}
			echo "</table>";

		?>
	</div>
</div>
