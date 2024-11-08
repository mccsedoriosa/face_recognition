<?php
include 'includes/dbcon.php';
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="admin/img/logo/favicon.ico" rel="icon">
  <title>FaceMe | Login</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <link rel="stylesheet" href="css/styles.css">
</head>

<body>
  <div class="main-container">
    <div class="login-container">
      <div class="form-container" id="signin">
        <h1>Login to FaceMe</h1>
        <div id="messageDiv" class="messageDiv" style="display:none;"></div>

        <form method="post" action="">
          <select required name="userType">
            <option value="">--Select User Roles--</option>
            <option value="Administrator">Administrator</option>
            <option value="Instructor">Instructor</option>
      </select>
          <input type="text" name="email" placeholder="Username" required>
          <input type="password" name="password" placeholder="password" required>
          <p class="recover">
            <!-- <a href="#">Recover Password</a> -->
          </p>
          <input type="submit" class="btn-login" value="Login" name="login" />
        </form>
        <!-- <a href="Test_API/index.html"><button class="btn-test-api">Test API</button></a> -->
        <p class="or">
          <!-- -------- or -------- -->
        </p>
        <div class="icons">
          <!-- <i class="fab fa-google"></i>
          <i class="fab fa-facebook"></i> -->
        </div>
      </div>
      <div class="footer">
        <!-- <p>Fulfilling the requirements for the IT 142 System Integration <br> & Architecture subject.</p>
        <p id="copyright">© 2024 Bryan Mangapit. All Rights Reserved.</p> -->
      </div>
    </div>
    <div class="info-container">
      <div class="overlay">
        <img src="assets/back.jpg" alt="University Image" class="background-image">
        <div class="title">
          <img src="assets/slsu.png" width="120px" alt="MMSU Logo" class="mmsu-logo">
          <img src="assets/ccsit.jpg" width="110px" alt="MMSU Logo" class="ccis-logo">
          <h1>Face Recognition Attendance System</h1>
        </div>
        <div class="content">
          <h3 id="project-name">FaceMe</h3>
          <p id="project-description">"Say goodbye to manual roll calls with advanced facial recognition technology for effortless attendance tracking."</p>
        </div>
      </div>
    </div>
  </div>

  <script>
    function showMessage(message) {
      var messageDiv = document.getElementById('messageDiv');
      messageDiv.style.display = "block";
      messageDiv.innerHTML = message;
      messageDiv.style.opacity = 1;
      setTimeout(function() {
        messageDiv.style.opacity = 0;
      }, 5000);
    }
  </script>
  <?php
  if(isset($_POST['login'])){

    $userType = $_POST['userType'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $password = md5($password);

if($userType == "Administrator"){
    
      $query = "SELECT * FROM tbladmin WHERE emailAddress = '$email' and password='$password'  ";
      $rs = $conn->query($query);
      $num = $rs->num_rows;
      $rows = $rs->fetch_assoc();

      if($num > 0){

        $_SESSION['userId'] = $rows['Id'];
        $_SESSION['firstName'] = $rows['firstName'];
        $_SESSION['emailAddress'] = $rows['emailAddress'];

        echo "<script type = \"text/javascript\">
        window.location = (\"Admin/index.php\")
        </script>";
      }

      else{

        $message = " Invalid Username/Password!";
        echo "<script>showMessage('" . $message . "');</script>";

      }
    }
    else if($userType == "Instructor"){

      $query = "SELECT * FROM tbllecture WHERE emailAddress = '$email' and password='$password' "; 
       
      $rs = $conn->query($query);
      $num = $rs->num_rows;
      $rows = $rs->fetch_assoc();

      if($num > 0){

        $_SESSION['userId'] = $rows['Id'];
       
        echo "<script type = \"text/javascript\">
        window.location = (\"lecture/takeAttendance.php\")
        </script>";
       
     
      
      }

      else{

        $message = " Invalid Username/Password!";
        echo "<script>showMessage('" . $message . "');</script>";

      }
    }
    else{

    
    

    }
}
?>
</body>

</html>