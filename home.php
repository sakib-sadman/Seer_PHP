<?php 
session_start();
include "db_connect.php";

if(isset($_SESSION['LAST_ACTIVE_TIME'])){
    if((time() - $_SESSION['LAST_ACTIVE_TIME']) > 500)
        {
            header('location:logout.php');
            die();
        }
}

$_SESSION['LAST_ACTIVE_TIME'] = time();
if(!isset($_SESSION['IS_LOGIN']))
{
    header('location:home.php');
    die();
}

$id=$_SESSION['student_id'];

$query="SELECT * from course where student_id = '$id' ";

$result=mysqli_query($conn,$query);



if (isset($_SESSION['student_id']) && isset($_SESSION['s_name'])) {

 ?>
<!DOCTYPE html>
<html>
     <head>
     <title>Student Home</title>

     <link rel="stylesheet" href="stylesheet.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
     </head>

<body>
<div class="top">
        <div class="layout">
        <div class="layoutc1">
   
        </div>
          <div class="layoutc2">

          <button class="ui orange button huge" id="buttonbox" onclick="window.location.href = 'logout.php';">Logout</button>
          

          </div>
            
         </div>
        <div class="hmid">
            <div class="hmid_top">
            
               <div class="hmid_top-l">

                    <h1 class="welcome1">
                       Hello<span class="spanw"><st><?php
                        echo $_SESSION['s_name'];
                       ?><br>
                       <?php
                        echo $_SESSION['student_id'];
                       ?></st></span> 
                    </h1>

               </div>
               <div class="hmid_top-r">

               </div>
               
            </div>
            <br>
            <div class="c1">
                        <button class="ui orange button large" id="buttonbox" onclick="window.location.href = 's_allcourses.php';">Enroll Course</button>
            </div>
            <br>    
            <div class="hmid_bot">
                <table class="ui celled table">
                    <thead>
                        <tr><th>Course</th>
                        <th>Section</th>
                        <th>Goal</th>
                    </tr></thead>
                    <tbody>
                    <?php   

                            while($info=$result->fetch_assoc())
                            {
                                ?>
                                <tr>

                                <?php

                                echo"<td>{$info['c_name']}</td>";

                                echo"<td>{$info['section']}</td>";

                                echo"<td>{$info['goal']}</td>";

                                echo"<td><a href='track.php?cn={$info['c_name']}'>Track</a> </td>";

                                ?>

                                </tr>

                            <?php

                            }

                            ?>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="bottom">

        </div>
    </div>
     
</body>
</html>

<?php 
}
else{
     header("Location: welcome.php");
     exit();
}
 ?>

