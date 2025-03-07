<?php
$keys = array(
    "KeY-Kuut1-nubula-hub12",
    "Keee3Y-Ku12ut1-n1ubu7la-hub000"
);

$sub = $_GET["key"];
$ip = $_SERVER['REMOTE_ADDR'];
$file = 'used_keys.txt';

// โหลดคีย์ที่ถูกใช้ไปแล้ว
$used_keys = file_exists($file) ? file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) : [];

$key_found = false;

foreach ($used_keys as $entry) {
    list($used_key, $used_ip) = explode("|", $entry);

    // ถ้าคีย์ที่ใช้อยู่ในลิสต์และเป็น IP เดิม → ให้ใช้ได้
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
    file_put_contents($file, "$sub|$ip\n", FILE_APPEND);
    echo "Whitelisted (New User)";
} else {
    echo "Not Whitelisted";
}
?>
