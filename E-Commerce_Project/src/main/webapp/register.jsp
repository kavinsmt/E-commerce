<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<style type="text/css">
    @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
   background-image: url("https://images.unsplash.com/photo-1500993855538-c6a99f437aa7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80");
   background-size: cover;
   font-family: "Open Sans", sans-serif;
   min-height: 80vh;
}
img {
  width: 100%;
  border-bottom-left-radius: 10px;
  border-top-left-radius: 10px;
  display: block;
}
a {
  margin-left: 30px;
  color: #3c63cc;
  font-weight: 600;
}
a:hover {
  margin-left: 30px;
  color: #2fa1fd;
}
.modernForm {
  max-width: 1200px;
  display: flex;
  margin: 100px auto;
  background-color: #fff;
  border-radius: 10px;
}
.imageSection {
  flex-basis: 50%;
  position: relative;
  color: white;
}
.overlay {
  position: absolute;
  width: 100%;
  height: 100%;
  background-color: rgba(96, 30, 150, 0.507);
  border-bottom-left-radius: 10px;
  border-top-left-radius: 10px;
  z-index: 0;
}
.textInside,
.service {
  position: absolute;
}
.textInside {
  bottom: 70px;
  right: 100px;
  left: 20px;
}
.tagLine {
  font-size: 1.4rem;
  font-weight: 600;
}
.price {
  font-size: 2rem;
  font-weight: 700;
}
.service {
  bottom: 30px;
  right: 50px;
}
.service p {
  font-weight: 700;
}
.contactForm {
  flex-basis: 45%;
  margin: auto;
  color: #555;
  padding-left: 30px;
}
.contactForm h1 {
  padding: 15px 0;
}
input[type="email"],
input[type="number"],
input[type="text"],
input[type="date"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  border: rgb(177, 177, 177) 1px solid;
  margin-top: 10px;
}
.name {
  position: relative;
  margin-bottom: 20px;
}
.iconName {
  position: absolute;
  right: 10px;
  bottom: 10px;
}

input[type="checkbox"] {
  margin-right: 10px;
}
input[type="submit"] {
  background-color: #3c63cc;
  font-size: 1rem;
  border: none;
  color: white;
  padding: 10px 50px;
  border-radius: 5px;
  text-decoration: none;
  margin: 30px 0;
  cursor: pointer;
  float: left;
}
input[type="submit"]:hover {
  background-color: #2fa1fd;
}

@media only screen and (max-width: 768px) {
  .modernForm {
    flex-wrap: wrap;
  }
  .imageSection,
  .contactForm {
    flex-basis: 100%;
  }
  .overlay,
  img {
    border-bottom-left-radius: 0;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
  }
  .contactForm {
    padding-right: 30px;
  }
}

  </style>
</head>

  <body>
    <div class="modernForm">
      <div class="imageSection">
        <div class="image">
          <div class="overlay"></div>
          <img src="https://plus.unsplash.com/premium_photo-1675660733745-cb52470518ba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1854&q=80" alt="W3Schools.com">
        </div>
        <div class="textInside">
          <h1>Purchase in ShopAt get amazing discounts !</h1>
        </div>
      </div>
      <div class="contactForm">
        <h1>Registration</h1>
        <form action="register" method="post">
          <div class="name">
            <label for="fullName">Full Name:</label>
            <input type="text" name="name" id="fullName" required/>
            <div class="iconName"><i class="fa-solid fa-user"></i></div>
          </div>
          <div class="name">
            <label for="email">Your Email:</label>
            <input type="email" name="mail" id="email" required />
            <div class="iconName"><i class="fa-solid fa-envelope"></i></div>
          </div>
           <div class="name">
            <label for="mobile">Your Mobile:</label>
            <input type="number" name="mobile" id="mobile" required />
            <div class="iconName"><i class="fa-solid fa-envelope"></i></div>
          </div>
          <div class="name">
            <label for="gender">Gender:</label>
            <input type="checkbox" name="gender" id="gender" value="male"/>
            <label for="gender">Male</label>
            <input type="checkbox" name="gender" id="gender" value="female"/>
            <label for="gender">Female</label>
            <input type="checkbox" name="gender" id="gender" value="others"/>
            <label for="gender">Others</label>
            <div class="iconName"><i class="fa-solid fa-envelope"></i></div>
          </div>
          <div class="name">
            <label for="dob">DOB :</label>
            <input type="date" name="dob" id="dob" required />
            <div class="iconName"><i class="fa-solid fa-lock"></i></div>
          </div>
          <div class="name">
            <label for="Password">Password:</label>
            <input type="password" name="password" id="password" required />
            <div class="iconName"><i class="fa-solid fa-lock"></i></div>
          </div>
          <div class="name">
            <label for="Password">Confirm Password:</label>
            <input type="password" name="password" id="password" required />
            <div class="iconName"><i class="fa-solid fa-lock"></i></div>
          </div>
          <div class="checkbox">
            <input type="checkbox" id="checkbox" name="checkbox" required>
            <label for="checkbox">By signing up, you agree to the
             <p><a href="#">Terms and condition</p></label>
          </div>
          <input type="submit" value="Register">
        </form>
      </div>
    </div>
  </body>
        </html>