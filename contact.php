<?php
session_start();
include 'DBConn.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description"
        content="Pastimes is your go-to thrift store for high-quality branded used clothing, offering top-notch fashion at affordable prices.">
    <meta name="keywords"
        content="clothing store, online shopping, used clothing, affordable fashion, Pastimes, fashion,thrift store">
    <meta name="revisit" content="30 days">
    <meta http-equiv="refresh" content="30">
    <meta name="robots" content="noindex, nofollow">
    <title>Pastimes Thrift Store - Contact Us Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <header>
        <div class="header-container">
            <!-- Logo on the left -->
            <div class="logo-container">
                <img src="_images/pastimes_logo.jpg" alt="Pastimes Logo" width="150">
            </div>

            <!-- Top Navigation Menu -->
            <nav class="top-nav">
                <ul>
                    <li><a href="index.php">Home</a></li>
                    <li><a href="about.php">About Us</a></li>
                    <li><a href="catalogue.php">Catalogue</a></li>
                    <li><a href="cart.php"><img src="_images/cart_icon.png" alt="Cart Icon" width="15"> Cart</a></li>
                    <li class="currentPage">Contact Us </li>
                    <li><a href="admin_login.php">Admin</a></li>
                    <li><a href="user_dashboard.php">My Dashboard</a></li>
                    <li><a href="logout.php">Log Out</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
        <!-- Display logged-in user's name -->
        <?php
        if (isset($_SESSION['name'])) {
            echo "<p class='welcome-message'>User " . htmlspecialchars($_SESSION['name']) . " is logged in.</p>";
        } else {
            echo "<p class='welcome-message'>Welcome, guest! Please log in to access more features.</p>";
        }
        ?>
    </div>

    <main>

        <div class="contact-container">
            <!-- Message Us Section -->
            <div class="contact-form">
                <h2>Message Us</h2>
                <form action="contact.php" method="POST">
                    <label for="name">Name:</label>
                    <input type="text" name="name" id="name"
                        value="<?= isset($_POST['name']) ? htmlspecialchars($_POST['name']) : ''; ?>" required><br>

                    <label for="email">Email:</label>
                    <input type="email" name="email" id="email"
                        value="<?= isset($_POST['email']) ? htmlspecialchars($_POST['email']) : ''; ?>" required><br>

                    <label for="subject">Subject:</label>
                    <input type="text" name="subject" id="subject"
                        value="<?= isset($_POST['subject']) ? htmlspecialchars($_POST['subject']) : ''; ?>" required><br>

                    <label for="message">Message:</label>
                    <textarea name="message" id="message"
                        required><?= isset($_POST['message']) ? htmlspecialchars($_POST['message']) : ''; ?></textarea><br>

                    <button type="submit" name="submit">Send Message</button>
                </form>
            </div>

            <!-- Display Feedback if Submitted -->
            <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $name = htmlspecialchars($_POST['name']);
                $email = htmlspecialchars($_POST['email']);
                $subject = htmlspecialchars($_POST['subject']);
                $message = htmlspecialchars($_POST['message']);

                if (!empty($name) && !empty($email) && !empty($subject) && !empty($message)) {
                    echo "<div class='success'>Thank you, <strong>$name</strong>. We have received your message.</div>";
                } else {
                    echo "<div class='error'>Please fill in all fields correctly.</div>";
                }
            }
            ?>
        </div>
    </main>

    <footer>
        <!-- Footer Navigation Menu -->
        <div class="footer-container">
            <div class="footer-info">
                <nav class="footer-nav">
                    <ul>
                        <li><a href="index.php">Home</a></li>
                        <li><a href="about.php">About Us</a></li>
                        <li><a href="catalogue.php">Catalogue</a></li>
                        <li><a href="cart.php"><img src="_images/cart_icon.png" alt="Cart Icon" width="15"> Cart</a></li>
                        <li class="currentPage">Contact Us </li>
                        <li><a href="admin_login.php">Admin</a></li>
                        <li><a href="user_dashboard.php">My Dashboard</a></li>
                        <li><a href="logout.php">Log Out</a></li>
                    </ul>
                </nav>


                <!-- Contact Information and Social Media Links -->

                <div class="contact-info">
                    <h4>Address</h4>
                    <p><img src="_images/location_icon.png" alt="Address Icon" width="5%"> 28 Blueberry Street, <br> Honeydew, <br> Johannesburg, 2170</p>
                </div>
                <div class="social-media">
                    <h4>Let's Connect</h4>
                    <a href="https://www.instagram.com/kgosi.makuva/profilecard/?igsh=eXVrbG1na2x0a3Nw" target="_blank">
                        <img src="_images/instagram_icon.png" alt="Instagram Icon" width="20"> kgosi.makuva
                    </a>
                    <p><a href="mailto:pastimesthriftstore28@gmail.com">pastimesthriftstore28@gmail.com</a></p>
                </div>

            </div>

            <div class="footer-bottom">
                <p>&copy; <?php echo date("Y"); ?> - Pastimes Thrift Store | Last modified: <?php echo date("F d, Y", filemtime(__FILE__)); ?></p>
                <p>Powered by "Exclusive Fashion"</p>
            </div>
        </div>

    </footer>
</body>

</html>