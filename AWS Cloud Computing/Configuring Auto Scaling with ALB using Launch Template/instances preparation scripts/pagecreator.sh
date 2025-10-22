sudo tee /var/www/html/index.php > /dev/null <<'EOF'
<?php
function get_metadata($path) {
    // Step 1: Request IMDSv2 token
    $ch = curl_init('http://169.254.169.254/latest/api/token');
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['X-aws-ec2-metadata-token-ttl-seconds: 21600']);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $token = curl_exec($ch);
    curl_close($ch);

    // Step 2: Use token to fetch metadata
    $url = "http://169.254.169.254/latest/meta-data/" . $path;
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["X-aws-ec2-metadata-token: $token"]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result = curl_exec($ch);
    curl_close($ch);

    return $result ?: "Unavailable";
}

// Fetch instance metadata using IMDSv2
$instance_id = get_metadata("instance-id");
$availability_zone = get_metadata("placement/availability-zone");

// Get CPU load average and convert to percentage
$load = sys_getloadavg();
$cpu_cores = (int) shell_exec("nproc") ?: 1;  // number of CPU cores
$cpu_load_percentage = round(($load[0] / $cpu_cores) * 100, 2);

// Display nicely formatted info
echo "<h2>Welcome to Instance-2</h2>";
echo "<p><b>Instance ID:</b> $instance_id</p>";
echo "<p><b>Availability Zone:</b> $availability_zone</p>";
echo "<p><b>Current CPU Load (1 min):</b> {$cpu_load_percentage}%</p>";
echo "<p>Served by: <b>$instance_id</b></p>";
?>
EOF
