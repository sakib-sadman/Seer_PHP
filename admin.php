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
    header('location:admin.php');
    die();
}

$id=$_SESSION['admin_id'];

$query="SELECT * from all_courses";

$result=mysqli_query($conn,$query);



if (isset($_SESSION['admin_id']) && isset($_SESSION['ad_name'])) {

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <link rel="stylesheet" href="admin.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">

    <title>Admin Panel</title>
</head>
<body>
    <div class="pagebody">
        <div class="layout">

        </div>

        <div class="mid">

            <div class="c1">
                <button class="ui orange button large" id="buttonbox" onclick="window.location.href = 'admincourses.php';">New Course</button>
            </div>
            <br>
            <br>

            <div class="c2">
            <table  border="5px" align-content="center" width="900px" height="100px">
                    <tr>
                        <th>Course Name</th>
                        <th>Course Code</th>
                    </tr>

                    <?php
                        while ($info = $result->fetch_assoc()) {
                    ?>
                        <tr>
                            <?php
                                echo "<td>{$info['c_name']}</td>";
                                echo "<td>{$info['c_id']}</td>";
                            ?>
                        </tr>
                    <?php
                    }
                    ?>
                </table>
            </div> 

            

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


