final RegExp _emailRegex = RegExp(r'^[\w.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$');

bool isValidFullName(String value) => value.trim().isNotEmpty;

bool isValidEmail(String value) => _emailRegex.hasMatch(value);

bool isValidPassword(String value) => value.isNotEmpty;

bool doPasswordsMatch(String password, String confirmPassword) =>
    password.isNotEmpty && password == confirmPassword;
