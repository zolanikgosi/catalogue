<?php
session_start();
include 'DBConn.php';


// Ensure 'user_id' is set in the session
if (!isset($_SESSION['userID'])) {
    echo "You must be logged in to place an order.";
    exit();
}

// Initialize cart if it’s not set
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

// Initialize order variables
$order_number = rand(100000, 999999); // Random order number (can be changed)
$reference_number = 'REF-' . strtoupper(uniqid()); // Unique reference number
$total_amount = 0;

// Calculate total amount for the order considering quantity
foreach ($_SESSION['cart'] as $item) {
    $total_amount += $item['price'] * $item['quantity'];  // Multiply price by quantity
}

// Check if form data has been submitted, and sanitize the shipping details
$address = isset($_POST['address']) ? htmlspecialchars($_POST['address']) : '';
$postcode = isset($_POST['postcode']) ? htmlspecialchars($_POST['postcode']) : '';
$city = isset($_POST['city']) ? htmlspecialchars($_POST['city']) : '';

// Store the address details in session (optional, if you want to keep them for later)
$_SESSION['address'] = $address;
$_SESSION['postcode'] = $postcode;
$_SESSION['city'] = $city;

// Construct the shipping address
$shippingAddress = $address . ', ' . $postcode . ', ' . $city;


// Assuming the user session contains a logged-in user ID
$userID = $_SESSION['userID'];
$adminID = 1;  // Assuming adminID is set (replace as needed)


// Prepare SQL query
$query = "INSERT INTO tblaorder (userID, adminID, orderStatus, totalAmount, shippingAddress)
          VALUES (?, ?, ?, ?, ?)";

// Check if the statement is prepared successfully
if ($stmt = $dbConnection->prepare($query)) {
    // Default values
    $status = "pending"; 
    $shippingAddress = $address . ', ' . $postcode . ', ' . $city;

    // Bind parameters: "iiisss" means 3 integers and 3 strings
    $stmt->bind_param("iisss", $userID, $adminID, $status, $total_amount, $shippingAddress);

    // Execute the statement
    if ($stmt->execute()) {
        echo "Order successfully inserted.";
    } else {
        echo "Error executing query: " . $stmt->error;
    }
} else {
    // If the prepare() fails, show the error
    echo "Error preparing statement: " . $dbConnection->error;
}


// Get the order_id after insertion
$order_id = $dbConnection->insert_id;

// Store order ID in session for use later (for example, for payment processing or confirmation)

// Store order ID in session for use later (for example, for payment processing or confirmation)
$_SESSION['orderID'] = $order_id;
$_SESSION['orderNumber'] = $order_number;
$_SESSION['referenceNumber'] = $reference_number;
$_SESSION['sessionID'] = session_id();


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
    <title>Checkout - Order Summary</title>
</head>

<body>
    <h2>Order Summary</h2>
    <p><strong>Order Number:</strong> <?php echo $order_number; ?></p>
    <p><strong>Reference Number:</strong> <?php echo $reference_number; ?></p>
    <p><strong>Session ID:</strong> <?php echo session_id(); ?></p>
    <p><strong>Shipping Address:</strong> <?php echo $shippingAddress; ?></p>
    <p><strong>Total Amount:</strong> R<?php echo number_format($total_amount, 2); ?></p>

    <h3>Cart Items:</h3>
    <table border="1">
        <thead>
            <tr>
                <th>Item Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($_SESSION['cart'] as $item) : ?>
                <tr>
                    <td><?php echo $item['item_name']; ?></td>
                    <td>R<?php echo number_format($item['price'], 2); ?></td>
                    <td><?php echo $item['quantity']; ?></td> <!-- Displaying the quantity -->
                    <td>R<?php echo number_format($item['price'] * $item['quantity'], 2); ?></td> <!-- Calculating total per item -->
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <form method="post" action="checkout.php">
        <button type="submit" name="confirm_order">Confirm Order</button>
    </form>

    <?php
    // If the user confirms the order, update the order status and redirect
    if (isset($_POST['confirm_order'])) {
      
        
        // Loop through cart items and update stock quantities in tbl_item
        foreach ($_SESSION['cart'] as $cart_item) {
            // Retrieve the item ID and quantity from the cart session array
            $item_id = $cart_item['item_id']; // Make sure 'item_id' exists in each cart item
            $quantity = $cart_item['quantity']; // Check if 'quantity' is correctly set for each item

            // Update stock for each item
            $update_stock_query = "UPDATE tbl_item SET stock_quantity = stock_quantity - ? WHERE item_id = ?";
            $stock_stmt = $dbConnection->prepare($update_stock_query);
            $stock_stmt->bind_param("ii", $quantity, $item_id);

            if (!$stock_stmt->execute()) {
                echo "Error updating stock for item ID: " . $item_id;
            }
        }

        // Clear the cart after order confirmation
        unset($_SESSION['cart']);

        unset($_SESSION['orderNumber'], $_SESSION['referenceNumber'], $_SESSION['sessionID']);




        // Redirect to the login page or another confirmation page
        header('Location: user_login.php');
        exit();
    }
    ?>
</body>
</html>