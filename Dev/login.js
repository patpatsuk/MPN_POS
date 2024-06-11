function login() {
    // Get username and password
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    // Simple validation for demonstration purposes
    if (username === "admin" && password === "password") {
        // Redirect to the desired page
        href = "./Dev/pos-select.html";
    } else {
        alert("Invalid credentials, please try again.");
    }
}