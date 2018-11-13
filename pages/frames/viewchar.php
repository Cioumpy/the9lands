					<?php

/*	VERY IMPORTANT!!! : All the variables of the charachter sheet MUST be collected in this PHP section!
												The connection with the server is already open, so do NEITHER open new connections
												NOR close the existing connection with the server, in this file! EVER!!!
*/

						// Get the Charachter Base Stats ******************************* //
							$charsql = "SELECT * FROM progrchar" . $row['id'] . ";";
							$charresult = $conn->query($charsql);

							if ($charresult->num_rows > 0) {

								$charlevel = 0;
								$charbab = 0;
								$charmaxhp = 0;
								// output data of each row
								while($charrow = $charresult->fetch_assoc()) {
									if ($charrow['level'] > $charlevel) {
										$charlevel = $charrow['level'];
										$charbab = $charbab + $charrow['bab'];
										$charmaxhp = $charmaxhp + $charrow['hp'];
									}
									if ($charrow['level'] == $charlevel) {
										$charabil['strength'] = $charrow['strength'];
										$charabil['dexterity'] = $charrow['dexterity'];
										$charabil['constitution'] = $charrow['constitution'];
										$charabil['intelligence'] = $charrow['intelligence'];
										$charabil['wisdom'] = $charrow['wisdom'];
										$charabil['charisma'] = $charrow['charisma'];
									}
								}


								$charmodbab = floor($charbab);

								foreach ($charabil as $chab => $chab_value) {
									$charmodabil[$chab] = floor(($chab_value - 10) / 2);
								}

								$nextlvlxp = 0;
								$baselvlxp = 0;
								for ($countlvl = 1; $countlvl <= $charlevel; $countlvl++) {
									$baselvlxp = $nextlvlxp;
									$nextlvlxp = $nextlvlxp + $countlvl;
								}
								$nextlvlxp = $nextlvlxp * 1000;
								$baselvlxp = $baselvlxp * 1000;

								$charmaxhp = $charmaxhp + ($charlevel * $charmodabil['constitution']);

							}

						// ************************************************************** //

						// Get the Character Base Class Stats ************************** //
							$ddclassessql = "SELECT * FROM ddbaseclasslist;";
							$ddclassesresult = $conn->query($ddclassessql);

							if ($ddclassesresult->num_rows > 0) {

								$ddclassname = array();
								$ddclassshtname = array();
								// output data of each row
								while($ddclassesrow = $ddclassesresult->fetch_assoc()) {
									$ddclassname[$ddclassesrow['class']] = $ddclassesrow['name'];
									$ddclassshtname[$ddclassesrow['class']] = $ddclassesrow['shortname'];
								}
							}

							$charclassessql = "SELECT * FROM progrchar" . $row['id'] . ";";
							$charclassesresult = $conn->query($charclassessql);

							if ($charclassesresult->num_rows > 0) {

								$charclasslvl = array();
								$charts = array('fort' => null, 'refl' => null, 'will' => null);
								$tskeyabil = array('fort' => 'constitution', 'refl' => 'dexterity', 'will' => 'wisdom');

								// output data of each row
								while($charclassesrow = $charclassesresult->fetch_assoc()) {

									foreach ($ddclassname as $cls => $cls_value) {
										if ($charclassesrow['class1'] == $cls) {
											$charclasslvl[$cls] = $charclasslvl[$cls] + 1;
										}
										if ($charclassesrow['class2'] == $cls) {
											$charclasslvl[$cls] = $charclasslvl[$cls] + 1;
										}
									}

									foreach ($charts as $ts => $ts_value) {

										if ($ddclasses[$charclassesrow['class1']][$ts] == "good") {
											$charts1 = 1 / 2;
											if ($charclasslvl[$charclassesrow['class1']] == 1) {
												$charts1 = $charts1 + 2;
											}
										} else {
											$charts1 = 1 / 3;
										}

										if ($ddclasses[$charclassesrow['class2']][$ts] == "good") {
											$charts2 = 1 / 2;
											if ($charclasslvl[$charclassesrow['class2']] == 1) {
												$charts2 = $charts2 + 2;
											}
										} else {
											$charts2 = 1 / 3;
										}

										if ($charts1 > $charts2) {
											$charts[$ts] = $charts[$ts] + $charts1;
										} else {
											$charts[$ts] = $charts[$ts] + $charts2;
										}

									}

								} // End of while

								foreach ($charts as $ts => $ts_value) {
									$charts[$ts] = floor($charts[$ts]) + $charmodabil[$tskeyabil[$ts]];
								}

							}

						// ************************************************************** //


						// Get the Charachter Skill Ranks ******************************* //
							$charskillssql = "SELECT * FROM skillschar" . $row['id'] . ";";
							$charskillsresult = $conn->query($charskillssql);

							if ($charskillsresult->num_rows > 0) {

								$charskill = array();
								// output data of each row
								while($charskillsrow = $charskillsresult->fetch_assoc()) {
									foreach ($charskillsrow as $sk => $sk_value) {
										$charskill[$sk] = $charskill[$sk] + $sk_value;
									}
								}
							}

						// ************************************************************** //

						// Get the Charachter Feats ************************************* //
							$charfeatssql = "SELECT * FROM progrchar" . $row['id'] . ";";
							$charfeatsresult = $conn->query($charfeatssql);

							if ($charfeatsresult->num_rows > 0) {

								$charfeat = array();
								$ft = 0;
								// output data of each row
								while($charfeatsrow = $charfeatsresult->fetch_assoc()) {
									if ($charfeatsrow['feat'] != null) {
										$charfeat[$charfeatsrow['level']] = $charfeatsrow['feat'];
									}
								}
							}

						// ************************************************************** //


						// ************************************************************** //

								include "frames/charbox.php";

						// ************************************************************** //

					?>


					<!-- This is the Character Sheet Modal Box -->
					<div id="charsheetmodal<?php echo $row['id'] ?>" class="modal hidden">
						<button class="close" onclick="closeModal('charsheetmodal<?php echo $row['id'] ?>')">X</button>

						<div class="sheetbox">

							<div class="charbox leftbox">

								<div class="sheettitle">
									<div class="logobox">
										<img src="../images/<?php echo $row['game'] ?>-logo.png" class="d20logo">
									</div>
									<p class="charname"><?php echo $row['charname'] ?></p>
								</div>

								<div class="lefttabcontent lefttabstats1 visible">

									<div class="charportrait">

										<div class="charavatarbox">
											<img src="../images/thumbs/chars/<?php echo $row['avatar'] ?>" alt="Avatar">
										</div> <!-- #charavatarbox -->

										<div class="charabilities">
											<span><strong><?php echo $row['race'] . ", " . $row['alignment'] ?></strong></span>
											<span>
												<strong>Level <?php echo $charlevel ?>: </strong>
												<?php
													foreach ($charclasslvl as $cls => $cls_value) {
														echo $ddclassshtname[$cls] . $cls_value . " ";
													}
												?>
											</span>

											<hr>

											<?php
												foreach ($charabil as $chab => $chab_value) {
													echo "<div class='statcontainer'>";
													echo "	<span class='titlestatbox statbox'>" . $abilshtname[$chab] . "</span>";
													echo "	<span class='statbox'>" . $chab_value . "</span>";
													echo "	<span class='statbox'>";
													if ($charmodabil[$chab] > 0) {
														echo '+';
													}
													echo $charmodabil[$chab];
													echo "	</span>";
													echo "</div>";
												}
											?>

										</div><!-- #charabilities -->

									</div> <!-- #charportrait -->

									<div class="chardefense">

										<div class="statcontleft">

											<div class="statcontainer">
												<span class="titlestatbox statbox">AC</span>
												<span class="statbox"><?php echo '22' ?></span>
											</div> <!-- .statcontainer -->

											<div class="statcontainer">
												<span class="titlestatbox statbox">SR</span>
												<span class="statbox"><?php echo '13' ?></span>
											</div> <!-- .statcontainer -->

										</div> <!-- .statcontleft -->

										<div class="statcontright">

											<div class="barcontainer">
												<span class="titlestatbox statbox">HP</span>
												<span class="wholebar">
													<span class="barprogress hpbar" style="max-width: <?php echo floor($row['currhp'] / $charmaxhp * 100) ?>%">
														<span class="barvalues hpvalues"><?php echo $row['currhp'] . ' / ' . $charmaxhp ?></span>
													</span>
												</span>
											</div> <!-- .barcontainer -->

											<div class="barcontainer">
												<span class="titlestatbox statbox">XP</span>
												<span class="wholebar">
													<span class="barprogress xpbar" style="max-width: <?php echo floor(($row['currxp'] - $baselvlxp) / ($nextlvlxp - $baselvlxp) * 100) ?>%">
														<span class="barvalues xpvalues"><?php echo $row['currxp'] . ' / ' . $nextlvlxp ?></span>
													</span>
												</span>
											</div> <!-- .barcontainer -->

										</div> <!-- .statcontleft -->

									</div> <!-- #chardefense -->

									<div class="charbackground">
										<h6>Saving Throws</h6>
										<div class="savingthrows">

											<div class="statcontainer">
												<span class="titlestatbox statbox">Fort</span>
												<span class="statbox"><?php echo $charts['fort'] ?></span>
											</div> <!-- .statcontainer -->

											<div class="statcontainer">
												<span class="titlestatbox statbox">Refl</span>
												<span class="statbox"><?php echo $charts['refl'] ?></span>
											</div> <!-- .statcontainer -->

											<div class="statcontainer">
												<span class="titlestatbox statbox">Will</span>
												<span class="statbox"><?php echo $charts['will'] ?></span>
											</div> <!-- .statcontainer -->

										</div> <!-- #savingthrows -->

										<hr>

										<h6>Background</h6>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non laoreet lectus. Sed dignissim, ipsum ut facilisis rhoncus, diam orci tincclassunt quam, at pharetra enim neque quis lectus. Ut a enim nunc. Vivamus sodales massa vitae nulla porta, ac sagittis justo venenatis. Suspendisse feugiat ligula quam, quis aliquam dui pulvinar interdum. Curabitur nunc erat, semper vel felis et, dapibus lacinia lacus. Aenean in rutrum arcu. Nunc at tempor neque, sit amet ultrices nisl. Proin libero sem, rhoncus non commodo class, posuere quis purus. Nulla facilisi. Donec pretium metus sit amet ligula fringilla viverra. Nam auctor justo tincclassunt erat sagittis, in accumsan urna gravclassa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
										<p>Nam egestas metus et finibus fringilla. In class placerat velit. Nulla facilisi. Suspendisse sollicitudin lobortis dui at tristique. Sed blandit facilisis metus, sed varius est pretium sed. Pellentesque pretium leo class augue vulputate, vitae ullamcorper tellus egestas. Donec eleifend eu metus class semper. In hac habitasse platea dictumst. Aliquam dignissim eget purus ac cursus. Vivamus purus orci, sodales sit amet finibus vel, feugiat vel eros. In pharetra consequat nunc, vitae faucibus ipsum vulputate a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus vestibulum ligula fringilla tellus rhoncus imperdiet. Vivamus semper dictum laoreet. Quisque iaculis mattis lacus congue viverra. Morbi eget venenatis lectus.</p>
										<p>Ut interdum libero sit amet erat tempus, ut mollis sapien blandit. Donec imperdiet tempus ex, et sodales mauris ultrices vel. Ut tempus ornare justo, vitae condimentum velit fringilla ut. Sed non interdum urna. Curabitur vitae tincclassunt sapien, vel pretium urna. Maecenas iaculis eros quis dignissim condimentum. In non vestibulum lorem, vel suscipit lorem. Curabitur rhoncus sem nec erat ullamcorper dapibus. Integer egestas est nec ante convallis, non vulputate justo efficitur. Sed tincclassunt ac est eget volutpat. Nulla aliquet ut neque class faucibus. Pellentesque sapien lacus, volutpat ut lobortis sed, pretium sit amet sem. Vestibulum aliquam, metus sed efficitur ultrices, ante massa consequat turpis, sed fermentum nisi est class quam. Etiam sit amet lorem non tellus placerat rhoncus. Sed odio elit, dignissim in justo class, facilisis dictum elit. Nulla facilisi.</p>
										<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut euismod lobortis tristique. Suspendisse potenti. Mauris accumsan malesuada est. Aliquam at ipsum vel ligula scelerisque rutrum vel et turpis. Phasellus consectetur libero class neque euismod, nec consectetur diam dignissim. Suspendisse et metus ipsum. Curabitur eu tortor ac turpis tincclassunt accumsan. Maecenas a ligula feugiat, aliquam erat eu, ultrices sem. Nulla facilisi. Suspendisse et gravclassa elit. Aenean accumsan arcu sit amet ex ullamcorper fringilla.</p>
										<p>Nunc massa magna, tempus ac nisl class, suscipit fermentum velit. Sed eget turpis commodo, viverra ex eu, feugiat ligula. Donec euismod nulla a lorem venenatis, et tempus elit volutpat. Quisque non laoreet felis, eget tincclassunt nunc. Mauris imperdiet congue fermentum. Vestibulum sollicitudin eleifend sem eu aliquet. Ut viverra, augue eu suscipit sodales, lacus nisi pharetra diam, fringilla tristique sapien felis at mauris.</p>
									</div> <!-- #charotherstats -->
								</div> <!-- .lefttabcontent -->

								<div class="lefttabcontent lefttabstats2">

									<div class="equipcontainer">
										<div class="equipboxcont">
											<div class="equipbox eyesequip">
												Glasses
											</div>
											<div class="equipbox headequip"></div>
											<div class="equipbox neckequip">
												Amulet
											</div>
										</div>
										<div class="equipboxcont">
											<div class="equipbox weapequip mainhand"></div>
											<div class="armbox">
												<div class="equipbox armequip">
													Gloves
												</div>
												<div class="equipbox ringequip"></div>
											</div>
											<div class="equipbox bodyequip"></div>
											<div class="armbox">
												<div class="equipbox armequip">
													Bracers
												</div>
												<div class="equipbox ringequip"></div>
											</div>
											<div class="equipbox weapequip offhand"></div>
										</div>
										<div class="equipboxcont">
											<div class="equipbox waistequip">
												Belt
											</div>
										</div>
										<div class="equipboxcont">
											<div class="equipbox iounequip">
												Stone
											</div>
											<div class="equipbox feetequip">
												Boots
											</div>
											<div class="equipbox backpackequip">
												Backpack
											</div>
										</div>
									</div> <!-- #equipbox -->
								</div> <!-- .lefttabcontent -->

								<div class="lefttabcontent lefttabstats3">
									<h6>Feats</h6>
									<p>
									<?php
										foreach ($charfeat as $ft => $ft_value) {
											echo "<span class='statbox featstatbox'>";
											echo $charfeat[$ft];
											echo "</span>";
										}
									?>
									</p>
								</div> <!-- .lefttabcontent -->

								<div class="lefttabcontent lefttabstats4">

									<div class="charportrait">
										<div class="charavatarbox">
											<img src="images/thumbs/chars/testavatar.jpg" alt="Avatar">
										</div> <!-- #charavatarbox -->
										<div class="charabilities">
											<span><strong>Human, Legal Good</strong></span>
											<span><strong>Barbarian</strong> (10)</span>
											<hr>
											<div><span class="titlestatbox statbox"><strong>STR</strong></span> <span class="statbox">18</span> <span class="statbox">+4</span></div>
											<div><span class="titlestatbox statbox"><strong>DEX</strong></span> <span class="statbox">16</span> <span class="statbox">+3</span></div>
											<div><span class="titlestatbox statbox"><strong>CON</strong></span> <span class="statbox">18</span> <span class="statbox">+4</span></div>
											<div><span class="titlestatbox statbox"><strong>INT</strong></span> <span class="statbox">12</span> <span class="statbox">+1</span></div>
											<div><span class="titlestatbox statbox"><strong>WIS</strong></span> <span class="statbox">16</span> <span class="statbox">+3</span></div>
											<div><span class="titlestatbox statbox"><strong>CHA</strong></span> <span class="statbox">18</span> <span class="statbox">+4</span></div>
										</div><!-- #charabilities -->
									</div> <!-- #charportrait -->

									<div class="chardefense">
									</div> <!-- #chardefense -->

									<div class="charotherstats">
										<h6>Background</h6>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non laoreet lectus. Sed dignissim, ipsum ut facilisis rhoncus, diam orci tincclassunt quam, at pharetra enim neque quis lectus. Ut a enim nunc. Vivamus sodales massa vitae nulla porta, ac sagittis justo venenatis. Suspendisse feugiat ligula quam, quis aliquam dui pulvinar interdum. Curabitur nunc erat, semper vel felis et, dapibus lacinia lacus. Aenean in rutrum arcu. Nunc at tempor neque, sit amet ultrices nisl. Proin libero sem, rhoncus non commodo class, posuere quis purus. Nulla facilisi. Donec pretium metus sit amet ligula fringilla viverra. Nam auctor justo tincclassunt erat sagittis, in accumsan urna gravclassa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
										<p>Nam egestas metus et finibus fringilla. In class placerat velit. Nulla facilisi. Suspendisse sollicitudin lobortis dui at tristique. Sed blandit facilisis metus, sed varius est pretium sed. Pellentesque pretium leo class augue vulputate, vitae ullamcorper tellus egestas. Donec eleifend eu metus class semper. In hac habitasse platea dictumst. Aliquam dignissim eget purus ac cursus. Vivamus purus orci, sodales sit amet finibus vel, feugiat vel eros. In pharetra consequat nunc, vitae faucibus ipsum vulputate a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus vestibulum ligula fringilla tellus rhoncus imperdiet. Vivamus semper dictum laoreet. Quisque iaculis mattis lacus congue viverra. Morbi eget venenatis lectus.</p>
										<p>Ut interdum libero sit amet erat tempus, ut mollis sapien blandit. Donec imperdiet tempus ex, et sodales mauris ultrices vel. Ut tempus ornare justo, vitae condimentum velit fringilla ut. Sed non interdum urna. Curabitur vitae tincclassunt sapien, vel pretium urna. Maecenas iaculis eros quis dignissim condimentum. In non vestibulum lorem, vel suscipit lorem. Curabitur rhoncus sem nec erat ullamcorper dapibus. Integer egestas est nec ante convallis, non vulputate justo efficitur. Sed tincclassunt ac est eget volutpat. Nulla aliquet ut neque class faucibus. Pellentesque sapien lacus, volutpat ut lobortis sed, pretium sit amet sem. Vestibulum aliquam, metus sed efficitur ultrices, ante massa consequat turpis, sed fermentum nisi est class quam. Etiam sit amet lorem non tellus placerat rhoncus. Sed odio elit, dignissim in justo class, facilisis dictum elit. Nulla facilisi.</p>
										<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut euismod lobortis tristique. Suspendisse potenti. Mauris accumsan malesuada est. Aliquam at ipsum vel ligula scelerisque rutrum vel et turpis. Phasellus consectetur libero class neque euismod, nec consectetur diam dignissim. Suspendisse et metus ipsum. Curabitur eu tortor ac turpis tincclassunt accumsan. Maecenas a ligula feugiat, aliquam erat eu, ultrices sem. Nulla facilisi. Suspendisse et gravclassa elit. Aenean accumsan arcu sit amet ex ullamcorper fringilla.</p>
										<p>Nunc massa magna, tempus ac nisl class, suscipit fermentum velit. Sed eget turpis commodo, viverra ex eu, feugiat ligula. Donec euismod nulla a lorem venenatis, et tempus elit volutpat. Quisque non laoreet felis, eget tincclassunt nunc. Mauris imperdiet congue fermentum. Vestibulum sollicitudin eleifend sem eu aliquet. Ut viverra, augue eu suscipit sodales, lacus nisi pharetra diam, fringilla tristique sapien felis at mauris.</p>
									</div> <!-- #charotherstats -->
								</div> <!-- .lefttabcontent -->

							</div> <!-- #leftbox -->


							<div class="charbox rightbox">

								<div class="chartabs">
									<button class="stattab tab1 selectedtab" onclick="showTab('1')">Stats</button>
									<button class="stattab tab2" onclick="showTab('2')">Equipment</button>
									<button class="stattab tab3" onclick="showTab('3')">Skills & Feats</button>
									<button class="stattab tab4" onclick="showTab('4')">Magic</button>
								</div> <!-- #chartabs -->

								<div class="righttabcontent righttabstats1 visible">
									<h6>Saving Throws</h6>
									<div class="savingthrows">

										<div class="statcontainer">
											<span class="titlestatbox statbox">Fort</span>
											<span class="statbox">12</span>
										</div> <!-- .statcontainer -->

										<div class="statcontainer">
											<span class="titlestatbox statbox">Refl</span>
											<span class="statbox">7</span>
										</div> <!-- .statcontainer -->

										<div class="statcontainer">
											<span class="titlestatbox statbox">Will</span>
											<span class="statbox">7</span>
										</div> <!-- .statcontainer -->

									</div> <!-- #savingthrows -->

									<hr>

									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non laoreet lectus. Sed dignissim, ipsum ut facilisis rhoncus, diam orci tincclassunt quam, at pharetra enim neque quis lectus. Ut a enim nunc. Vivamus sodales massa vitae nulla porta, ac sagittis justo venenatis. Suspendisse feugiat ligula quam, quis aliquam dui pulvinar interdum. Curabitur nunc erat, semper vel felis et, dapibus lacinia lacus. Aenean in rutrum arcu. Nunc at tempor neque, sit amet ultrices nisl. Proin libero sem, rhoncus non commodo class, posuere quis purus. Nulla facilisi. Donec pretium metus sit amet ligula fringilla viverra. Nam auctor justo tincclassunt erat sagittis, in accumsan urna gravclassa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
									<p>Nam egestas metus et finibus fringilla. In class placerat velit. Nulla facilisi. Suspendisse sollicitudin lobortis dui at tristique. Sed blandit facilisis metus, sed varius est pretium sed. Pellentesque pretium leo class augue vulputate, vitae ullamcorper tellus egestas. Donec eleifend eu metus class semper. In hac habitasse platea dictumst. Aliquam dignissim eget purus ac cursus. Vivamus purus orci, sodales sit amet finibus vel, feugiat vel eros. In pharetra consequat nunc, vitae faucibus ipsum vulputate a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus vestibulum ligula fringilla tellus rhoncus imperdiet. Vivamus semper dictum laoreet. Quisque iaculis mattis lacus congue viverra. Morbi eget venenatis lectus.</p>
									<p>Ut interdum libero sit amet erat tempus, ut mollis sapien blandit. Donec imperdiet tempus ex, et sodales mauris ultrices vel. Ut tempus ornare justo, vitae condimentum velit fringilla ut. Sed non interdum urna. Curabitur vitae tincclassunt sapien, vel pretium urna. Maecenas iaculis eros quis dignissim condimentum. In non vestibulum lorem, vel suscipit lorem. Curabitur rhoncus sem nec erat ullamcorper dapibus. Integer egestas est nec ante convallis, non vulputate justo efficitur. Sed tincclassunt ac est eget volutpat. Nulla aliquet ut neque class faucibus. Pellentesque sapien lacus, volutpat ut lobortis sed, pretium sit amet sem. Vestibulum aliquam, metus sed efficitur ultrices, ante massa consequat turpis, sed fermentum nisi est class quam. Etiam sit amet lorem non tellus placerat rhoncus. Sed odio elit, dignissim in justo class, facilisis dictum elit. Nulla facilisi.</p>
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut euismod lobortis tristique. Suspendisse potenti. Mauris accumsan malesuada est. Aliquam at ipsum vel ligula scelerisque rutrum vel et turpis. Phasellus consectetur libero class neque euismod, nec consectetur diam dignissim. Suspendisse et metus ipsum. Curabitur eu tortor ac turpis tincclassunt accumsan. Maecenas a ligula feugiat, aliquam erat eu, ultrices sem. Nulla facilisi. Suspendisse et gravclassa elit. Aenean accumsan arcu sit amet ex ullamcorper fringilla.</p>
									<p>Nunc massa magna, tempus ac nisl class, suscipit fermentum velit. Sed eget turpis commodo, viverra ex eu, feugiat ligula. Donec euismod nulla a lorem venenatis, et tempus elit volutpat. Quisque non laoreet felis, eget tincclassunt nunc. Mauris imperdiet congue fermentum. Vestibulum sollicitudin eleifend sem eu aliquet. Ut viverra, augue eu suscipit sodales, lacus nisi pharetra diam, fringilla tristique sapien felis at mauris.</p>
								</div> <!-- #righttabstats1 -->

								<div class="righttabcontent righttabstats2">
									<div class="inventorybox">
										<h6>Your Backpack</h6>
										<div class="inventorycontent">
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
											<span class="itemname">Item</span> <span class="itemweight">Kg</span> <button class="itemequip">Equip</button>
										</div> <!-- #inventorycontent -->
										<div class="inventorytotal">
											<span class="itemname"><strong>TOTAL</strong></span> <span class="itemweight"><strong>Kg</strong></span>
										</div> <!-- #inventorytotal -->
									</div> <!-- #inventorybox -->
								</div> <!-- #righttabstats2 -->

								<div class="righttabcontent righttabstats3">
									<h6>Skill Points</h6>

									<?php
											if (count($charskill) > 0) {

												foreach ($charskill as $sk => $sk_value) {
													if ($sk != 'lvl' and $sk != 'sp') {
														echo "<div class='statcontainer'>";
															echo "<span class='statbox skillstatbox'";
																if ($ddskillunt[$sk] != null) {
																	echo " style='color: rgb(230,230,230)'";
																}
															echo ">" . $ddskillname[$sk] . "</span>";
															echo "<span class='statbox abilitystatbox'";
																if ($ddskillunt[$sk] != null) {
																	echo " style='color: rgb(230,230,230)'";
																}
															echo ">" . $abilshtname[$ddskillkey[$sk]];
															if ($ddskillarmpen[$sk] != null) {
																echo "*";
																if ($sk == "swim") {
																	echo "*";
																}
															}
															echo "</span>";
															echo "<span class='statbox totalskillstatbox'>";
																if ($ddskillunt[$sk] != null or $sk_value > 0) {
																	echo $charmodabil[$ddskillkey[$sk]] + $sk_value;
																}
															echo "</span>= ";
															echo "<span class='statbox'>" . $charmodabil[$ddskillkey[$sk]] . "</span>+ ";
															echo "<span class='statbox'>";
																if ($sk_value > 0) {
																	echo $sk_value;
																}
															echo "</span>+ ";
															echo "<span class='statbox'>" . $sk_value . "</span>+ ";
															echo "<span class='statbox'>";
															if ($ddskillarmpen[$sk] != null) {
																echo $ddskillarmpen[$sk] * -1;
															}
															echo "</span>";
														echo "</div> <!-- .statcontainer -->";
													}
												}

											} else {
												echo $row['charname'] . " doesn't have any skill set yet.";
											}
									?>

								</div> <!-- #righttabstats3 -->

								<div class="righttabcontent righttabstats4">
									<h6>Magic</h6>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non laoreet lectus. Sed dignissim, ipsum ut facilisis rhoncus, diam orci tincclassunt quam, at pharetra enim neque quis lectus. Ut a enim nunc. Vivamus sodales massa vitae nulla porta, ac sagittis justo venenatis. Suspendisse feugiat ligula quam, quis aliquam dui pulvinar interdum. Curabitur nunc erat, semper vel felis et, dapibus lacinia lacus. Aenean in rutrum arcu. Nunc at tempor neque, sit amet ultrices nisl. Proin libero sem, rhoncus non commodo class, posuere quis purus. Nulla facilisi. Donec pretium metus sit amet ligula fringilla viverra. Nam auctor justo tincclassunt erat sagittis, in accumsan urna gravclassa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
									<p>Nam egestas metus et finibus fringilla. In class placerat velit. Nulla facilisi. Suspendisse sollicitudin lobortis dui at tristique. Sed blandit facilisis metus, sed varius est pretium sed. Pellentesque pretium leo class augue vulputate, vitae ullamcorper tellus egestas. Donec eleifend eu metus class semper. In hac habitasse platea dictumst. Aliquam dignissim eget purus ac cursus. Vivamus purus orci, sodales sit amet finibus vel, feugiat vel eros. In pharetra consequat nunc, vitae faucibus ipsum vulputate a. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus vestibulum ligula fringilla tellus rhoncus imperdiet. Vivamus semper dictum laoreet. Quisque iaculis mattis lacus congue viverra. Morbi eget venenatis lectus.</p>
									<p>Ut interdum libero sit amet erat tempus, ut mollis sapien blandit. Donec imperdiet tempus ex, et sodales mauris ultrices vel. Ut tempus ornare justo, vitae condimentum velit fringilla ut. Sed non interdum urna. Curabitur vitae tincclassunt sapien, vel pretium urna. Maecenas iaculis eros quis dignissim condimentum. In non vestibulum lorem, vel suscipit lorem. Curabitur rhoncus sem nec erat ullamcorper dapibus. Integer egestas est nec ante convallis, non vulputate justo efficitur. Sed tincclassunt ac est eget volutpat. Nulla aliquet ut neque class faucibus. Pellentesque sapien lacus, volutpat ut lobortis sed, pretium sit amet sem. Vestibulum aliquam, metus sed efficitur ultrices, ante massa consequat turpis, sed fermentum nisi est class quam. Etiam sit amet lorem non tellus placerat rhoncus. Sed odio elit, dignissim in justo class, facilisis dictum elit. Nulla facilisi.</p>
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut euismod lobortis tristique. Suspendisse potenti. Mauris accumsan malesuada est. Aliquam at ipsum vel ligula scelerisque rutrum vel et turpis. Phasellus consectetur libero class neque euismod, nec consectetur diam dignissim. Suspendisse et metus ipsum. Curabitur eu tortor ac turpis tincclassunt accumsan. Maecenas a ligula feugiat, aliquam erat eu, ultrices sem. Nulla facilisi. Suspendisse et gravclassa elit. Aenean accumsan arcu sit amet ex ullamcorper fringilla.</p>
									<p>Nunc massa magna, tempus ac nisl class, suscipit fermentum velit. Sed eget turpis commodo, viverra ex eu, feugiat ligula. Donec euismod nulla a lorem venenatis, et tempus elit volutpat. Quisque non laoreet felis, eget tincclassunt nunc. Mauris imperdiet congue fermentum. Vestibulum sollicitudin eleifend sem eu aliquet. Ut viverra, augue eu suscipit sodales, lacus nisi pharetra diam, fringilla tristique sapien felis at mauris.</p>
								</div> <!-- #righttabstats4 -->

							</div> <!-- #rightbox -->

						</div>

					</div>
					<!-- This is the end of Character Sheet Modal Box -->

					<?php
						include "frames/levelup.php";   // Cofiguration file for the Database connection
					?>
