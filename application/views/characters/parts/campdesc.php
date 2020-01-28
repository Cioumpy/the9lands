<?php if ($campaign['id'] === '0'): ?>
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
			<span><input id="starting_level" type="number" min="1" max="20" value="1"></span>
		</span>
		<span id="campaign_id" style="display: none;"><?php echo $campaign['id']; ?></span>
	</div>
<?php endif; ?>

<?php if ($campaign['id'] !== '0'): ?>
	<div class="banner">
		<div class="bannerbox" style="background-image: none, url('/media/characters/banners/campaigns/<?php echo $campaign['banner']; ?>');">
			<span><?php echo $campaign['name']; ?></span>
		</div>
	</div>
	<div class="descbox">
		<p><?php echo $campaign['description']; ?></p>
	</div>
	<div class="optionbox">
		<span>
			<span><b>Starting Level: </b></span>
			<span id="starting_level"><?php echo $campaign['startlevel']; ?></span>
		</span>
		<span>
			<span><b>Dungeon Master: </b></span>
			<span><?php echo $campaign['gm']; ?></span>
		</span>
		<span id="campaign_id" style="display: none;"><?php echo $campaign['id']; ?></span>
	</div>
<?php endif; ?>
