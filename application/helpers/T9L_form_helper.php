<?php
/**
 * Text Input Field Set
 *
 * @param	mixed $data
 * @param	string $value
 * @param	mixed $extra
 * @return	string
 *
 * @author  Stefano Sellone
 */
function form_inputbox($data = '', $value = '', $extra = '')
{
	$input = "<div class='form_input_container'>";

	// Create a label ONLY if $data['label'] exists.
	if (isset($data['label'])) {
		$input .= form_label($data['label'], $data['name']);
	    unset($data['label']);
	}

	$input .= form_input($data, $value, $extra);
	$input .= form_error(is_array($data) ? $data['name'] : $data);
	$input .= "</div>";

	return $input;
}


/**
 * Password Input Field Set
 *
 * @param	mixed $data
 * @param	string $value
 * @param	mixed $extra
 * @return	string
 *
 * @author  Stefano Sellone
 */
function form_passwordbox($data = '', $value = '', $extra = '')
{
	$input = "<div class='form_input_container'>";

	// Create a label ONLY if $data['label'] exists.
	if (isset($data['label'])) {
		$input .= form_label($data['label'], $data['name']);
		unset($data['label']);
	}

	$input .= form_password($data, $value, $extra);
	$input .= form_error(is_array($data) ? $data['name'] : $data);
	$input .= "</div>";

	return $input;
}

/**
 * Password Input Field Set
 *
 * @param	mixed $data
 * @param	string $value
 * @param	mixed $extra
 * @return	string
 *
 * @author  Stefano Sellone
 */
function form_dropdownbox($data = '', $options = array(), $selected = array(), $extra = '')
{
	$input = "<div class='form_input_container'>";

	// Create a label ONLY if $data['label'] exists.
	if (isset($data['label'])) {
		$input .= form_label($data['label'], $data['name']);
		unset($data['label']);
	}

	$input .= form_dropdown($data, $options, $selected, $extra);
	$input .= form_error(is_array($data) ? $data['name'] : $data);
	$input .= "</div>";

	return $input;
}

