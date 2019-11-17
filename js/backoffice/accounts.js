$('#create_account_btn').click(function () {
	showModal('#create_account_modal');
});

$('.js-update_account_btn').click(function () {
	let rowId = $(this).data('row');
	$('#update_first_name').val($('.'+rowId+'.first_name').text());
	$('#update_last_name').val($('.'+rowId+'.last_name').text());
	$('#update_email').val($('.'+rowId+'.email').text());
	$('#update_password').val($('.'+rowId+'.unhashed').text());
	showModal('#update_account_modal');
});