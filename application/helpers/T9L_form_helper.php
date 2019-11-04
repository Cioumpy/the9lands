<?php
/**
 * Text Input Field
 *
 * @param	mixed $data
 * @param	string $value
 * @param	mixed $extra
 * @return	string
 */
function form_inputbox($data = '', $label = '', $value = '', $extra = '')
{
	$input = "<div class='form_input_container'>";
	if ($label !== '')
	{
		$for_attribute = is_array($data) ? $data['name'] : $data;
		$input .= "<label for='{$for_attribute}'>{$label}</label>";
	}
	$input .= form_input($data, $value, $extra);
	$input .= form_error($for_attribute);
	$input .= "</div>";

	return $input;
}
