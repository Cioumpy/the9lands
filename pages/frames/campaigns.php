<div class="subscreen campcol hidden" id="camp<?php echo $campid; ?>">
	<div class="banner">
		<div class="bannerbox" style="background-image: url('../images/campaigns/<?php echo $campaigns[$campid]['banner']; ?>')">
			<span><?php echo $campaigns[$campid]['campaign']; ?></span>
		</div>
	</div>
	<div class="campdesc">
		<?php echo $campaigns[$campid]['campdesc']; ?>
	</div>
	<div class="campruleset embossed">
		<span>
			<b>Game Ruleset: </b>
			<?php
				if ($campaigns[$campid]['game'] == 'dd') {
					echo "Dungeons & Dragons 3.5";
				} else {
					echo "Pathfinder";
				}
			?>
		</span>
		<span><b>Starting Level: </b><?php echo $campaigns[$campid]['startlevel']; ?></span>
	</div>
</div>
