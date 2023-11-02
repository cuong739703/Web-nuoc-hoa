<?php
  $mysqli = new mysqli("localhost","root","739703","literaturelounge_data");
  if ($mysqli -> connect_errno) {
    echo "Kết nối thất bại: " . $mysqli -> connect_error;
    exit();
  }
?>