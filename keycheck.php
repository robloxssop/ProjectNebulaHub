<?php
// ตรวจจับเว็บเบราว์เซอร์
$user_agent = $_SERVER['HTTP_USER_AGENT'];
$browser = "Unknown Browser";

if (strpos($user_agent, 'MSIE') !== FALSE) $browser = "MSIE";
elseif (strpos($user_agent, 'Trident') !== FALSE) $browser = "Trident";
elseif (strpos($user_agent, 'Firefox') !== FALSE) $browser = "Firefox";
elseif (strpos($user_agent, 'Chrome') !== FALSE) $browser = "Chrome";
elseif (strpos($user_agent, 'Opera Mini') !== FALSE) $browser = "Opera Mini";
elseif (strpos($user_agent, 'Opera') !== FALSE) $browser = "Opera";
elseif (strpos($user_agent, 'Safari') !== FALSE) $browser = "Safari";
elseif (strpos($user_agent, 'Mozilla') !== FALSE) $browser = "Mozilla";

echo "\n$browser";

// ข้อมูลผู้ใช้
$protocol = $_SERVER['SERVER_PROTOCOL'];
$ip = $_SERVER['REMOTE_ADDR'];
$port = $_SERVER['REMOTE_PORT'];
$agent = $_SERVER['HTTP_USER_AGENT'];
$hostname = gethostbyaddr($ip);

// บันทึกข้อมูลลง logs.txt (ป้องกันซ้ำซ้อน)
$file_log = 'logs.txt';
$log_entry = "$ip - $agent\n";

if (!file_exists($file_log) || strpos(file_get_contents($file_log), $ip) === FALSE) {
    file_put_contents($file_log, $log_entry, FILE_APPEND | LOCK_EX);
}

// คีย์ที่อนุญาต
$keys = array(
    "KeY-Kuut1-nubula-hub12",
    "Keee3Y-Ku12ut1-n1ubu7la-hub000"
);

// ตรวจสอบพารามิเตอร์ key
if (!isset($_GET["key"])) {
    echo "Error: No key provided.";
    exit;
}

$sub = trim($_GET["key"]);
$file_keys = 'used_keys.txt';

// โหลดคีย์ที่ถูกใช้ไปแล้ว
$used_keys = file_exists($file_keys) ? file($file_keys, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) : [];

foreach ($used_keys as $entry) {
    $data = explode("|", $entry);

    if (count($data) != 2) continue;

    list($used_key, $used_ip) = $data;

    // ถ้าคีย์ถูกใช้ไปแล้วโดย IP เดิม → ให้ใช้ได้
    if ($used_key == $sub && $used_ip == $ip) {
        echo "Whitelisted (Returning User)";
        exit;
    }

    // ถ้าคีย์ถูกใช้แล้วโดย IP อื่น → ปฏิเสธ
    if ($used_key == $sub && $used_ip != $ip) {
        echo "Key already used by another IP: $used_ip";
        exit;
    }
}

// ถ้าคีย์ยังไม่เคยถูกใช้ → บันทึกและให้ใช้งาน
if (in_array($sub, $keys, TRUE)) {
    file_put_contents($file_keys, "$sub|$ip\n", FILE_APPEND | LOCK_EX);
    echo "Whitelisted (New User)";
} else {
    echo "Not Whitelisted";
}
?>
