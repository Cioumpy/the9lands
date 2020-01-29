function getCampaignDescription(itemId) {
	$.ajax({
		url: 'http://the9lands.org/characters/show_campaign_description/'+ itemId,
		success: function (response) {
			$('#campdesc').html(response);
		}
	});
	$('#js-campaigns_list').children().removeAttr('style');
	$('#campaigns_' + itemId).css('background-color', 'rgb(7, 64, 0)');

}

function createCharacter() {
	let startingLevel = $('#starting_level').val() + $('#starting_level').text() + "/";
	let campaignId = ($('#campaign_id').text() == "0") ? "" : $('#campaign_id').text() + "/";
	$.ajax({
		url: 'http://the9lands.org/characters/create_character/' + startingLevel + campaignId,
		success: function (response) {
			$('#mainbox').html(response);
		}
	});
}
