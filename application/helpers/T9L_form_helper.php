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
	$input = "<div>";
	if ($label !== '')
	{
		$for_attribute = is_array($data) ? $data['name'] : $data;
		$input .= "<label for='{$for_attribute}'>{$label}</label>";
	}
	$input .= form_input($data, $value, $extra);
	$input .= "</div>";

	return $input;
}
