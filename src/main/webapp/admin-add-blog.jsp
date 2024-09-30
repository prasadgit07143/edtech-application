<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="/resources/assets/img/favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>Add Challenge</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/assets/css/demo.css"/>
    <style>
        body {
            background: #f2f2f2; /* Light gray background */
            font-size: 18px; /* Larger font size for the entire page */
        }

        .wrapper {
            padding: 20px; /* Padding for the wrapper */
        }

        .form-container {
            padding: 40px; /* Increased padding for aesthetics */
            border: 1px solid #ddd; /* Light border */
            border-radius: 10px; /* More rounded corners */
            background-color: #ffffff; /* White background for the form */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Subtle shadow effect */
            width: 100%; /* Full width */
            max-width: 900px; /* Optional: set a max width */
            margin: auto; /* Center the form */
        }

        h2 {
            color: #333333; /* Darker text color */
            font-weight: 700; /* Bold header */
            margin-bottom: 30px; /* Increased space below the header */
            font-size: 24px; /* Larger header font size */
        }

        .form-group {
            margin-bottom: 20px; /* Increased space between form groups */
        }

        label {
            font-weight: 600; /* Bold labels */
            font-size: 18px; /* Larger label font size */
        }

        input.form-control, textarea.form-control {
            border-radius: 5px; /* Rounded inputs */
            border: 1px solid #ccc; /* Light border */
            transition: border-color 0.3s; /* Smooth transition for focus effect */
            font-size: 16px; /* Larger input font size */
        }

        input.form-control:focus, textarea.form-control:focus {
            border-color: #007bff; /* Bootstrap primary color on focus */
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Light blue glow on focus */
        }

        .btn {
            border-radius: 5px; /* Rounded buttons */
            margin-top: 10px; /* Space above buttons */
            padding: 10px 20px; /* Larger button padding */
            font-size: 18px; /* Larger button font size */
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="/navbar.jsp"/>
<div class="wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Add Blog</h2>
                <div class="form-container">
                    <form action="/admin/add/blog" method="post">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="blogTitle">Blog Title:</label>
                                <input type="text" id="blogTitle" name="blogTitle" class="form-control"
                                       required/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="blogTopic">Blog Topic:</label>
                                <input type="text" id="blogTopic" name="blogTopic" class="form-control"
                                       required/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="blogContent">Blog Content:</label>
                                <textarea id="blogContent" name="blogContent" class="form-control"
                                          required></textarea>
                            </div>
                        </div>
                        <input type="submit" value="Submit" class="btn btn-primary"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
