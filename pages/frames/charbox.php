				<div class="charchoice">
					<img src="../images/thumbs/chars/<?php echo $row['avatar'] ?>" alt="<?php echo $row['charname'] ?>'s Avatar">
					<div class="chardescrip">
						<p class="charname"><?php echo $row['charname'] ?></p>
						<p><strong>Level:</strong> <?php echo $charlevel ?></p>
						<p><strong>Classes:</strong>
							<?php
								foreach ($charclasslvl as $cls => $cls_value) {
									echo $ddclassshtname[$cls] . $cls_value . " ";
								}
							?>
						</p>
						<p><strong>Campaign:</strong> <?php echo $row['campaign'] ?></p>
							<?php
								if ($row['currxp'] >= $nextlvlxp) {
									$whichmodal = 'levelupmodal';
									$btnlbl = 'Level Up';
								} else {
									$whichmodal = 'charsheetmodal';
									$btnlbl = 'View';
								}
							?>
						<button class="viewcharsheet" onclick="showModal('<?php echo $whichmodal . $row['id'] ?>', '', '', '')"><?php echo $btnlbl ?></button>
						<form action="../scripts/selectpc.php" method="post">
							<input class="hidden" type="radio" name="charid" value="<?php echo $row['id'] ?>" checked>
							<button class="viewcharsheet" type="submit">Select</button>
						</form>

					</div>
				</div>
