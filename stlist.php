<?php
    session_start();

    include "db_connect.php";

    $cname=$_GET['cn'];
    $id=$_SESSION['teacher_id'];
    

    $sql="SELECT section FROM course WHERE teacher_id = '$id' AND c_name = '$cname'";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    $tsec= $row['section'];
    

    $sql2 = "SELECT course.student_id, student.s_name FROM course JOIN student ON course.student_id = student.student_id WHERE section ='$tsec' AND c_name = '$cname'";
    $result2 = mysqli_query($conn, $sql2);

    $sql3 = "SELECT * FROM marks WHERE c_name = '$cname' AND section = '$tsec'";
    $result3 = mysqli_query($conn, $sql3);


    
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="stlist.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <title>Student List</title>
</head>
<body>
    <h1><?php echo $cname;?></h1>
    <h2><?php echo $row['section']?></h2>
    <div class="hmid_top">
            
        <div class="hmid_top-l">
            <h1 class="welcome1">
                <?php
                echo $_SESSION['t_name'];
                ?><br>
                <?php
                echo $_SESSION['teacher_id'];
                ?></st></span> 
            </h1>
        </div>
        <div class="hmid_top-r">
        </div>
    </div>

    <div class="mid">
        <br>
        
        <br>
    
    <table class="ui very basic collapsing celled table">
        
        <th>
            <tr>
                <th id="tablebox">Student</th>
                <th id="tablebox">CT 1</th>
                <th id="tablebox">CT 2</th>
                <th id="tablebox">CT 3</th>
                <th id="tablebox">CT 4</th>
                <th id="tablebox">CT 5</th>
                <th id="tablebox">Mid</th>
                <th id="tablebox">Final</th>
                <th id="tablebox">Assignment </th>
                <th id="tablebox">Attendance</th>
            </tr>
        </th>

        <tbody>
    <?php
		while ($row3 = mysqli_fetch_assoc($result3)) {
	?>
        <form action="stlistworks.php" method="POST" enctype="multipart/form-data">
		<tr>
            <div id="l1">
                <input type="text" class="form-control" id="inputs" name="id" value="<?php echo "{$row3['student_id']}";?>" hidden>
            </div>
            <div id="l1">
                <input type="text" class="form-control" id="inputs" name="cname" value="<?php echo "{$row3['c_name']}";?>" hidden>
            </div>
            <td>
            <div id="l1">
		    <?php
                echo $row3['student_id'];
            ?>
            </div>
            <div id="l1">
                <?php				
                echo $row3['s_name'];				
			?>
            </div>
            </td>
            
            <td>
                <div id="l1">
                    <input type="text" class="form-control" id="inputs" name="ct1" value="<?php echo "{$row3['ct1']}";?>">
                </div>
            </td>
            <td>
                <div id="l1">
                    <input type="text" class="form-control" id="inputs" name="ct2" value="<?php echo "{$row3['ct2']}";?>">
                </div>
            </td>
            <td>
                <div id="l1">
                    <input type="text" class="form-control" id="inputs" name="ct3" value="<?php echo "{$row3['ct3']}";?>">
                </div>
            </td>
            <td>
                <div id="l1">
                    <input type="text" class="form-control" id="inputs" name="ct4" value="<?php echo "{$row3['ct4']}";?>">
                </div>
            </td>
            <td>
                <div id="l1">
                    <input type="text" class="form-control" id="inputs" name="ct5" value="<?php echo "{$row3['ct5']}";?>">
                </div>
            </td>
            <td>
                <div id="l1">
                    <input type="text" class="form-control" id="inputs" name="mid" value="<?php echo "{$row3['mid']}";?>">
                </div>
            </td>
            <td>
                <div id="l1">
                    <input type="text" class="form-control" id="inputs" name="final" value="<?php echo "{$row3['final']}";?>">
                </div>
            </td>
            <td>
                <div id="l1">
                    <input type="text" class="form-control" id="inputs" name="assignment" value="<?php echo "{$row3['assignment']}";?>">
                </div>
            </td>
            <td>
                <div id="l1">
                    <input type="text" class="form-control" id="inputs" name="attendance" value="<?php echo "{$row3['attendance']}";?>">
                </div>
            </td>
		</tr>
         
			<?php
        }
			?>
            <button type="submit" name ="update" class="ui inverted orange button large" id="buttonedit" href="stlist.php">Update</button>
            </form>
        </tbody>
    </table>

    
    </div>

       
    
</body>
</html>