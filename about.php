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
        content="clothing store, online shopping, used clothing, affordable fashion, Pastimes, fashion, thrift store">
    <meta name="revisit" content="30 days">
    <meta http-equiv="refresh" content="30">
    <meta name="robots" content="noindex, nofollow">
    <title>Pastimes Thrift Store Homepage </title>
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
                    <li class="currentPage">About Us</li>
                    <li><a href="catalogue.php">Catalogue</a></li>
                    <li><a href="cart.php"><img src="_images/cart_icon.png" alt="Cart Icon" width="15"> Cart</a></li>
                    <li><a href="contact.php">Contact Us</a></li>
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
        <section id="overview">
            <!-- Service Box Section with the new content -->
            <div class="service-box">
                <h4><u>Welcome to Pastimes Thrift Store</u></h4>
                <p>At Pastimes Thrift Store, we’re more than just an eShop – we’re a community driven by sustainable fashion and quality second-hand clothing. Our platform provides a simple, safe way to buy, sell, and trade branded, gently-used items right from home. We believe in giving every garment a second life, connecting people who value style, affordability, and eco-conscious shopping.</p>
            </div>

            <div class="service-box">
                <h4><u>Our Goals</u></h4>
                <ul>
                    <li><strong>Empower Users:</strong> Whether you’re buying or selling, we make it easy to navigate Pastimes. Enjoy user-friendly features like selecting items for purchase, managing shopping carts, and checking out seamlessly.</li>
                    <li><strong>Streamlined Selling:</strong> We simplify the selling process, allowing sellers to list their items with ease. Our dedicated team handles verification and communication to ensure smooth, reliable transactions.</li>
                    <li><strong>Enhanced User Experience:</strong> We prioritize quality interactions. Buyers can update their cart effortlessly, while sellers benefit from dedicated support to ensure that every item meets expectations.</li>
                    <li><strong>Build Trust and Safety:</strong> Our team works closely with buyers and sellers to handle inventory updates, quality checks, and secure deliveries, making every transaction effortless and trustworthy.</li>
                </ul>
            </div>

            
            <div class="service-box">
            <h4><u>Shop Sustainably, Shop Pastimes</u></h4>
            <p>Explore Pastimes Thrift Store and join us in reshaping fashion, one preloved item at a time. Our collection is carefully curated to offer you a unique mix of high-quality, gently used clothing and accessories that are not only affordable but also sustainable. Every piece in our store tells a story and carries a history, waiting for a new owner who will cherish it. Whether you’re looking for vintage treasures, modern styles, or one-of-a-kind finds, Pastimes Thrift Store is your destination for eco-conscious shopping that doesn’t compromise on style. Together, we can contribute to a more sustainable fashion industry while making your wardrobe truly unique!</p>
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
                        <li class="currentPage">About Us</li>
                        <li><a href="catalogue.php">Catalogue</a></li>
                        <li><a href="cart.php"><img src="_images/cart_icon.png" alt="Cart Icon" width="15"> Cart</a></li>
                        <li><a href="contact.php">Contact Us</a></li>
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