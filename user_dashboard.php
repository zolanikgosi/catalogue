<?php
session_start();  // Only call session_start() once

include 'DBConn.php';  // Ensure the DBConn.php file correctly initializes $dbConnection



// Fetch the user ID from the session
$userID = $_SESSION['userID']; // assuming userID is stored in session after login

// Ensure that $dbConnection is initialized in the DBConn.php file
if (!$dbConnection) {
    die("Database connection failed.");
}

// Fetch user data
$sql = "SELECT * FROM tbluser WHERE userID = $userID";
$result = $dbConnection->query($sql);

if ($result) {
    $user = $result->fetch_assoc();
} else {
    echo "Error fetching user data: " . $dbConnection->error;
    exit;
}

// Fetch orders
$orderSql = "SELECT * FROM tblaorder WHERE userID = $userID";
$orderResult = $dbConnection->query($orderSql);

// Fetch payment history
$paymentSql = "SELECT * FROM tblaorder WHERE userID = $userID";
$paymentResult = $dbConnection->query($paymentSql);

// Fetch total purchases
$totalSql = "SELECT SUM(totalAmount) AS totalAmount FROM tblaorder WHERE userID = $userID";
$totalResult = $dbConnection->query($totalSql);
$total = $totalResult->fetch_assoc()['totalAmount'];


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Pastimes is your go-to online store for high-quality branded used clothing, offering top-notch fashion at affordable prices.">
    <meta name="keywords" content="clothing store, online shopping, used clothing, affordable fashion, Pastimes, fashion">
    <meta name="revisit" content="30 days">
    <meta http-equiv="refresh" content="30">
    <meta name="robots" content="noindex, nofollow">
    <title> Pastimes Thrift Store - User Dashboard</title>
    <link rel="stylesheet" href="style.css"> <!-- External CSS -->
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
                    <li><a href="contact.php">Contact Us</a></li>
                    <li><a href="admin_login.php">Admin</a></li>
                    <li class="currentPage">My Dashboard</li>
                    <li><a href="logout.php">Log Out</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <section id="hero">
            <div class="user-dashboard-container">

                <div class="user-main-content">
                    <h3>Welcome, <?php echo $user['name']; ?></h3><br>
                    <nav>
                        <div class="dash-colour">
                        <a href="#order-status">Track Orders</a>
                        </div>
                        <div class="dash-colour">                    
                        <a href="#payment-history">Payment History</a>
                        </div>
                        <div class="dash-colour">
                        <a href="#personal-info">Personal Info</a>
                        </div>
                        <div class="dash-colour">
                        <a href="#report">View Report</a>
                        </div>

                    </nav>

                    <div id="order-status">
                        <h2>Order Status</h2>
                        <?php if ($orderResult->num_rows > 0) {
                            while ($order = $orderResult->fetch_assoc()) {
                                echo "<p>Order #" . $order['orderID'] . " - Status: " . $order['orderStatus'] . "</p>";
                            }
                        } else {
                            echo "<p>No orders found.</p>";
                        } ?>
                    </div>


                    <div id="payment-history">
                        <h2>Payment History</h2>
                        <?php if ($paymentResult->num_rows > 0) {
                            echo "<table><tr><th>Payment Date</th><th>Amount</th></tr>";
                            while ($payment = $paymentResult->fetch_assoc()) {
                                echo "<tr><td>" . $payment['orderDate'] . "</td><td>" . $payment['totalAmount'] . "</td></tr>";
                            }
                            echo "</table>";
                        } else {
                            echo "<p>No payment history found.</p>";
                        } ?>
                    </div>

                    <div id="personal-info">
                        <h2>Personal Information</h2>
                        <p>Name: <?php echo $user['name']; ?></p>
                        <p>Email: <?php echo $user['email']; ?></p>
                    </div>

                    <div id="report">
                        <h2>Purchase Report</h2>
                        <p>Total Purchases: R<?php echo number_format($total, 2); ?></p>
                    </div>

                </div>

            </div>
        </section>
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
                        <li><a href="contact.php">Contact Us</a></li>
                        <li><a href="admin_login.php">Admin</a></li>
                        <li class="currentPage">My Dashboard</li>
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