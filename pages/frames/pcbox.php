				<div class="charchoice">
					<img src="images/thumbs/chars/<?php echo $pcstat['avatar'] ?>" alt="<?php echo $pcstat['charname'] ?>'s Avatar">
					<div class="chardescrip">
						<p class="charname"><?php echo $pcstat['charname'] ?></p>
						<p><strong>Level:</strong> ## </p>
						<p><strong>Classes:</strong> Paladin (10)</p>
						<p><strong>Campaign:</strong> <?php echo $pcstat['campaign'] ?></p>
						<button class="viewcharsheet" onclick="showModal('charsheetmodal<?php echo $pcstat['id'] ?>')">View</button>
						<button class="viewcharsheet" onclick="showModal('charsheetmodal<?php echo $pcstat['id'] ?>')">Edit</button>
					</div>
				</div>

