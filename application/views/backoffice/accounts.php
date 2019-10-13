<h2><?php echo $title; ?>' Table:</h2>

<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>Email address</th>
			<th>Password</th>
			<th>Unhashed Password</th>
			<th>First Name</th>
			<th>Last Name</th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($accounts as $accounts_item): ?>
		<tr>
			<?php foreach ($accounts_item as $item_value): ?>
	    <td><?php echo $item_value; ?></td>
			<?php endforeach; ?>
		</tr>
		<?php endforeach; ?>
	</tbody>
</table>
<hr>

<h2>Create an account</h2>

<?php echo validation_errors(); ?>

<?php echo form_open(); ?>

	<?php echo form_inputbox($first_name, $first_name_label); ?>
	<?php echo form_inputbox($last_name, $last_name_label); ?>
	<?php echo form_inputbox($email, $email_label); ?>
	<?php echo form_inputbox($password, $password_label); ?>

  <input type="submit" name="submit" value="Create account" />

</form>
