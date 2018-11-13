	
	
					<!-- This is the Character Sheet Modal Box -->
					<div id="levelupmodal<?php echo $row['id'] ?>" class="modal">
						<button class="close" onclick="closeModal('levelupmodal<?php echo $row['id'] ?>')">X</button>

						<div class="sheetbox">

							<div class="charbox leftbox">
								
								<div class="chartabs">
									<button class="stattab tab1 selectedtab" onclick="showTab('1')">Classes</button>
									<button class="stattab tab2" onclick="showTab('2')">Ability Points</button>
									<button class="stattab tab3" onclick="showTab('3')">Skills Points</button>
									<button class="stattab tab4" onclick="showTab('4')">Feats</button>
								</div> <!-- #chartabs -->
								
								<div class="lefttabcontent lefttabstats1 visible">
									<h6>Select Class</h6>
									<div class="tabmainbox">
										<input class="hidden setcls" type="radio" name="class1" value="" checked>
										<?php
											foreach ($ddclassname as $cls => $cls_value) {
												echo "<span class='statbox classstatbox'>";
												echo $cls_value . "<button type='button' onclick=''></button>";
												echo "</span>";								
											}
										?>
									</div> <!-- .tabmainbox -->
								</div> <!-- .lefttabstats1 -->
								
								<div class="lefttabcontent lefttabstats2">
									<h6>Ability Points</h6>
									<div class="tabmainbox">
										<?php
											foreach ($abilname as $abn => $abn_value) {
												echo "<span class='statbox classstatbox'>";
												echo "	<input type='radio' name='class1' value='" . $abn . "'>  " . $abn_value . "<br>";
												echo "</span>";								
											}
										?>
									</div> <!-- .tabmainbox -->
								</div> <!-- .lefttabstats2 -->
								
								<div class="lefttabcontent lefttabstats3">
									<h6>Skills Points</h6>
									<div class="tabmainbox">
										<?php
											foreach ($ddskillname as $skn => $skn_value) {
												if ($skn_value != 1 and $skn_value != 'Skill Name') {
													echo "<span class='statbox classstatbox'>";
													echo "	<input type='radio' name='class1' value='" . $skn . "'>  " . $skn_value . "<br>";
													echo "</span>";
												}
											}
										?>
									</div> <!-- .tabmainbox -->
								</div> <!-- .lefttabstats3 -->
								
								<div class="lefttabcontent lefttabstats4">
									<h6>Feats</h6>
									<div class="tabmainbox">
										<?php
											foreach ($abilname as $abn => $abn_value) {
												echo "<span class='statbox classstatbox'>";
												echo "	<input type='radio' name='class1' value='" . $abn . "'>  " . $abn_value . "<br>";
												echo "</span>";								
											}
										?>
									</div> <!-- .tabmainbox -->
								</div> <!-- .lefttabstats4 -->
								
								<div class="lefttabcontent lefttabstats5">
									<h6>Spells</h6>
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .lefttabstats5 -->
								
								<div class="lefttabcontent lefttabstats6">
									<h6>Equipment</h6>
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .lefttabstats6 -->
								
								<div class="lefttabcontent lefttabstats7">
									<h6>Details</h6>
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .lefttabstats7 -->
								
							</div> <!-- .leftbox -->


							<div class="charbox rightbox">
								
								<div class="chartabs">
									<button class="stattab tab5" onclick="showTab('5')">Spells</button>
									<button class="stattab tab6" onclick="showTab('6')">Equipment</button>
									<button class="stattab tab7" onclick="showTab('7')">Details</button>
								</div> <!-- .chartabs -->
								
								<div class="righttabcontent righttabstats1 visible">
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .righttabstats1 -->
								
								<div class="righttabcontent righttabstats2">
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .righttabstats2 -->
								
								<div class="righttabcontent righttabstats3">
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .righttabstats3 -->
								
								<div class="righttabcontent righttabstats4">
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .righttabstats4 -->
							
								<div class="righttabcontent righttabstats5">
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .righttabstats5 -->
							
								<div class="righttabcontent righttabstats6">
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .righttabstats6 -->
							
								<div class="righttabcontent righttabstats7">
									<div class="tabmainbox">
									</div> <!-- .tabmainbox -->
								</div> <!-- .righttabstats7 -->
							
							</div> <!-- .rightbox -->
							
						</div>
						
					</div>
					<!-- This is the end of Character Sheet Modal Box -->

