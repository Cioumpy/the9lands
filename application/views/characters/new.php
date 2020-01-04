<div class="mainbox">

	<div class="pagetitle">
		<div class="sideimgbox">
			<img src="/media/characters/logos/dd-logo.png" height="40px">
		</div>
		<div class="titlebox">
			<h2>Select Campaign</h2>
		</div>
		<div class="sideimgbox">
			<img src="/media/characters/logos/dd-logo.png" height="40px">
		</div>
	</div>

	<div class="mainscreen">

		<div class="subscreen listcol">
			<div class="listtitle">Campaigns</div>
			<div class="itemlist" id="js-campaigns_list">
				<div class="listitem" id="campaigns_0" onclick="getCampaignDescription('0')">Custom Character</div>
				<?php foreach ($listcol as $key => $camp): ?>
					<div class="listitem" id="campaigns_<?php echo $camp['id']; ?>" onclick="getCampaignDescription('<?php echo $camp['id']; ?>')"><?php echo $camp['name'] ?></div>
				<?php endforeach; ?>
			</div>
		</div>

		<div class="subscreen desccol" id="campdesc">
			<div class="banner">
				<div class="bannerbox">
					<span>Custom Character</span>
				</div>
			</div>
			<div class="descbox">
				<p>You are going to create a standard character of your own choice.</p>
			</div>
			<div class="optionbox">
				<span>
					<span><b>Starting Level: </b></span>
					<span><input type="number" min="1" max="20" value="1"></span>
				</span>
			</div>
		</div>

	</div>

	<div class="pagefooter">
		<div class="pagebuttons">
			<a type="button" class="mainbtns" href="<?php echo site_url('characters/list'); ?>">Back</a>
			<button class="mainbtns">Start</button>
		</div>
	</div>

</div>
