function getCharacterSummary(itemId) {
	$.ajax({
		url: 'http://the9lands.org/characters/show_character_summary/'+ itemId,
		success: function (response) {
			$('#modal').html(response);
		}
	});
}
