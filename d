connect 

<?php

$con=new mysqli('localhost', 'root','aashva','crudoperation');

if (!$con){

        die(mysqli_error($con));
}
?>

delete
<?php

include 'connect.php';
if(isset($_GET['deleteid'])){
    $id=$_GET['deleteid'];
$sql="delete from `crud` where id=$id";
$result=mysqli_query($con,$sql);
if($result){
    // echo "deleted successfully";
    header('location: display.php');
}else
{
    die(mysqli_error($con));
}

}

display
<?php
include 'connect.php';?>



<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >

    <title>crud operation</title>
  </head>
  <body>
  <div class="container my-5" >
    <button ><a href="index.php">add user</a></button>
    <table class="table">
  <thead>
    <tr>
      <th scope="col">sr no</th>
      <th scope="col">name</th>
      <th scope="col">email</th>
      <th scope="col">mobile</th>
      <th scope="col">password</th>
      <th scope="col">operations</th>
    </tr>
  </thead>

  <tbody>
    <?php
    $sql="select * from `crud` ";
    $result=mysqli_query($con,$sql);
    if($result){
        while($row=mysqli_fetch_assoc($result)){
            $id=$row['id'];    
       $name=$row['name'];
    $email=$row['email'];
    $mobile=$row['mobile'];
    $password=$row['password'];
        echo ' <tr>
        <th scope="row">'.$id.'</th>
        <td>'.$name.'</td>
        <td>'.$email.'</td>
        <td>'.$mobile.'</td>
        <td>'.$password.'</td>
        <td> 
    <button><a href="update.php?updateid='.$id.'">update</a></button>
    <button><a href="delete.php? deleteid='.$id.'">delete</a></button>
</td>
      </tr>';
    } 
}
?>

</tbody>
</table>
</div>

  </body>
  </html>


index 

<?php
include 'connect.php';
if(isset($_POST['submit'])){
    $name=$_POST['name'];
    $email=$_POST['email'];
    $mobile=$_POST['mobile'];
    $password=$_POST['password'];
  

    $sql=" insert into `crud`(name ,email, mobile, password) values ( '$name','$email','$mobile','$password')";

    $result=mysqli_query($con,$sql);
    if($result){
       // echo "data inserted successfully";
       header('location:display.php');

    }else {
        die(mysqli_error($con));
    }

}
?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >

    <title>crud operation</title>
  </head>
  <body>
    <div class="container my-5" >
    <form method ="post">
  <div class="form-group">
    <label>Name</label>
    <input type="text" class="form-control" placeholder="Enter your name"name="name" autocomplete="off">
</div>

<div class="form-group">
    <label>email</label>
    <input type="email" class="form-control" placeholder="Enter your email"name="email" autocomplete="off">
</div>
<div class="form-group">
    <label>mobile</label>
    <input type="text" class="form-control" placeholder="Enter your mobile"name="mobile" autocomplete= "off">
</div>
<div class="form-group">
    <label>password</label>
    <input type="text" class="form-control" placeholder="Enter your password"name="password" autocomplete="off">
</div>
    
  <button type="submit" class="btn btn-primary"name="submit">Submit</button>
</form>
</div>

  </body>
</html>

update

<?php
include 'connect.php';
$id=$_GET['updateid'];

$sql="select * from `crud` where id=$id";
$result=mysqli_query($con,$sql);
$row=mysqli_fetch_assoc($result);
$name=$row['name'];
    $email=$row['email'];
    $mobile=$row['mobile'];
    $password=$row['password'];


if(isset($_POST['submit'])){
    $name=$_POST['name'];
    $email=$_POST['email'];
    $mobile=$_POST['mobile'];
    $password=$_POST['password'];
  

    $sql=" update `crud` set id=$id, name='$name', email='$email', mobile='$mobile', password='$password' where id=$id";

    $result=mysqli_query($con,$sql);
    if($result){
        echo "data updated successfully";
       header('location:display.php');

    }else {
        die(mysqli_error($con));
    }

}
?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" >

    <title>crud operation</title>
  </head>
  <body>
    <div class="container my-5" >
    <form method ="post">
  <div class="form-group">
    <label>Name</label>
 <input type="text" class="form-control" placeholder="Enter your name"name="name" autocomplete="off" value=<?php echo $name;?>>
</div>

<div class="form-group">
    <label>email</label>
    <input type="email" class="form-control" placeholder="Enter your email"name="email" autocomplete="off"value=<?php echo $email;?>>
</div>
<div class="form-group">
    <label>mobile</label>
    <input type="text" class="form-control" placeholder="Enter your mobile"name="mobile" autocomplete= "off"value=<?php echo $mobile;?>>
</div>
<div class="form-group">
    <label>password</label>
    <input type="text" class="form-control" placeholder="Enter your password"name="password" autocomplete="off"value=<?php echo $password;?>>
</div>
    
  <button type="submit" class="btn btn-primary"name="submit">Update</button>
</form>
</div>

  </body>
</html>
