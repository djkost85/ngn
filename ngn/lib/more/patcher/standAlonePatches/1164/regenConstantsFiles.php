<?php

function patch_1164_regenConstantsFiles($webrootFolder, $fromNgnFolder, $toNgnFolder) {

// -- File: C:\a\www-ngn/ngn/lib/more/patcher/standAlonePatches/regenConstantsFiles.php

ConfigReset::rebuildConstants($webrootFolder.'/site', $toNgnFolder);
}
