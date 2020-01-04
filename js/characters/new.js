function getCampaignDescription(itemId) {
	$.ajax({
		url: 'http://the9lands.org/characters/show_campaign_description/'+ itemId,
		success: function (response) {
			$('#campdesc').html(response);
		}
	});
	$('#js-campaigns_list').children().css('background-color', 'rgb(47, 20, 0)');
	$('#campaigns_' + itemId).css('background-color', 'rgb(7, 64, 0)');

}
