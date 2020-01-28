<?php
/**
 * <b>Account Page View</b>
 *
 * @var	$title			String
 * @var $accounts		array()
 * @var $create_account array()
 * @var $update_account array()
 */
?>


<h1><?php echo $subtitle; ?></h1>

<div class="title_box">
	<h2><?php echo $subtitle; ?>' Table:</h2>
	<button id="create_account_btn"><span class="glyphicon glyphicon-plus"></span> New Account</button>
</div>

<table>
	<thead>
		<tr>
			<th>Email address</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Role</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($accounts as $accounts_key => $accounts_item): ?>
		<tr>
			<?php foreach ($accounts_item as $item_key => $item_value): ?>
				<?php if ($item_key != 'password' && $item_key != 'unhashed'): ?>
					<td class="<?php echo $accounts_key." ".$item_key; ?>"><?php echo $item_value; ?></td>
				<?php endif; ?>
			<?php endforeach; ?>
			<td style="display: flex; justify-content: space-around;">
				<button class="edit_btn js-update_account_btn" data-row="<?php echo $accounts_key; ?>"><span class="glyphicon glyphicon-pencil"></span></button>
				<?php echo form_open('backoffice/delete_account'); ?>
					<?php echo form_hidden('account_to_delete', $accounts_item['email']); ?>
					<button type="submit" name="submit" class="edit_btn"><span class="glyphicon glyphicon-trash"></span></button>
				<?php echo form_close(); ?>
			</td>
		</tr>
		<?php endforeach; ?>
	</tbody>
</table>
<hr>

<div class="modal" id="create_account_modal" style="display: none;">
	<div class="modal_box">
		<div class="js-modal_cancel_btn modal_cancel_btn">
			<span class="glyphicon glyphicon-remove"></span>
		</div>
		<div class="modal_content" id="create_account_form">
			<h2>Create an account</h2>

			<?php echo form_open('backoffice/create_account'); ?>

				<?php echo form_inputbox($create_account['first_name']); ?>
				<?php echo form_inputbox($create_account['last_name']); ?>
				<?php echo form_inputbox($create_account['email']); ?>
				<?php echo form_passwordbox($create_account['password']); ?>
				<?php echo form_dropdownbox($create_account['role']); ?>

				<br />

				<div class="form_btns">
					<button type="button" class="form_cancel_btn">Cancel</button>
					<button type="submit" name="submit">Create account</button>
				</div>

			<?php echo form_close(); ?>
		</div>
	</div>
</div>

<div class="modal" id="update_account_modal" style="display: none;">
	<div class="modal_box">
		<div class="js-modal_cancel_btn modal_cancel_btn">
			<span class="glyphicon glyphicon-remove"></span>
		</div>
		<div class="modal_content" id="update_account_form">
			<h2>Update account</h2>

			<?php echo form_open('backoffice/update_account'); ?>

				<?php echo form_inputbox($update_account['first_name']); ?>
				<?php echo form_inputbox($update_account['last_name']); ?>
				<?php echo form_inputbox($update_account['email']); ?>
				<?php echo form_passwordbox($update_account['password']); ?>
				<?php echo form_dropdownbox($update_account['role']); ?>

				<br />

				<div class="form_btns">
					<button type="button" class="form_cancel_btn">Cancel</button>
					<button type="submit" name="submit">Update account</button>
				</div>

			<?php echo form_close(); ?>
		</div>
	</div>
</div>
