<?php

$dbConnection = mysqli_connect("localhost", "caio", "1234", "teste");

if (!$dbConnection) {
	echo "Connection info: " . mysqli_connect_errno();
} else {
	echo "Connection info: " . mysqli_get_host_info($dbConnection);
	echo "<ul>";
	foreach($dbConnection->query("SELECT * FROM teste") as $row) {
		echo "<li>" . $row['content'] . "</li>";
	}
	echo "</ul>";
}

?>
