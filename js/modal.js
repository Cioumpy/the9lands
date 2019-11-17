// ========================================================================== //
// Modal Functions																																//
// ========================================================================== //
/* These functions control the behaviour of the modal boxes */

// Set the "activeModal" variable to contain the active modal object.
var activeModal = null;

// Get the modal, set it as active and show it
function showModal(myModalId) {
	activeModal = $(myModalId);
	$(activeModal).show();
}

// Get the modal and close it
function closeModal() {
	$(activeModal).hide();
	activeModal = null;
}

$('.js-modal_cancel_btn span').click(function() {
	closeModal();
});
