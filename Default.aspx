<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="shivani_ajax_._Default" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
      <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
 <script src="jquery-3.5.1.min.js"></script>
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.css">
       <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
    <title>Hello, world!</title>
  </head>
  <body>
     <div class="container-fluid">
   <div class="row">
   <div class="col-md-6">
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="text" class="form-control" id="name">
       <input type="hidden" id="hiddenid" />
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Username</label>
    <input type="text" class="form-control" id="username">
  </div>
       <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="Email" class="form-control" id="email">
  </div>
 
  <button id="submit" class="btn btn-primary">Submit</button>
  <button id="Update" class="btn btn-primary d-none">Update</button>
  
   </div>

   <div class="col-md-6">
       <table class="table" id="usertable">
       <asp:Repeater ID="Repeaters1" runat="server">
           <HeaderTemplate>
            <thead>
              <tr>
                 <th scope="col">id</th>
                <th scope="col">Name</th>
                <th scope="col">Username</th>
                <th scope="col">Email</th>
                <th scope="col">Action</th>
            </tr>
            </thead>

           </HeaderTemplate>
           <ItemTemplate>
               <tr>
                <td><%#Eval("id") %></td>
                <td><%#Eval("name") %></td>
                <td><%#Eval("username") %></td>
                <td><%#Eval("email") %></td>
                <td>
                    <button class="btn btn-success" id="edituser" data-name="<%#Eval("name") %>" data-username="<%#Eval("username") %>" data-email="<%#Eval("email") %>" data-id="<%#Eval("id") %>">Edit</button>
                    <button class="btn btn-danger"  id="deleteuser" data-id="<%#Eval("id") %>">Delete</button>
                </td>
                </tr>
           </ItemTemplate>
       </asp:Repeater>
           </table>
    </div>
       </div>
   </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" ></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.js"></script>
     <script>

         $(document).ready(function () {
              $('#usertable').DataTable();
             $("#submit").on('click', function () {
                 let name = $("#name").val();
                 console.log(name);
                 let username = $("#username").val();
                 console.log(username);
                 let email = $("#email").val();
                 console.log(email);


                 $.ajax({
                     method: "POST",
                     contentType: "application/json; charset=utf-8",
                     url: "WebService1.asmx/insertUser",
                     data: "{'name':'" + name + "','username':'" + username + "','email':'" + email + "'}",
                     success: function (resp) {
                         console.log('Response=====>', resp)
                         swal("Good job!", "You clicked the button!", "success").then(function () {
                             location.reload()
                         });
                     },
                     dataType: "json"
                 });
             })
             $("#Update").on('click', function () {
                    console.log('HEllo ')
                 let name = $("#name").val();
                 console.log(name);
                 let username = $("#username").val();
                 console.log(username);
                  let email = $("#email").val();
                  let hiddenid = $("#hiddenid").val();
                 console.log(email);

                   $.ajax({
                     method: "POST",
                     contentType: "application/json; charset=utf-8",
                     url: "WebService1.asmx/updateuser",
                     data: "{'name':'" + name + "','username':'" + username + "','email':'" + email + "','id':'" + hiddenid + "'}",
                     success: function (resp) {
                         console.log('Response=====>', resp)
                             swal("Successfully Updated!", "Your data updated !", "success").then(function () {
                              location.reload()
                          }); 
                     },
                     dataType: "json"
                 });
             })
                    
            
             $("#usertable").on('click','#edituser', function () {
                 let name = $(this).attr("data-name")
                  let username = $(this).attr("data-username");
                  let email = $(this).attr("data-email");
                 console.log('name---------->', name, username, email);
                   $("#hiddenid").val($(this).attr("data-id"))
                  $("#name").val(name)
                  $("#username").val(username);
                 $("#email").val(email);

                  $("#submit").addClass('d-none')
                  $("#Update").removeClass('d-none')
                        })
          
             $("#usertable").on('click','#deleteuser', function () {
               let hiddenid = $(this).attr("data-id")
                   $.ajax({
                     method: "POST",
                     contentType: "application/json; charset=utf-8",
                     url: "WebService1.asmx/Deleteuser",
                     data: "{'id':'" + hiddenid + "'}",
                     success: function (resp) {
                         console.log('Response=====>', resp)
                             swal("Deleted Successfully !","Your data deleted", "success").then(function () {
                              location.reload()
                          }); 
                     },
                     dataType: "json"
                 });
                  
             })
         })
     </script>
  </body>
    
</html>