<div class="title_box">
	<h2><?php echo $title; ?>' Table:</h2>
	<button id="create_account_btn"><span class="glyphicon glyphicon-plus"></span> New Account</button>
</div>

<table>
	<thead>
		<tr>
			<th>Email address</th>
			<th>Password</th>
			<th>Unhashed Password</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Role</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($accounts as $accounts_item): ?>
		<tr>
			<?php foreach ($accounts_item as $item_value): ?>
	    <td><?php echo $item_value; ?></td>
			<?php endforeach; ?>
			<td>
				<?php echo form_open('backoffice/update_account'); ?>
					<?php echo form_hidden('email', $accounts_item['email']); ?>
					<?php echo form_input('password'); ?>
					<button type="submit" name="submit"><span class="glyphicon glyphicon-pencil"></span></button>
				</form>
				<?php echo form_open('backoffice/delete_account'); ?>
					<?php echo form_hidden('account_to_delete', $accounts_item['email']); ?>
					<button type="submit" name="submit"><span class="glyphicon glyphicon-trash"></span></button>
				</form>
			</td>
		</tr>
		<?php endforeach; ?>
	</tbody>
</table>
<hr>

<div class="modal" id="create_account_modal" style="display: none;">
	<div class="modal_box">
		<div class="cancel_btn">
			<span class="glyphicon glyphicon-remove"></span>
		</div>
		<div class="modal_content" id="create_account_form">
			<h2>Create an account</h2>

			<?php echo form_open('backoffice/create_account'); ?>

				<?php echo form_inputbox($first_name, $first_name_label); ?>
				<?php echo form_inputbox($last_name, $last_name_label); ?>
				<?php echo form_inputbox($email, $email_label); ?>
				<?php echo form_inputbox($password, $password_label); ?>

				<br />

				<div class="form_btns">
					<button type="button" class="form_cancel_btn">Cancel</button>
					<button type="submit" name="submit">Create account</button>
				</div>

			</form>
		</div>
	</div>
</div>

<div class="modal" id="update_account_modal" style="display: none;">
	<div class="modal_box">
		<div class="cancel_btn">
			<span class="glyphicon glyphicon-remove"></span>
		</div>
		<div class="modal_content" id="update_account_form">
			<h2>Update account</h2>

			<?php echo form_open('backoffice/update_account'); ?>

				<?php echo form_inputbox($first_name, $first_name_label); ?>
				<?php echo form_inputbox($last_name, $last_name_label); ?>
				<?php echo form_inputbox($email, $email_label); ?>
				<?php echo form_inputbox($password, $password_label); ?>

				<br />

				<div class="form_btns">
					<button type="button" class="form_cancel_btn">Cancel</button>
					<button type="submit" name="submit">Update account</button>
				</div>

			</form>
		</div>
	</div>
</div>
