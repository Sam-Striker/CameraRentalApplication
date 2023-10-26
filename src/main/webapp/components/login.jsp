<%--
  Created by IntelliJ IDEA.
  User: STRIKER
  Date: 10/20/2023
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="userBean" class="com.samuel.camerarentapplication.BEAN.UserBean" scope="request" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CameraRentApp</title>
    <link rel="stylesheet" href="../css/style.css" />
</head>
<body>
<div class="section">
    <div class="banner">
        <h1 class="logo">Welcome Here!</h1>
    </div>
    <div class="login-section">
        <div class="login-card active" id="login">
            <div class="header">
                <h3 class="header">Login</h3>
            </div>
            <form action="../controller/authenticate.jsp" method="post">

                <div class="form-error">
                    <small style="color: red;">${userBean.errorMessage}</small>
                    <small style="color: green;">${userBean.infoMessage}</small>
                </div>

                <div class="form-input">
                    <label for="email">NationalID</label>
                    <input type="text" name="email" id="email" value="${userBean.nationalID}" />
                </div>

                <div class="form-input">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" value="${userBean.password}" />
                </div>

                <button type="submit">Login</button>
                <p class="form-check">
                    New here? <a href="#" id="registerLink" style="color: #F5F5DC">Register</a>
                </p>
            </form>
        </div>

        <div class="register-card" id="register">
            <div class="header">
                <h3 class="header">Register</h3>
            </div>
            <form action="../controller/createUser.jsp" method="post">
                <div class="form-error">
                    <small style="color: darkred;">${userBean.errorMessage}</small>
                    <small style="color: green;">${userBean.infoMessage}</small>
                </div>

                <div class="form-input">
                    <label for="nationalID">National ID</label>
                    <input type="text" name="nationalID" id="nationalID"/>
                </div>

                <div class="form-input">
                    <label for="Username">Username</label>
                    <input type="text" name="username" id="username"/>
                </div>

                <div class="form-input">
                    <label for="password2">Password</label>
                    <input type="password" name="password" id="password2" />
                </div>

                <div class="form-input">
                    <label for="address">Address</label>
                    <input type="text" name="address" id="address"/>
                </div>

                <div class="form-input">
                    <label for="phoneNbr">Phone Number</label>
                    <input type="tel" name="phoneNbr" id="phoneNbr"/>
                </div>

                <div class="form-input">
                    <label for="date">Date</label>
                    <input type="date" name="date" id="date"/>
                </div>

                <div class="form-input">
                    <label for="role">Role</label>
                    <select name="role" id="role" >
                        <option value="" disabled selected>Select a role</option>
                        <option value="client">Client</option>
                        <option value="seller">Seller</option>

                    </select>
                </div>

                <button type="submit">Create</button>
                <p class="form-check">
                    Already in? <a href="#" id="loginLink" style="color: #F5F5DC">Login</a>
                </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>

<script defer>
    const login = document.getElementById("login");
    const register = document.getElementById("register");
    const loginLink = document.getElementById("loginLink");
    const registerLink = document.getElementById("registerLink");

    loginLink.addEventListener("click", () => {
        login.classList.add("active");
        register.classList.remove("active");
    });
    registerLink.addEventListener("click", () => {
        register.classList.add("active");
        login.classList.remove("active");
    });


    function validateRegistrationForm() {
        const nationalID = document.getElementById("nationalID").value;
        const username = document.getElementById("username");
        const password = document.getElementById("password2");
        const address = document.getElementById("address");
        const phoneNbr = document.getElementById("phoneNbr");
        const date = document.getElementById("date");
        const role = document.getElementById("role");

        const nameRegex = /^[A-Za-z\s]+$/; // for letters and spaces
        const passwordRegex = /^.{5,}$/; // At least 5 characters
        const phoneRegex = /^\d{10}$/; // Exactly 10 digits

        function validateField(input, regex) {
            if (!input.value.match(regex)) {
                input.setCustomValidity("Invalid input");
            } else {
                input.setCustomValidity("");
            }
        }

        username.addEventListener("input", () => validateField(username, nameRegex));
        password.addEventListener("input", () => validateField(password, passwordRegex));
        address.addEventListener("input", () => validateField(address, nameRegex));
        phoneNbr.addEventListener("input", () => validateField(phoneNbr, phoneRegex));

        if (!nationalID || !date || role.value === "default") {
            alert("Please fill in all required fields.");
            return false;
        }

        return true;
    }

</script>